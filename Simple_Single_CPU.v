//Subject:     CO project 2 - Simple Single CPU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Simple_Single_CPU(
        clk_i,
		rst_n
		);
		
//I/O port
input         clk_i;
input         rst_n;

//Internal Signles

wire [31:0] pc_in, pc_out, instr, se_o, RSdata, RTdata, MuxALUSrc, result;
wire [31:0] sign32, pc4, pcb, pc_source, mem_data, write_data;
wire [4:0]  RDaddr;
wire [3:0]  ALUCtrl;
wire [2:0]  ALU_op;
wire RegWrite, RegDst, Branch, ALUSrc, zero, cout, overflow, SinExt, Jump;
wire Mux_PC, MemToReg, MemWrite;

//Greate componentes
ProgramCounter PC(
        .clk_i(clk_i),      
	    .rst_n (rst_n),     
	    .pc_in_i(pc_in),
	    .pc_out_o(pc_out)
	    );
	
Adder Adder1(
        .src1_i(pc_out),
	    .src2_i(32'd4),
	    .sum_o(pc4)    
	    );
	
Instr_Memory IM(
        .pc_addr_i(pc_out),
	    .instr_o(instr)
	    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instr[20:16]),
        .data1_i(instr[15:11]),
        .select_i(RegDst),
        .data_o(RDaddr)
        );	
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_n(rst_n) ,     
        .RSaddr_i(instr[25:21]),
        .RTaddr_i(instr[20:16]),
        .RDaddr_i(RDaddr),
        .RDdata_i(write_data),
        .RegWrite_i (RegWrite),
        .RSdata_o(RSdata),
        .RTdata_o(RTdata)   
        );
	
Decoder Decoder(
        .instr_op_i(instr[31:26]),
	    .RegWrite_o(RegWrite),
	    .ALU_op_o(ALU_op),   
	    .ALUSrc_o(ALUSrc),   
	    .RegDst_o(RegDst),
		.Branch_o(Branch),
        .SinExt_o(SinExt)
        .MemToReg_o(MemToReg),
        .MemWrite_o(MemWrite),
        .Jump(Jump)
	    );

ALU_Ctrl AC(
        .funct_i(instr[5:0]),
        .ALUOp_i(ALU_op),   
        .ALUCtrl_o(ALUCtrl) 
        );
	
Sign_Extend SE(
        .data_i(instr[15:0]),
        .select_i(SinExt),
        .data_o(se_o)
        );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(RTdata),
        .data1_i(se_o),
        .select_i(ALUSrc),
        .data_o(MuxALUSrc)
        );	
		
alu ALU(
		.rst_n(rst_n),
        .src1(RSdata),
	    .src2(MuxALUSrc),
        .shamt(instr[10:6]),
	    .ALU_control(ALUCtrl),
	    .result(result),
		.zero(zero),
		.cout(cout),
		.overflow(overflow)
	    );		
Adder Adder2(
        .src1_i(sign32),     
	    .src2_i(pc4),     
	    .sum_o(pcb)      
	    );
		
Shift_Left_Two_32 Shifter(
        .data_i(se_o),
        .data_o(sign32)
        ); 		
		
MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(pc4),
        .data1_i(pcb),
        .select_i(Mux_PC),
        .data_o(pc_source)
        );	

MUX_2to1 #(.size(32)) Mux_Jump_Source(
        .data0_i(pc_source),
        .data1_i({pc4[31:28], instr[25:0], 2'b00}),
        .select_i(Jump),
        .data_o(pc_in)
        );

Data_Memory Data_Mem(
        .clk_i(clk_i),
        .addr_i(result),
        .data_i(RTdata),
        .MemRead_i(~MemWrite),
        .MemWrite_i(MemWrite),
        .data_o(mem_data)
        );

MUX_2to1 #(.size(32)) Mux_Mem_Source(
        .data0_i(result),
        .data1_i(mem_data),
        .select_i(MemToReg),
        .data_o(write_data)
        );
endmodule
		  


