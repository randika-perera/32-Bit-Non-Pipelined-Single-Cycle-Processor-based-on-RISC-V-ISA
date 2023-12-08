`timescale 1ns / 1ps

module datamemory#(
    parameter DM_ADDRESS = 9 , // 9 bit address bus
    parameter DATA_W = 32      // 32 bit data bus
    )
    (
    input logic clk,           // Clock
	 input logic MemRead ,      // Read signal from the control unit
    input logic MemWrite ,     // Write signal from the control unit

    input  logic [DM_ADDRESS-1:0] a ,   // Address bus (Read/Write address) = 9 LSB bits of the ALU output
    input  logic [DATA_W-1:0] wd    ,   // Write data bus
    output logic [DATA_W-1:0] rd        // Read data bus
    );

    logic [DATA_W-1:0] mem [(2**DM_ADDRESS)-1:0];     // Data memory array with capacity of 512 words with each word of size 32 bits

    // Data memory will be initialized with the following values
    initial           
        begin
            mem[0]  = 32'h00000000;  // 0
            mem[1]  = 32'h00000000;  // 0
            mem[2]  = 32'h00000000;  // 0 
            mem[3]  = 32'h00000000;  // 0
            mem[4]  = 32'h00000005;  // 5
            mem[5]  = 32'h00000000;  // 0
            mem[6]  = 32'h00000000;  // 0
            mem[7]  = 32'h00000000;  // 0
            mem[8]  = 32'hfffffff7;  // -9
            mem[9]  = 32'h00000000;  // 0
            mem[10] = 32'h00000000;  // 0
            mem[11] = 32'h00000000;  // 0 
            mem[12] = 32'h0000000C;  // 12
            mem[13] = 32'h0000000E;  // 14
            mem[14] = 32'hFFFFFFEE;  // -18
            mem[15] = 32'h00000000;  // 0
            mem[16] = 32'h00000000;  // 0
            mem[17] = 32'h00000000;  // 0
            mem[18] = 32'h00000000;  // 0
            mem[19] = 32'h00000000;  // 0
        end

	always @(*)
        begin
            if (MemRead)       // Whenever MemRead is high, the data at mem[a] is read and stored in rd (Level Triggered)
                rd = mem[a];
        end

    always @(posedge clk)      // At postive edge of the clock, if MemWrite is high, wd is wrriten to mem[a] (Edge Triggered)
        begin
            if (MemWrite)
                mem[a] = wd;
        end

endmodule
