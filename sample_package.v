package definitions;
	parameter VERSION = "1.1";
	
	typedef enum {ADD, SUB, MUL} opcodes_t;
	
	typedef struct {
		logic [31:0] a, b;
		opcodes_t opcode;
	} instruction_t;
	function automatic [31:0] multiplier (input [31:0] a, b);
		// code for a custom 32-bit multiplier goes here
		return a * b; // abstract multiplier (no error detection)
	endfunction
endpackage