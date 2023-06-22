module memory(
	input clk,
	input rst,
	input load,
	input[7:0] bus,
	output[7:0] out
);

reg[3:0] mar;
reg[7:0] ram[0:15];

//create set of instructions for simulation
initial begin
    ram[0] = 'h0D;
    ram[1] = 'h1E;
    ram[2] = 'h2F;
    ram[3] = 'hF0;
    ram[4] = 'h00;
    ram[5] = 'h00;
    ram[6] = 'h00;
    ram[7] = 'h00;
    ram[8] = 'h00;
    ram[9] = 'h00;
    ram[10] = 'h00;
    ram[11] = 'h00;
    ram[12] = 'h00;
    ram[13] = 'h03;
    ram[14] = 'h04;
    ram[15] = 'h02;
end

//gets address to access from bus and stores it in Memory address register
always @(posedge clk, posedge rst) begin
	if (rst) begin
		mar <= 4'b0;
	end else if (load) begin
		mar <= bus[3:0];
	end
end

//Outputs the value in RAM at the address mentioned in MAR
assign out = ram[mar];

endmodule
