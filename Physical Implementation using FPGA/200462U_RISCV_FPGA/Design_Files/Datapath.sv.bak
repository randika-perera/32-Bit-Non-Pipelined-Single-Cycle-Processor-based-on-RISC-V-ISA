`timescale 1ns / 1ps

module Datapath#(

    parameter PC_W = 9,          // Program Counter Width
    parameter INS_W = 32,        // Instruction Width
    parameter RF_ADDRESS = 5,    // Register File Address
    parameter DATA_W = 32,       // Data WriteData
    parameter DM_ADDRESS = 9,    // Data Memory Address
    parameter ALU_CC_W = 4       // ALU Control Code Width
    
    )
    (

    // Control Signals used to control the datapath modules
    input logic 
        clk ,                    // Global clock
        reset ,                  // Reset
        RegWrite ,               // RegFile write enable
        MemtoReg ,               // MUX Select : 1 = Load Data  , 0 = ALU Result
        RegtoMem,                // MUX Select : 1 = Store Data , 0 = RegFile ReadData2
        ALUsrc ,
        MemWrite ,               // Data Memory Write Enable
        MemRead ,                // Data Memory Read  Enable

    // Control signals used for branching, jumping, and ALU operations
    input logic Con_beq,         // Branch on equal condition signal. 
    input logic Con_bnq,         // Branch on not equal condition signal. 
    input logic Con_bgt,         // Branch on greater than condition signal. 
    input logic Con_blt,         // Branch on less than condition signal.
    input logic Con_Jalr,        // Jump and link register instruction signal.
    input logic Jal,             // Jump and link instruction signal. 
    input logic AUIPC, LUI,      // AUIPC and LUI instruction signals. 
    input logic [ALU_CC_W-1:0] ALU_CC,     // ALU Control Code 

    // Output signals that will carry information about the instruction being executed
    output logic [6:0] opcode,             // Instruction opcode
    output logic [6:0] Funct7,             // Instruction funct7
    output logic [2:0] Funct3,             // Instruction funct3 

    // Result of the ALU operation
    output logic [31:0] ALU_Result         // Result of the ALU operation

    );

    // Defining the datapath signals (ports)
    logic [8:0]  PC, PCPlus4, PCValue, BranchPC;
    logic [31:0] Instr, PCPlusImm, PCJalr, LD,ST, Store_data;
    logic [31:0] Result;
    logic [31:0] Reg1, Reg2;
    logic [31:0] ReadData;
    logic [31:0] SrcB, ALUResult;
    logic [31:0] ExtImm;
    logic [31:0] PC_unsign_extend;
    logic [31:0] Read_Alu_Result, Jal_test,aui_data, lui_data;
    logic [1:0] PCSel;
    logic zero, Con_BLT, Con_BGT, Jalr, Branch; 

    assign PC_unsign_extend = {23'b0, PC};
    assign Branch = (Con_beq&&zero)||(Con_bnq&&!zero)||(Con_bgt&&Con_BGT)||(Con_blt&&Con_BLT)||Jal;
    assign Jalr = Con_Jalr;

    // Extracting the instruction opcode, funct7, and funct3 from the instruction
    assign opcode = Instr[6:0];
    assign Funct7 = Instr[31:25];
    assign Funct3 = Instr[14:12];

    // PCPlus4 = PC + 4                          (9 bit operation)
    adder #(9) pcadd1 (PC, 9'b100, PCPlus4);  

    // PCPusImm = PC_unsign_extend + ExtImm      (32 bit operation)
    adder_32 #(32) pcadd2 (PC_unsign_extend, ExtImm, PCPlusImm);

    // PCJalr = ExtImm + Reg1                    (32 bit operation)
    adder_32 #(32) pcadd3 (ExtImm, Reg1, PCJalr);

    // BranchPC = Branch ? PCPlusImm[8:0] : PCPlus4
    mux2 next_pc1(PCPlus4,PCPlusImm[8:0], Branch, BranchPC);

    // PCValue = Jalr ? PCJalr[8:0] : BranchPC
    mux2 next_pc2(BranchPC, PCJalr[8:0], Jalr, PCValue);

    // At positive clock edges, PC is updated with the new PCValue
    flopr #(9) pcreg(clk, reset, PCValue, PC);

    // Give PC as input to the instr_mem and get Instr(Instruction) as output
    instructionmemory instr_mem (PC, Instr);

    // Use Instr(Instruction from instruction memory) and Reg2(Data from data memory) to extract the information and assign it to ST
    data_extract store_data_ex(Instr, Reg2, ST);

    // Store_data = RegtoMem ? ST : Reg2
    mux2 #(32) resmux_store(Reg2, ST, RegtoMem, Store_data);

    /*      Define register file (rf)
    clk = Clock Signal
    reset = Reset Signal
    RegWrite = Write Enable Signal
    Instr[11:7]  = Address of Write Register   (rd)
    Instr[19:15] = Address of Read Register 1  (rs1)
    Instr[24:20] = Address of Read Register 2  (rs2)
    Result = Write Data Port  (Data to be stored in rd)
    Reg1   = Read Data Port 1 (Gets value of rs1)
    Reg2   = Read Data Port 2 (Gets value of rs2)        */
    RegFile rf(clk, reset, RegWrite, Instr[11:7], Instr[19:15], Instr[24:20], Result, Reg1, Reg2);

    // Use Instr(Instruction from instruction memory) and ReadData(Data from data memory) to extract the information and assign it to LD
    data_extract load_data_ex(Instr, ReadData, LD);

    // Read_ALU_Result = MemtoReg ? LD : ALUResult
    mux2 #(32) resmux(ALUResult, LD, MemtoReg, Read_Alu_Result);

    // Jal_test = (Jal OR Jalr) ? {23'b0,PCPlus4} : Read_Alu_Result
    mux2 #(32) resmux_jal(Read_Alu_Result, {23'b0, PCPlus4}, (Jal||Jalr), Jal_test);

    // aui_data = AUIPC ? PCPlusImm : Jal_test
    mux2 #(32) resmux_auipc(Jal_test, PCPlusImm, AUIPC, aui_data);

    // Use Instr(Instruction) to generate ExtImm(Extended Immediate Operand)
    imm_Gen Ext_Imm (Instr,ExtImm);

    // SrcB = (ALUsrc OR Jal OR Jalr) ? ExtImm : Reg2
    mux2 #(32) srcbmux(Reg2, ExtImm, (ALUsrc||Jal||Jalr), SrcB);

    /*   Define ALU (alu_module)
    SrcA       = Reg1
    SrcB       = SrcB
    Operation  = ALU_CC
    ALUResult  = ALUResult
    Con_BLT    = Con_BLT
    Con_BGT    = Con_BGT
    zero       = zero         */
    alu alu_module(Reg1, SrcB, ALU_CC, ALUResult, Con_BLT, Con_BGT, zero);

    // Result = LUI ? ExtImm : aui_data
    mux2 #(32) resmux_lui(aui_data, ExtImm, LUI, Result);

    assign ALU_Result = Result;

    /*      Define data memory module (data_mem)
    Clock Signal   = clk
    Memory Read Enable Signal  = MemRead
    Memory Write Enable Signal = MemWrite
    Address Bus   = ALUResult[8:0]
    WriteData Bus = Store_data
    ReadData Bus  = ReadData                  */
    datamemory data_mem (clk, MemRead, MemWrite, ALUResult[8:0], Store_data, ReadData);   

endmodule
