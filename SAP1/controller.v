module controller(
	input clk,
	input rst,
	input[3:0] opcode,
	output[11:0] out
);

localparam SIG_HLT       = 11;
localparam SIG_PC_INC    = 10;
localparam SIG_PC_EN     = 9;
localparam SIG_MEM_LOAD  = 8;
localparam SIG_MEM_EN    = 7;
localparam SIG_IR_LOAD   = 6;
localparam SIG_IR_EN     = 5;
localparam SIG_A_LOAD    = 4;
localparam SIG_A_EN      = 3;
localparam SIG_B_LOAD    = 2;
localparam SIG_ADDER_SUB = 1;
localparam SIG_ADDER_EN  = 0;

//define opcodes for each instruction
//4 instruction exist, Load, Add, Subtract andd Halt
localparam OP_LDA = 4'b0000;
localparam OP_ADD = 4'b0001;
localparam OP_SUB = 4'b0010;
localparam OP_HLT = 4'b1111;

reg[2:0]  stage;
reg[11:0] ctrl_word;

//instruction execution takes 6 (0-5) stages
always @(negedge clk, posedge rst) begin
	if (rst) begin
		stage <= 0;
	end else begin
		if (stage == 5) begin
			stage <= 0;
		end else begin
			stage <= stage + 1;
		end
	end
end

always @(*) begin
	ctrl_word = 12'b0;

	case (stage)
	   //stage 0: Put PC onto the bus
	   //load that value into the MAR
		0: begin
			ctrl_word[SIG_PC_EN] = 1;
			ctrl_word[SIG_MEM_LOAD] = 1;
		end
		//stage 1: Increment the PC
		1: begin
			ctrl_word[SIG_PC_INC] = 1;
		end
		//stage 2: Put whatever is in memory at the MAR address onto the bus
		//Load it into the IR
		2: begin
			ctrl_word[SIG_MEM_EN] = 1;
			ctrl_word[SIG_IR_LOAD] = 1;
		end
		//After first 3 stages, the actions performed in the next 3 
		//depend on the instruction
		3: begin
			case (opcode)
			    //stage 3 - LDA instruction
			    //put the instruction operand onto the bus
			    //load the value into MAR
				OP_LDA: begin
					ctrl_word[SIG_IR_EN] = 1;
					ctrl_word[SIG_MEM_LOAD] = 1;
				end
				//stage 3 - ADD instruction
				//put the instruction operand onto the bus
				//load that value into MAR
				OP_ADD: begin
					ctrl_word[SIG_IR_EN] = 1;
					ctrl_word[SIG_MEM_LOAD] = 1;
				end
				//stage 3 - SUB instruction
				//put the instruction operand onto the bus
				//load that value into MAR 
				OP_SUB: begin
					ctrl_word[SIG_IR_EN] = 1;
					ctrl_word[SIG_MEM_LOAD] = 1;
				end
				//stage 3 - HLT instruction
				//Halt the clock
				OP_HLT: begin
					ctrl_word[SIG_HLT] = 1;
				end
			endcase
		end
		4: begin
			case (opcode)
			    //stage 4 - LDA
			    //Put whatever is in memory at the MAR address onto the bus
                //Load that value into Register A
				OP_LDA: begin
					ctrl_word[SIG_MEM_EN] = 1;
					ctrl_word[SIG_A_LOAD] = 1;
				end
				//stage 4 - ADD
				//Put whatever is in memory at the MAR address onto the bus
                //Load that value into Register B
				OP_ADD: begin
					ctrl_word[SIG_MEM_EN] = 1;
					ctrl_word[SIG_B_LOAD] = 1;
				end
				//stage 4 - SUB
				//Put the instruction operand onto the bus
                //Load that value into the MAR 
				OP_SUB: begin
					ctrl_word[SIG_MEM_EN] = 1;
					ctrl_word[SIG_B_LOAD] = 1;
				end
				//stage 4 - HLT 
				//idle
			endcase
		end
		5: begin
			case (opcode)
			    //stage 5 - LDA - Idle
			    
			    //stage 5 - ADD
			    //Put the value in the adder onto the bus
                //Load that value into Register A
				OP_ADD: begin
					ctrl_word[SIG_ADDER_EN] = 1;
					ctrl_word[SIG_A_LOAD] = 1;
				end
				//stage 5 -SUB
				//Do subtraction rather than addition
                //Put the value in the adder onto the bus 
                //Load that value into Register A
				OP_SUB: begin
					ctrl_word[SIG_ADDER_SUB] = 1;
					ctrl_word[SIG_ADDER_EN] = 1;
					ctrl_word[SIG_A_LOAD] = 1;
				end
				//stage 5 - HLT - idle
			endcase
		end
	endcase
end

//output the control signal
assign out = ctrl_word;

endmodule

