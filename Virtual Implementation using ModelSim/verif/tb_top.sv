`timescale 1ns / 1ps

module tb_top;

    logic tb_clk, reset;
    logic [31:0] tb_WB_Data;

    always #10 tb_clk = ~tb_clk;   // Clock Signal Generation (10ns period)

    initial                        // Reset Signal (Starts at 1, then goes to 0 after 25ns)
        begin                      
            tb_clk = 0;
            reset = 1;
            #25 reset = 0;            
        end

    RISC_V RISC_V                  // DUT Instantiation
    (
        .clk(tb_clk),
        .reset(reset),
        .WB_Data(tb_WB_Data)      
    );

    initial                        // Terminate the simulation after 1200ns
        begin
            #1300;
            $finish;
        end

endmodule
