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


basic_lut_stage1 stage3_0(
    .a(a[5:0]),
    .spo(spo[1:0])
);

basic_lut_stage1 stage3_1(
    .a({2'b0, a[9:6]}),
    .spo(spo[3:2])
);
endmodule
