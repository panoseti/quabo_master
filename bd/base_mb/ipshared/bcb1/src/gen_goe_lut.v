`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2023 03:29:57 PM
// Design Name: 
// Module Name: gen_goe_lut
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


module gen_goe_lut(
    input [255:0]a,
    output [1:0] spo
    );

wire [85:0] goe_stage0;
goe_lut_stage0 stage0(
    .a(a),
    .spo(goe_stage0)
);

wire [29:0] goe_stage1;
goe_lut_stage1 stage1(
    .a(goe_stage0),
    .spo(goe_stage1)
);

wire [9:0] goe_stage2;
goe_lut_stage2 stage2(
    .a(goe_stage1),
    .spo(goe_stage2)
);

wire [3:0] goe_stage3;
goe_lut_stage3 stage3(
    .a(goe_stage2),
    .spo(goe_stage3)
);

// stage4
   LUT6 #(
      .INIT(64'h0000000000000000)  // Specify LUT Contents
   ) LUT6_2_pix (
      .O(spo[0:0]),   // LUT general output
      .I0(goe_stage3[0:0]), // LUT input
      .I1(goe_stage3[1:1]), // LUT input
      .I2(goe_stage3[2:2]), // LUT input
      .I3(goe_stage3[3:3]), // LUT input
      .I4(1'b0), // LUT input
      .I5(1'b0)  // LUT input
   );
   
   LUT6 #(
      .INIT(64'h0000000000000000)  // Specify LUT Contents
   ) LUT6_3_pix (
      .O(spo[1:1]),   // LUT general output
      .I0(goe_stage3[0:0]), // LUT input
      .I1(goe_stage3[1:1]), // LUT input
      .I2(goe_stage3[2:2]), // LUT input
      .I3(goe_stage3[3:3]), // LUT input
      .I4(1'b0), // LUT input
      .I5(1'b0)  // LUT input
   );
endmodule
