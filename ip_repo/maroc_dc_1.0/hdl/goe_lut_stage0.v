`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2023 04:06:30 PM
// Design Name: 
// Module Name: goe_lut_stage0
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


module goe_lut_stage0(
    input [255:0]a,
    output [85:0] spo
    );

genvar gg;
generate
   for (gg=0; gg < 42; gg=gg+1)
   begin: STAGE0   
       basic_lut_stage0 stage(
            .a(a[(6*gg+5):(6*gg)]),
            .spo(spo[(2*gg+1):2*gg])
       );
   end
endgenerate

basic_lut_stage0 stage(
    .a({2'b0, a[255:252]}),
    .spo(spo[85:84])
);

endmodule
