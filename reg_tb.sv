`timescale 1ns/1ps
/* timescale 1ns / 10ps
the software tool is instructed to use time units of 1 nanosecond,
and a precision of 10 picoseconds, which is 2 decimal places, relative to 1 nanosecond. */
module top;
  bit clk;
  bit rst;
  
  parameter WIDTH = 16;
  
  logic [WIDTH-1 : 0] reg_in;
  logic [WIDTH-1 : 0] reg_out_asynch_rst;
  logic [WIDTH-1 : 0] reg_out_synch_rst;

  
  \reg1(sync_rst) #(.width(WIDTH)) synch_rst(
    .clk(clk),
	.rst(rst),
	.reg_in(reg_in),
	.reg_out(reg_out_synch_rst)
  );
  
  
  
  always #10 clk = ~clk;
  
  initial
  fork
    rst = 1;
	reg_in <= 0;
	#100 rst = 0;
	#153 rst = 1;
	#200 rst = 0;
	
	#100 for (int i = 0; i < 2^(WIDTH-1); i++)
	begin
	  reg_in <= i;
	  @(posedge clk);	  
	end
	
  join

endmodule