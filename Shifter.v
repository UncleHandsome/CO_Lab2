`timescale 1ns/1ps

module Shifter(
    input   [31:0]  src,
    input   [4:0]   shamt,
    input   dir,
    output  [31:0]  shifted
);

wire    [31:0]  right16, right8, right4, right2, right1, right;

assign right16 = shamt[4] ? {{16{1'b0}}, src[31:16]} : src;
assign right8 = shamt[3] ? {{8{1'b0}}, src[31:8]} : right16;
assign right4 = shamt[2] ? {{4{1'b0}}, src[31:4]} : right8;
assign right2 = shamt[1] ? {{2{1'b0}}, src[31:2]} : right4;
assign right1 = shamt[0] ? {{1{1'b0}}, src[31:1]} : right2;
assign right = right1;


wire    [31:0]  left16, left8, left4, left2, left1, left;

assign left16 = shamt[4] ? {src[15:0], 16'b0} : src;
assign left8 = shamt[3] ? {src[23:0], 8'b0} : left16;
assign left4 = shamt[2] ? {src[27:0], 4'b0} : left8;
assign left2 = shamt[1] ? {src[29:0], 2'b0} : left4;
assign left1 = shamt[0] ? {src[30:0], 1'b0} : left2;
assign left = left1;

assign shifted = dir ? right : left;
endmodule
