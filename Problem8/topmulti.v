// Top-level Module of a Multicycle MIPS processor
//Programmer name:Manish Gour
//Programmer ID: 2019H1030025G

module topmulti(input         clk, reset, 
                output [31:0] writedata, adr, 
                output        memwrite);

  wire [31:0] readdata;
  
  // instantiate processor and memory
  mips mips(clk, reset, adr, writedata, memwrite, readdata);
  mem mem(clk, memwrite, adr, writedata, readdata);

endmodule
