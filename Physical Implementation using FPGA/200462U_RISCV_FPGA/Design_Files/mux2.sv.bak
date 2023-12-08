`timescale 1ns / 1ps

module mux2#(
    parameter WIDTH = 9
    )
    (
    input  logic [WIDTH-1:0] d0, d1,  // Mux data inputs
    input  logic s,                   // Mux select input
    output logic [WIDTH-1:0] y        // Mux data output
    );

    assign y = s ? d1 : d0;           

endmodule
