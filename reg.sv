//Greg Stitt
//University of Florida
module register(
 
	clk ,		// define clk as input
	reset,		// define reset as input
	ld,			// define ld as input
	regin,		// define regin as input
	regout		// define regout as output
);
parameter WIDTH = 16;
input clk,reset,ld,regin[WIDTH-1 : 0];
output regout[WIDTH-1 : 0];
logic regout[WIDTH-1 : 0];


always @( reset, clk)	// @ symbol is for delay,  prenthesis contains the sensitivity list
	begin : ASYNC_RST
	// always is same as architecture block in VHDL
	if (reset) 
		regout <= {regout[WIDTH-1],1'b0};
	else if (~reset &&  clk)
		
		regout = regin;
	end	
		
		
always @(reset,clk)
begin : SYNC_RST
	 if (clk)
		if (reset) 
			regout <= {regout[WIDTH-1],1'b0};
		else 
			regout = regin;
end
endmodule
		

		