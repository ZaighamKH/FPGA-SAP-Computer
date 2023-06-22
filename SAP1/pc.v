//16 bit program coutner which increments by one at every clock tick if inc flag is high
//if rst flag is set, counter resets to 0
//always outputs the counters value
module pc(
	input clk,
	input rst,
	input inc,
	output[7:0] out
);

reg[3:0] pc;

always @(posedge clk, posedge rst) begin
	if (rst) begin
		pc <= 4'b0;
	end else if (inc) begin
		pc <= pc + 1;
	end
end

assign out = pc;

endmodule

