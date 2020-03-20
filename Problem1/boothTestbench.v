`timescale 1ns / 1ps
// Programmer Name: Shreyas Maheshwari 
// Programmer ID:2019H10300031G
// Project Name: Design a 32-bit Booth multiplier circuit using Verilog. 
module boothTestbench;
	// specifying inputs and outputs
	wire [64:0]out;
	reg [32:0]a,b;

	Booth #(.n(32))uut(.out(out),.a(a),.b(b));

	initial
		begin
		#5 a=32'd20;b=32'd12;
		end
endmodule