`timescale 1ns / 1ps

module RegFile#(
    parameter DATA_WIDTH = 32,    // Number of bits in each register
    parameter ADDRESS_WIDTH = 5,  // Number of registers = 2^ADDRESS_WIDTH
    parameter NUM_REGS = 32       // Number of registers
    )
    (
    input  clk,         // Clock signal
    input  rst,         // Synchronous reset; if it is asserted (rst=1), all registers are reseted to 0 at a falling clock edge 
    input  rg_wrt_en,   // Write enable signal

    input  logic [ADDRESS_WIDTH-1:0] rg_wrt_dest,  // Address of Write Register
    input  logic [ADDRESS_WIDTH-1:0] rg_rd_addr1,  // Address of Read Register 1
    input  logic [ADDRESS_WIDTH-1:0] rg_rd_addr2,  // Address of Read Register 2

    input  logic [DATA_WIDTH-1:0] rg_wrt_data,  // Write Data Port  (Data to be written to reg_file[rg_wrt_dest])
    output logic [DATA_WIDTH-1:0] rg_rd_data1,  // Read Data Port 1 (Content of reg_file[rg_rd_addr1] is given to the output port rg_rd_data1)
    output logic [DATA_WIDTH-1:0] rg_rd_data2   // Read Data Port 2 (Content of reg_file[rg_rd_addr2] is given to the output port rg_rd_data2)
    );

    integer i;
    logic [DATA_WIDTH-1:0] register_file [NUM_REGS-1:0];   // Register File


    /* 
        Notes :-
            A Read can be done at any time (Combinational). 
            A Write is performed at the falling clock edge if it is enabled (rg_wrt_en=1).
    */

    always @(negedge clk) 
        begin
            if (rst==1'b1)
                for (i=0;i<NUM_REGS;i=i+1)
                    register_file[i] <= 0;                 // Reset all registers to 0
            else if (rst==1'b0 && rg_wrt_en==1'b1)
                register_file[rg_wrt_dest] <=rg_wrt_data;  // Write rg_wrt_data to register_file[rg_wrt_dest]
        end

    assign rg_rd_data1 = register_file[rg_rd_addr1];  // Read rg_rd_addr1 from register_file and assign it to rg_rd_data1
    assign rg_rd_data2 = register_file[rg_rd_addr2];  // Read rg_rd_addr2 from register_file and assign it to rg_rd_data2

endmodule

