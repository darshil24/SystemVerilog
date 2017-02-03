//Greg Stitt
//University of Florida


module mux_2x1(in1, in2,sel,mux_output
	
		);	
		input   in1;
		input    in2;
		input   sel;
		output   mux_output;
		logic  mux_output;
	
always  @(sel)
	begin: case_Statement
		case (sel) 
		  1'b0   : mux_output <= in1; 
		  default : mux_output <= in2; 
		endcase 	
	end
	
always @(sel)
	begin : if_statement
		if (sel) 
			mux_output <= in2;
		else 
			mux_output = in1;
	end	
endmodule



















