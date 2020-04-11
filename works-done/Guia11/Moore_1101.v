// -------------------------
// Moore_1101 - 1-Reconhecedor_de_1101_Moore_Model
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`include "clock.v"

`ifndef MOORE_1101_V
`define MOORE_1101_V

module moore_state_manager (input in, input clock, input [2:0] curr_state, output [2:0] new_state);

    parameter
	    state0 = 3'b000,
	    state1 = 3'b001,
	    state2 = 3'b010,
	    state3 = 3'b011,
	    state4 = 3'b100;

    reg [2:0] new_state;
	
    always @(posedge clock)
	begin
	
	    case (curr_state)
	    
	        state0: //---- ou ---0
				if (in) //---1
				    new_state = state1;
				
				else
				    new_state = state0;
					
	        state1: //---1
				if (in) //--11
				    new_state = state2;
					
				else
				    new_state = state0;
				    
	        state2: //--11
				if (in)
				    new_state = state2;
					
				else //-011
				    new_state = state3;
				    
	        state3: //-011
				if (in) //1011
				    new_state = state4;
					
				else
				    new_state = state0;
				    
	        state4: //1011
				if (in) //--11
				    new_state = state2;
					
				else
				    new_state = state0;
				    
	    endcase
		
	end
	
endmodule

module moore_1101 (input data, input clock, output found);

	reg [2:0] curr_state = 3'b000;
	wire [2:0] new_state;
	reg found = 1'b0;
	
	moore_state_manager sm(data, clock, curr_state, new_state);
	
	always @(new_state)
	begin
	    curr_state = new_state;
	    found = curr_state[2];
	end
	
endmodule

`endif