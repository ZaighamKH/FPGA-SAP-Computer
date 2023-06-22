module clock(
	input hlt,
	input clk_in,
	output clk_out);

//stop the clock if hlt flag is 1
assign clk_out = (hlt) ? 1'b0 : clk_in;

endmodule

