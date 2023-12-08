//`timescale 1ns / 1ps

module RISC_V#(
    parameter DATA_W = 32
    )
    (
    input  logic clk, reset,      // Clock and reset
    output logic [31:0] WB_Data,  // The ALU_Result
    output logic [3:0]RISC_DM11_TENS,
    output logic [3:0]RISC_DM11_UNITS,
    output logic [3:0]RISC_DM12_TENS,
    output logic [3:0]RISC_DM12_UNIT,
    output logic RISC_RF19,
    output logic RISC_RF21,
    output logic [3:0]RISC_RF18_TENS,
    output logic [3:0]RISC_RF18_UNITS,
    output logic [3:0]RISC_RF20_TENS,
    output logic [3:0]RISC_RF20_UNITS
    );

    logic [6:0] opcode;
    logic ALUSrc, MemtoReg,RegtoMem, RegWrite, MemRead, MemWrite, Con_Jalr;
    logic Con_beq, Con_bnq, Con_bgt, Con_blt, Con_Jal,Branch, Mem,OpI,AUIPC,LUI;

    

    logic [1:0] ALUop;
    logic [6:0] Funct7;
    logic [2:0] Funct3;
    logic [3:0] Operation; 

    Controller c(opcode, ALUSrc, MemtoReg,RegtoMem, RegWrite, MemRead, MemWrite, Branch, ALUop, Con_Jalr,Con_Jal,Mem, OpI, AUIPC, LUI);

    ALUController ac(ALUop, Funct7, Funct3, Branch,Mem,OpI,AUIPC, Operation, Con_beq, Con_bnq, Con_blt, Con_bgt);

    Datapath dp(clk, reset, RegWrite , MemtoReg, RegtoMem, ALUSrc , MemWrite, MemRead, Con_beq, Con_bnq, Con_bgt, Con_blt, Con_Jalr,Con_Jal, AUIPC, LUI,Operation, opcode, Funct7, Funct3, WB_Data,RISC_DM11_TENS[3:0],RISC_DM11_UNITS[3:0],RISC_DM12_TENS[3:0],RISC_DM12_UNIT[3:0],RISC_RF19,RISC_RF21,RISC_RF18_TENS[3:0],RISC_RF18_UNITS[3:0],RISC_RF20_TENS[3:0],RISC_RF20_UNITS[3:0]);

endmodule
