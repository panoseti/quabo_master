`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2023 04:58:00 PM
// Design Name: 
// Module Name: basic_lut_stage1
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


module basic_lut_stage1(
    input [5:0] a,
    output [1:0] spo
    );

   LUT6 #(
      .INIT(64'h0000000000000000)  // Specify LUT Contents
   ) LUT6_2_pix (
      .O(spo[0:0]),   // LUT general output
      .I0(a[0:0]), // LUT input
      .I1(a[1:1]), // LUT input
      .I2(a[2:2]), // LUT input
      .I3(a[3:3]), // LUT input
      .I4(a[4:4]), // LUT input
      .I5(a[5:5])  // LUT input
   );
   
   LUT6 #(
      .INIT(64'h0000000000000000)  // Specify LUT Contents
   ) LUT6_3_pix (
      .O(spo[1:1]),   // LUT general output
      .I0(a[0:0]), // LUT input
      .I1(a[1:1]), // LUT input
      .I2(a[2:2]), // LUT input
      .I3(a[3:3]), // LUT input
      .I4(a[4:4]), // LUT input
      .I5(a[5:5])  // LUT input
   );
endmodule
