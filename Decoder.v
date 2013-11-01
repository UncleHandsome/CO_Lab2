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
	Branch_o,
    SinExt_o,
    MemToReg_o,
    MemWrite_o
	);

//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
output         SinExt_o;
output         MemToReg_o;
output         MemWrite_o;

reg [10:0]   countrol;
assign {RegWrite_o, RegDst_o, ALUSrc_o, Branch_o, MemWrite_o, MemToReg_o, ALU_op_o, SinExt_o} = control;

//Parameter
parameter [6-1:0] OP_RTYPE = 6'b000000;
parameter [6-1:0] OP_ADDI  = 6'b001000;
parameter [6-1:0] OP_BEQ   = 6'b000100;
parameter [6-1:0] OP_ORI   = 6'b001101;
parameter [6-1:0] OP_LW	   = 6'b100011;
parameter [6-1:0] OP_SW    = 6'b101011;
parameter [6-1:0] OP_JUMP  = 6'b000010;
parameter [6-1:0] OP_BGT   = 6'b000111;
parameter [6-1:0] OP_BNEZ  = 6'b000101;
parameter [6-1:0] OP_BGEZ  = 6'b000001;
parameter [6-1:0] OP_LUI   = 6'b001111;
parameter [6-1:0] OP_JAL   = 6'b000011;

//Main function
always @ (*) begin
    case (instr_op_i)
        OP_RTYPE: countrol <= 11'b11000001111; // RTYPE
        OP_LW   : countrol <= 11'b10100100001; // LW
        OP_SW   : countrol <= 11'b00101000001; // SW
        OP_BEQ  : countrol <= 11'b00010000011; // BEQ
        OP_ADDI : countrol <= 11'b10100000001; // ADDI
        OP_JUMP : countrol <= 11'b00000010001; // J
        OP_ORI  : countrol <= 11'b10100000100; // ORI
        default : countrol <= 11'bxxxxxxxxxxx; // illegal op
    endcase
end

endmodule
