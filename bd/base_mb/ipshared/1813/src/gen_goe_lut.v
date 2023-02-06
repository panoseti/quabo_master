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
basic_lut_stage1 stage4(
    .a({2'b0, goe_stage3}),
    .spo(spo)
);

endmodule
