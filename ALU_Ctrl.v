//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [4-1:0] ALUCtrl_o;

//Parameter

       
//Select exact operation
always @ (*) begin
    case (ALUOp_i)
        3'b000: ALUCtrl_o <= 4'b0010; // add (for addi)
        3'b001: ALUCtrl_o <= 4'b0110; // sub (for beq)
        3'b010: ALUCtrl_o <= 4'b0001; // add (for addi)
        default: case(funct_i) // R-type instruction  
            6'b100000: ALUCtrl_o <= 4'b0010; // add
            6'b100010: ALUCtrl_o <= 4'b0110; // sub
            6'b100100: ALUCtrl_o <= 4'b0000; // and
            6'b100101: ALUCtrl_o <= 4'b0001; // or
            6'b101010: ALUCtrl_o <= 4'b0111; // slt
            6'b000000: ALUCtrl_o <= 4'b1000; // sll
            6'b000100: ALUCtrl_o <= 4'b1010; // sllv
            6'b000010: ALUCtrl_o <= 4'b1001; // srl
            6'b000110: ALUCtrl_o <= 4'b1011; // srlv
            default:   ALUCtrl_o <= 4'bxxxx; // ???
        endcase
    endcase
end
endmodule     





                    
                    
