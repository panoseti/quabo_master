`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2023 04:50:13 PM
// Design Name: 
// Module Name: goe_lut_stage1
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


module goe_lut_stage1(
    input [85:0] a,
    output [29:0] spo
    );
 
genvar gg;
generate
   for (gg=0; gg < 14; gg=gg+1)
   begin: STAGE1   
       basic_lut_stage1 stage(
            .a(a[(6*gg+5):(6*gg)]),
            .spo(spo[(2*gg+1):2*gg])
       );
   end
endgenerate

basic_lut_stage1 stage(
    .a({4'b0, a[85:84]}),
    .spo(spo[29:28])
);
   
endmodule
