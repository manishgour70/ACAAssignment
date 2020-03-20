`timescale 1ns / 1ps

// Programmer Name: Shreyas Maheshwari 
//Programmer ID: 2019H10300031G
// Project Name: Design a 32-bit Booth multiplier circuit using Verilog. 

module Booth #(parameter n=32)(out,a,b);

	// output variable
	output [(2*n):0]out;
	
	// input variables
	input [n:0]a,b;

	// intermediate registers used for computations
	wire [(2*n):0]w[n:0];
	wire [n+1:0]q;
	assign q = {b,1'b0};
	
	// logic for each loop
	assign out=w[0]+(w[1]<<1)+(w[2]<<2)+(w[3]<<3)+(w[4]<<4)+(w[5]<<5)+(w[6]<<6)+(w[7]<<7)+(w[8]<<8)+(w[9]<<9)+(w[10]<<10)+(w[11]<<11)+(w[12]<<12)+(w[13]<<13)+(w[14]<<14)+(w[15]<<15)+(w[16]<<16)+(w[17]<<17)+(w[18]<<18)+(w[19]<<19)+(w[20]<<20)+(w[21]<<21)+(w[22]<<22)+(w[23]<<23)+(w[24]<<24)+(w[25]<<25)+(w[26]<<26)+(w[27]<<27)+(w[28]<<28)+(w[29]<<29)+(w[30]<<30)+(w[31]<<31);
	
	// looping constant
	genvar i;
	generate
	
	// calling MUX function
		for(i=0;i<=32;i=i+1)
			begin
			MUX #(.n(32))m1(w[i],a,q[i+1:i]);
			end
	endgenerate
endmodule
//parameter 32 for 32bit
module MUX #(parameter n=32) (out,a,s);
	output reg [(2*n):0]out;
	input [n:0]a;
	input [1:0]s;

	always @ (a,s)
		begin
			case(s)
			2'b00: out<=0;
			2'b01: out<= a;
			2'b10: out<= ~a+1;
			2'b11: out<=0;
			endcase
		end
endmodule