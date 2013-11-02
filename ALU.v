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
           shamt,
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
input   [4:0]   shamt;
input   [4-1:0] ALU_control;
input   [3-1:0] bonus_control; 

output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

reg    [32-1:0] result;
wire             zero;
reg              cout;
wire             overflow;

wire [31:0] shift_result;
wire [4:0]  shift_src;
assign shift_src = ALU_control[1] ? src1[4:0] : shamt;
Shifter shifter(src2, shift_src, ALU_control[0], shift_result);

always @(*) begin
    casex(ALU_control)
        4'b0000: result <= src1 & src1;
        4'b0001: result <= src2 | src2;
        4'b0010: {cout, result} <= src1 + src2;
        4'b0011: result <= src1 * src2;
        // 4'b0100:
        // 4'b0101;
        4'b0110: {cout, result} <= src1 + ~src2 + 1;
        4'b0111: begin
            result = src1 + ~src2 + 1;
            case(bonus_control)
                3'b000: result = {31'b0, result[31]};
                3'b001: result = {31'b0, ~result[31]};
                3'b010: result = {31'b0, result[31] | zero};
                3'b011: result = {31'b0, ~result[31] | zero};
                3'b110: result = src1 == src2;
                3'b100: result = src1 != src2;
            endcase
        end
        4'b10xx: result <= shift_result;
        4'b1100: result <= src1 ~| src2;
    endcase
end           

assign zero = result == 0;
assign overflow = (src1[31] & src2[31]) ^ result[31];
endmodule
