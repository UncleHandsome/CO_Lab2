//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      Luke
//----------------------------------------------
//Date:        2010/8/16
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
 
//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;

//Parameter

//Main function
always @ (*) begin
    case (instr_op_i)
        6'b000000: {RegDst_o, ALUSrc_o, RegWrite_o, Branch_o, ALU_op_o} <= 7'b1010010;
        6'b100011: {RegDst_o, ALUSrc_o, RegWrite_o, Branch_o, ALU_op_o} <= 7'b0110000;
        6'b101011: {RegDst_o, ALUSrc_o, RegWrite_o, Branch_o, ALU_op_o} <= 7'b0100000;
        6'b000100: {RegDst_o, ALUSrc_o, RegWrite_o, Branch_o, ALU_op_o} <= 7'b0001001;
        default: {RegDst_o, ALUSrc_o, RegWrite_o, Branch_o, ALU_op_o} <= 7'bxxxxxxx;
    endcase
end

endmodule





                    
                    
