`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2022 02:57:23 PM
// Design Name: 
// Module Name: ext_trig
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


module ext_trig(
    input pixel_trig_maroc,
    output ext_trig_maroc,
    inout ext_trig_io
    );

wire ext_trig;
IOBUF #(
   .DRIVE(16), // Specify the output drive strength
   .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE"
   .IOSTANDARD("DEFAULT"), // Specify the I/O standard
   .SLEW("FAST") // Specify the output slew rateIOBUF_PPS(
)IOBUF_EXT_TRIG(
.I(1'b1),
.O(ext_trig),
.T(~pixel_trig_maroc), //high-input; low-output
.IO(ext_trig_io)
);

assign ext_trig_maroc = ext_trig;    

endmodule
