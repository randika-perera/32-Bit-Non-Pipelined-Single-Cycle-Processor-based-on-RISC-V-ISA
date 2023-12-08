//`timescale 1ns / 1ps

module Controller     // Controller is designed using microprogrammed approach
(

    // Input to Controller is the 7-bit opcode from instruction
    input logic [6:0] Opcode, 

    // Output from Controller are the control signals
    output logic ALUSrc, 
    output logic MemtoReg, 
    output logic RegtoMem, 
    output logic RegWrite, 
    output logic MemRead, 
    output logic MemWrite, 
    output logic Branch,
    output logic [1:0] ALUOp,
    output logic Con_Jalr, Con_Jal, Mem, OpI, Con_AUIPC, Con_LUI

);

    logic [14:0] rom_data [0:512];

    // Control bits for each instruction type
    logic [14:0] control_bits_for_R_TYPE   = 15'b000100010000000;   // R-Type Computational
    logic [14:0] control_bits_for_LW       = 15'b110110000001000;   // I-Type Memory Access
    logic [14:0] control_bits_for_SW       = 15'b101001000001000;   // S-Type Memory Access
    logic [14:0] control_bits_for_RI_TYPE  = 15'b100100000000100;   // I-Type Computational
    logic [14:0] control_bits_for_BR_TYPE  = 15'b000000101000000;   // SB-Type Control Transfer
    logic [14:0] control_bits_for_JALR     = 15'b000101000100000;
    logic [14:0] control_bits_for_JAL      = 15'b000100000010000;
    logic [14:0] control_bits_for_AUIPC    = 15'b000000000000010;
    logic [14:0] control_bits_for_LUI      = 15'b000000000000001;

    always_comb                
        begin                  
            rom_data[7'b0110011] <= control_bits_for_R_TYPE;
            rom_data[7'b0000011] <= control_bits_for_LW;
            rom_data[7'b0100011] <= control_bits_for_SW;
            rom_data[7'b0010011] <= control_bits_for_RI_TYPE;
            rom_data[7'b1100011] <= control_bits_for_BR_TYPE;
            rom_data[7'b1100111] <= control_bits_for_JALR;
            rom_data[7'b1101111] <= control_bits_for_JAL;
            rom_data[7'b0010111] <= control_bits_for_AUIPC;
            rom_data[7'b0110111] <= control_bits_for_LUI;
        end

    assign ALUSrc    =  rom_data[Opcode][14];
    assign MemtoReg  =  rom_data[Opcode][13];
    assign RegtoMem  =  rom_data[Opcode][12];
    assign RegWrite  =  rom_data[Opcode][11];
    assign MemRead   =  rom_data[Opcode][10];
    assign MemWrite  =  rom_data[Opcode][9];
    assign Branch    =  rom_data[Opcode][8];
    assign ALUOp     =  rom_data[Opcode][7:6];
    assign Con_Jalr  =  rom_data[Opcode][5];
    assign Con_Jal   =  rom_data[Opcode][4];
    assign Mem       =  rom_data[Opcode][3];
    assign OpI       =  rom_data[Opcode][2];
    assign Con_AUIPC =  rom_data[Opcode][1];
    assign Con_LUI   =  rom_data[Opcode][0];

endmodule
