module CPU_Top(

    input logic clk,    
    input logic reset,  //SW17

    output logic OUT_RF19,              //LEDR2
    output logic OUT_RF21,              //LEDR0

    output logic [6:0] OUT_RF18_TENS,   //HEX7
    output logic [6:0] OUT_RF18_UNITS,  //HEX6
    output logic [6:0] OUT_RF20_TENS,   //HEX5
    output logic [6:0] OUT_RF20_UNITS,  //HEX4
    output logic [6:0] OUT_DM11_TENS,   //HEX3 
    output logic [6:0] OUT_DM11_UNITS,  //HEX2
    output logic [6:0] OUT_DM12_TENS,   //HEX1
    output logic [6:0] OUT_DM12_UNITS,  //HEX0

    output logic OUT_CLOCK              //LEDG8

);



logic [3:0] TOP_DM11_TENS;
logic [3:0] TOP_DM11_UNITS;
logic [3:0] TOP_DM12_TENS;
logic [3:0] TOP_DM12_UNIT;
logic TOP_RF19;
logic TOP_RF21;
logic [3:0] TOP_RF18_TENS;
logic [3:0] TOP_RF18_UNITS;
logic [3:0] TOP_RF20_TENS;
logic [3:0] TOP_RF20_UNITS;
logic clock_out;



logic [31:0] temp_wb_data;

clock_divider clock_divider_INST(clk,clock_out);

assign OUT_CLOCK = clock_out;

RISC_V RISC_V_INST(
        clock_out,
        ~reset,
        temp_wb_data,
        TOP_DM11_TENS[3:0],
        TOP_DM11_UNITS[3:0],
        TOP_DM12_TENS[3:0],
        TOP_DM12_UNIT[3:0],
        TOP_RF19,
        TOP_RF21,
        TOP_RF18_TENS[3:0],
        TOP_RF18_UNITS[3:0],
        TOP_RF20_TENS[3:0],
        TOP_RF20_UNITS[3:0]
    );


    assign OUT_RF19 = TOP_RF19;
    assign OUT_RF21 = TOP_RF21;

    bcd_to_7seg bcd_IN1(.bcd(TOP_RF18_TENS), .seg(OUT_RF18_TENS));
    bcd_to_7seg bcd_IN2(.bcd(TOP_RF18_UNITS), .seg(OUT_RF18_UNITS));
    bcd_to_7seg bcd_IN3(.bcd(TOP_RF20_TENS), .seg(OUT_RF20_TENS));
    bcd_to_7seg bcd_IN4(.bcd(TOP_RF20_UNITS), .seg(OUT_RF20_UNITS));
    bcd_to_7seg bcd_IN5(.bcd(TOP_DM11_TENS), .seg(OUT_DM11_TENS));
    bcd_to_7seg bcd_IN6(.bcd(TOP_DM11_UNITS), .seg(OUT_DM11_UNITS));
    bcd_to_7seg bcd_IN7(.bcd(TOP_DM12_TENS), .seg(OUT_DM12_TENS));
    bcd_to_7seg bcd_IN8(.bcd(TOP_DM12_UNIT), .seg(OUT_DM12_UNITS));


endmodule