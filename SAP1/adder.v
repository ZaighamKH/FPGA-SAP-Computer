//add or subtract the inputs based on the input sub
module adder(
	input[7:0] a,
	input[7:0] b,
	input sub,
	output[7:0] out
);

//if sub is 0, then add else subtract if sub is 0
assign out = (sub) ? a-b : a+b;

endmodule

