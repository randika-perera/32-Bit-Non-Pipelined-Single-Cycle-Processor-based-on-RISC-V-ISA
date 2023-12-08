//`timescale 1ns / 1ps

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
    output logic [DATA_W-1:0] rd    ,   // Read data bus


    output logic [3:0] DM11_TENS,   //HEX3 
    output logic [3:0] DM11_UNITS,  //HEX2
    output logic [3:0] DM12_TENS,   //HEX1
    output logic [3:0] DM12_UNITS   //HEX0


    );



    /*
    logic [9:0] counter;
    logic status;

    always @(posedge clk)
        begin
            counter <= counter + 1;
            if (counter == 2)
                status <= 1;
            else
                status <= 0;
        end
    
    initial
        $readmemb("data_memory_intializer.mif", mem);
    */


    logic [DATA_W-1:0] mem [(2**DM_ADDRESS)-1:0];     // Data memory array with capacity of 512 words with each word of size 32 bits



    // Data memory will be initialized with the following values
    /*

    DATA MEMORY INITIALIZATION WILL BE DONE USING I-TYPE INSTRUCTIONS (ADDI & SW)
    SINCE INITIAL BLOCK IS NOT SYNTHESIZABLE FOR FPGA IMPLEMENTATION

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
    */

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



    assign DM11_TENS  = mem[11]/10;
    assign DM11_UNITS = mem[11]%10;
    assign DM12_TENS  = mem[12]/10;
    assign DM12_UNITS = mem[12]%10;



endmodule
