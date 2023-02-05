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
    input clk,
    input pixel_trig_maroc,
    output ext_trig_maroc,
    inout ext_trig_io
    );

wire Q1;
FDPE #(
        .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
    ) FDPE_ED0 (
       .Q(Q1),      // 1-bit Data output
       .C(clk),      // 1-bit Clock input
       .CE(1'b1),    // 1-bit Clock enable input
       .PRE(pixel_trig_maroc),  // 1-bit Asynchronous set input
       .D(1'b0)       // 1-bit Data input
    );
    
wire pixel_trig_maroc_reg;
   FDRE #(
      .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
   ) FDRE_ED0 (
      .Q(pixel_trig_maroc_reg),      // 1-bit Data output
      .C(clk),      // 1-bit Clock input
      .CE(1'b1),    // 1-bit Clock enable input
      .R(1'b0),      // 1-bit Synchronous reset input
      .D(Q1)       // 1-bit Data input
   );   
   
wire ext_trig;

IOBUF #(
   .DRIVE(16), // Specify the output drive strength
   .IBUF_LOW_PWR("FALSE"),  // Low Power - "TRUE", High Performance = "FALSE"
   .IOSTANDARD("LVCMOS33"), // Specify the I/O standard
   .SLEW("FAST") // Specify the output slew rateIOBUF_PPS(
)IOBUF_EXT_TRIG(
.I(1'b1),
.O(ext_trig),
.T(~pixel_trig_maroc_reg), //high-input; low-output
.IO(ext_trig_io)
);
 
assign ext_trig_maroc = ext_trig;    

endmodule
