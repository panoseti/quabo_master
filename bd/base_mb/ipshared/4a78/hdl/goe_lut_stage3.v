`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2023 05:10:54 PM
// Design Name: 
// Module Name: goe_lut_stage3
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


module goe_lut_stage3(
    input [9:0] a,
    output [3:0] spo
    );

   LUT6 #(
      .INIT(64'h0000000000000000)  // Specify LUT Contents
   ) LUT6_2_pix0 (
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
   ) LUT6_3_pix0 (
      .O(spo[1:1]),   // LUT general output
      .I0(a[0:0]), // LUT input
      .I1(a[1:1]), // LUT input
      .I2(a[2:2]), // LUT input
      .I3(a[3:3]), // LUT input
      .I4(a[4:4]), // LUT input
      .I5(a[5:5])  // LUT input
   );
   
   LUT6 #(
      .INIT(64'h0000000000000000)  // Specify LUT Contents
   ) LUT6_2_pix1 (
      .O(spo[2:2]),   // LUT general output
      .I0(a[6:6]), // LUT input
      .I1(a[7:7]), // LUT input
      .I2(a[8:8]), // LUT input
      .I3(a[9:9]), // LUT input
      .I4(1'b0), // LUT input
      .I5(1'b0)  // LUT input
   );
   
   LUT6 #(
      .INIT(64'h0000000000000000)  // Specify LUT Contents
   ) LUT6_3_pix1 (
      .O(spo[3:3]),   // LUT general output
      .I0(a[6:6]), // LUT input
      .I1(a[7:7]), // LUT input
      .I2(a[8:8]), // LUT input
      .I3(a[9:9]), // LUT input
      .I4(1'b0), // LUT input
      .I5(1'b0)  // LUT input
   );
endmodule
