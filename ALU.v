`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:15:11 08/18/2010
// Design Name:
// Module Name:    alu
// Project Name:
// Target Devices:
// Tool versions:
// Desrciption:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module alu(
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
		   bonus_control, // 3 bits bonus control input(input) 
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );


input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input   [4-1:0] ALU_control;
input   [3-1:0] bonus_control; 

output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

reg    [32-1:0] result;
wire             zero;
wire             cout;
wire             overflow;

wire    [32-1:0] carry;
wire    [31:0] fuck_result;
wire    fuck_cout;
alu_top alu00( src1[0],  src2[0], 0, ALU_control[3], ALU_control[2], ALU_control[2], ALU_control[1:0], fuck_result[0], carry[0]);
alu_top alu01( src1[1],  src2[1], 0, ALU_control[3], ALU_control[2],  carry[0], ALU_control[1:0],  fuck_result[1], carry[1]);
alu_top alu02( src1[2],  src2[2], 0, ALU_control[3], ALU_control[2],  carry[1], ALU_control[1:0],  fuck_result[2], carry[2]);
alu_top alu03( src1[3],  src2[3], 0, ALU_control[3], ALU_control[2],  carry[2], ALU_control[1:0],  fuck_result[3], carry[3]);
alu_top alu04( src1[4],  src2[4], 0, ALU_control[3], ALU_control[2],  carry[3], ALU_control[1:0],  fuck_result[4], carry[4]);
alu_top alu05( src1[5],  src2[5], 0, ALU_control[3], ALU_control[2],  carry[4], ALU_control[1:0],  fuck_result[5], carry[5]);
alu_top alu06( src1[6],  src2[6], 0, ALU_control[3], ALU_control[2],  carry[5], ALU_control[1:0],  fuck_result[6], carry[6]);
alu_top alu07( src1[7],  src2[7], 0, ALU_control[3], ALU_control[2],  carry[6], ALU_control[1:0],  fuck_result[7], carry[7]);
alu_top alu08( src1[8],  src2[8], 0, ALU_control[3], ALU_control[2],  carry[7], ALU_control[1:0],  fuck_result[8], carry[8]);
alu_top alu09( src1[9],  src2[9], 0, ALU_control[3], ALU_control[2],  carry[8], ALU_control[1:0],  fuck_result[9], carry[9]);
alu_top alu10(src1[10], src2[10], 0, ALU_control[3], ALU_control[2],  carry[9], ALU_control[1:0], fuck_result[10], carry[10]);
alu_top alu11(src1[11], src2[11], 0, ALU_control[3], ALU_control[2], carry[10], ALU_control[1:0], fuck_result[11], carry[11]);
alu_top alu12(src1[12], src2[12], 0, ALU_control[3], ALU_control[2], carry[11], ALU_control[1:0], fuck_result[12], carry[12]);
alu_top alu13(src1[13], src2[13], 0, ALU_control[3], ALU_control[2], carry[12], ALU_control[1:0], fuck_result[13], carry[13]);
alu_top alu14(src1[14], src2[14], 0, ALU_control[3], ALU_control[2], carry[13], ALU_control[1:0], fuck_result[14], carry[14]);
alu_top alu15(src1[15], src2[15], 0, ALU_control[3], ALU_control[2], carry[14], ALU_control[1:0], fuck_result[15], carry[15]);
alu_top alu16(src1[16], src2[16], 0, ALU_control[3], ALU_control[2], carry[15], ALU_control[1:0], fuck_result[16], carry[16]);
alu_top alu17(src1[17], src2[17], 0, ALU_control[3], ALU_control[2], carry[16], ALU_control[1:0], fuck_result[17], carry[17]);
alu_top alu18(src1[18], src2[18], 0, ALU_control[3], ALU_control[2], carry[17], ALU_control[1:0], fuck_result[18], carry[18]);
alu_top alu19(src1[19], src2[19], 0, ALU_control[3], ALU_control[2], carry[18], ALU_control[1:0], fuck_result[19], carry[19]);
alu_top alu20(src1[20], src2[20], 0, ALU_control[3], ALU_control[2], carry[19], ALU_control[1:0], fuck_result[20], carry[20]);
alu_top alu21(src1[21], src2[21], 0, ALU_control[3], ALU_control[2], carry[20], ALU_control[1:0], fuck_result[21], carry[21]);
alu_top alu22(src1[22], src2[22], 0, ALU_control[3], ALU_control[2], carry[21], ALU_control[1:0], fuck_result[22], carry[22]);
alu_top alu23(src1[23], src2[23], 0, ALU_control[3], ALU_control[2], carry[22], ALU_control[1:0], fuck_result[23], carry[23]);
alu_top alu24(src1[24], src2[24], 0, ALU_control[3], ALU_control[2], carry[23], ALU_control[1:0], fuck_result[24], carry[24]);
alu_top alu25(src1[25], src2[25], 0, ALU_control[3], ALU_control[2], carry[24], ALU_control[1:0], fuck_result[25], carry[25]);
alu_top alu26(src1[26], src2[26], 0, ALU_control[3], ALU_control[2], carry[25], ALU_control[1:0], fuck_result[26], carry[26]);
alu_top alu27(src1[27], src2[27], 0, ALU_control[3], ALU_control[2], carry[26], ALU_control[1:0], fuck_result[27], carry[27]);
alu_top alu28(src1[28], src2[28], 0, ALU_control[3], ALU_control[2], carry[27], ALU_control[1:0], fuck_result[28], carry[28]);
alu_top alu29(src1[29], src2[29], 0, ALU_control[3], ALU_control[2], carry[28], ALU_control[1:0], fuck_result[29], carry[29]);
alu_top alu30(src1[30], src2[30], 0, ALU_control[3], ALU_control[2], carry[29], ALU_control[1:0], fuck_result[30], carry[30]);
alu_top alu31(src1[31], src2[31], 0, ALU_control[3], ALU_control[2], carry[30], ALU_control[1:0], fuck_result[31], fuck_cout);

assign cout = ALU_control == 4'b0111 ? 0 : fuck_cout;
assign overflow = ALU_control == 4'b0111 ? 0 : fuck_cout ^ carry[30];


wire slt;
wire seq;
wire sle, sge, sgt, sne;

assign slt = fuck_result[31];
assign seq = ~(fuck_result[0] |
               fuck_result[1] |
               fuck_result[2] |
               fuck_result[3] |
               fuck_result[4] |
               fuck_result[5] |
               fuck_result[6] |
               fuck_result[7] |
               fuck_result[8] |
               fuck_result[9] |
               fuck_result[10] |
               fuck_result[11] |
               fuck_result[12] |
               fuck_result[13] |
               fuck_result[14] |
               fuck_result[15] |
               fuck_result[16] |
               fuck_result[17] |
               fuck_result[18] |
               fuck_result[19] |
               fuck_result[20] |
               fuck_result[21] |
               fuck_result[22] |
               fuck_result[23] |
               fuck_result[24] |
               fuck_result[25] |
               fuck_result[26] |
               fuck_result[27] |
               fuck_result[28] |
               fuck_result[29] |
               fuck_result[30] |
               fuck_result[31]);
assign sne = ~seq;
assign sgt = ~(slt | seq);
assign sge = ~slt;
assign sle = slt | seq;


 // assign result = ALU_control == 4'b0111 ? {31'b0, fuck_result[31]} : fuck_result;
always @(*) begin
    if(ALU_control == 4'b0111) begin
        case(bonus_control)
            3'b000 : result = {31'b0, slt};
            3'b001 : result = {31'b0, sgt};
            3'b010 : result = {31'b0, sle};
            3'b011 : result = {31'b0, sge};
            3'b110 : result = {31'b0, seq};
            3'b100 : result = {31'b0, sne};
        endcase
    end
    else
        result = fuck_result;
end           

assign zero = result == 0;
endmodule
