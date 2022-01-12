`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2022 09:27:52 AM
// Design Name: 
// Module Name: TAI_IO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TAI_IO(
    input clk,
    input rst,
    input io_ctrl0,
    input io_ctrl1,
    input [9:0] tai_inside_in,
    output reg [9:0] tai_inside_out,
    inout [9:0] tai_inout
    );
 
 
 wire io_ctrl;
 assign io_ctrl = io_ctrl0 | io_ctrl1;
 
 wire [9:0] tai_inside_out_tmp;
 
 IOBUF #(
    .DRIVE(12), // Specify the output drive strength
    .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE"
    .IOSTANDARD("DEFAULT"), // Specify the I/O standard
    .SLEW("SLOW") // Specify the output slew rateIOBUF_PPS(
)IOBUF_TAI0(
.I(tai_inside_in[0]),
.O(tai_inside_out_tmp[0]),
.T(io_ctrl), //high-input; low-output
.IO(tai_inout[0])
);

 IOBUF #(
    .DRIVE(12), // Specify the output drive strength
    .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE"
    .IOSTANDARD("DEFAULT"), // Specify the I/O standard
    .SLEW("SLOW") // Specify the output slew rateIOBUF_PPS(
)IOBUF_TAI1(
.I(tai_inside_in[1]),
.O(tai_inside_out_tmp[1]),
.T(io_ctrl), //high-input; low-output
.IO(tai_inout[1])
);

 IOBUF #(
    .DRIVE(12), // Specify the output drive strength
    .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE"
    .IOSTANDARD("DEFAULT"), // Specify the I/O standard
    .SLEW("SLOW") // Specify the output slew rateIOBUF_PPS(
)IOBUF_TAI2(
.I(tai_inside_in[2]),
.O(tai_inside_out_tmp[2]),
.T(io_ctrl), //high-input; low-output
.IO(tai_inout[2])
);

 IOBUF #(
    .DRIVE(12), // Specify the output drive strength
    .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE"
    .IOSTANDARD("DEFAULT"), // Specify the I/O standard
    .SLEW("SLOW") // Specify the output slew rateIOBUF_PPS(
)IOBUF_TAI3(
.I(tai_inside_in[3]),
.O(tai_inside_out_tmp[3]),
.T(io_ctrl), //high-input; low-output
.IO(tai_inout[3])
);

 IOBUF #(
    .DRIVE(12), // Specify the output drive strength
    .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE"
    .IOSTANDARD("DEFAULT"), // Specify the I/O standard
    .SLEW("SLOW") // Specify the output slew rateIOBUF_PPS(
)IOBUF_TAI4(
.I(tai_inside_in[4]),
.O(tai_inside_out_tmp[4]),
.T(io_ctrl), //high-input; low-output
.IO(tai_inout[4])
);

 IOBUF #(
    .DRIVE(12), // Specify the output drive strength
    .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE"
    .IOSTANDARD("DEFAULT"), // Specify the I/O standard
    .SLEW("SLOW") // Specify the output slew rateIOBUF_PPS(
)IOBUF_TAI5(
.I(tai_inside_in[5]),
.O(tai_inside_out_tmp[5]),
.T(io_ctrl), //high-input; low-output
.IO(tai_inout[5])
);

 IOBUF #(
    .DRIVE(12), // Specify the output drive strength
    .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE"
    .IOSTANDARD("DEFAULT"), // Specify the I/O standard
    .SLEW("SLOW") // Specify the output slew rateIOBUF_PPS(
)IOBUF_TAI6(
.I(tai_inside_in[6]),
.O(tai_inside_out_tmp[6]),
.T(io_ctrl), //high-input; low-output
.IO(tai_inout[6])
);

 IOBUF #(
    .DRIVE(12), // Specify the output drive strength
    .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE"
    .IOSTANDARD("DEFAULT"), // Specify the I/O standard
    .SLEW("SLOW") // Specify the output slew rateIOBUF_PPS(
)IOBUF_TAI7(
.I(tai_inside_in[7]),
.O(tai_inside_out_tmp[7]),
.T(io_ctrl), //high-input; low-output
.IO(tai_inout[7])
);

 IOBUF #(
    .DRIVE(12), // Specify the output drive strength
    .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE"
    .IOSTANDARD("DEFAULT"), // Specify the I/O standard
    .SLEW("SLOW") // Specify the output slew rateIOBUF_PPS(
)IOBUF_TAI8(
.I(tai_inside_in[8]),
.O(tai_inside_out_tmp[8]),
.T(io_ctrl), //high-input; low-output
.IO(tai_inout[8])
);

 IOBUF #(
    .DRIVE(12), // Specify the output drive strength
    .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE"
    .IOSTANDARD("DEFAULT"), // Specify the I/O standard
    .SLEW("SLOW") // Specify the output slew rateIOBUF_PPS(
)IOBUF_TAI9(
.I(tai_inside_in[9]),
.O(tai_inside_out_tmp[9]),
.T(io_ctrl), //high-input; low-output
.IO(tai_inout[9])
);

//assign tai_inside_out = io_ctrl? tai_inside_out_tmp:tai_inside_in;
reg [9:0]tmp;
always @(posedge clk)
begin
    if(rst == 0)
        begin
            tmp <= 0;   
            tai_inside_out <= 0;
        end
    else if(io_ctrl == 1)
        begin
            tmp <= tai_inside_out_tmp;
            tai_inside_out <= tmp;
        end
    else
        begin
            tmp <= tai_inside_in;
            tai_inside_out <= tmp;
        end
end
endmodule

