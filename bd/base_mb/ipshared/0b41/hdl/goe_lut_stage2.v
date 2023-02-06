`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2023 05:05:07 PM
// Design Name: 
// Module Name: goe_lut_stage2
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


module goe_lut_stage2(
    input [29:0] a,
    output [9:0] spo
    );

genvar gg;
generate
   for (gg=0; gg < 5; gg=gg+1)
   begin: STAGE2   
       basic_lut_stage1 stage(
            .a(a[(6*gg+5):(6*gg)]),
            .spo(spo[(2*gg+1):2*gg])
       );
   end
endgenerate
endmodule
