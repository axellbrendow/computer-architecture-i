// -------------------------
// Mealy_1101 - 1-Reconhecedor_de_1101_Mealy_Model
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`include "clock.v"

`ifndef MEALY_1101_V
`define MEALY_1101_V

module mealy_state_manager (input in, input clock, input [1:0] curr_state, output [1:0] new_state, output found);

    parameter
	    state0 = 2'b00,
	    state1 = 2'b01,
	    state2 = 2'b10,
	    state3 = 2'b11;

    reg [1:0] new_state;
	reg found = 1'b0;
	
    always @(posedge clock)
	begin
	
	    case (curr_state)
	    
	        state0: //---- ou ---0
				if (in) //---1
				begin
				    new_state = state1;
					found = 1'b0;
				end
				
				else
				begin
				    new_state = state0;
				    found = 1'b0;
				end
					
	        state1: //---1
				if (in) //--11
				begin
				    new_state = state2;
					found = 1'b0;
				end
				
				else
				begin
				    new_state = state0;
				    found = 1'b0;
				end
					
	        state2: //--11
				if (in)
				begin
				    new_state = state2;
					found = 1'b0;
				end
				
				else //-011
				begin
				    new_state = state3;
				    found = 1'b0;
				end
					
	        state3: //-011
				if (in) //1011
				begin
				    new_state = state1;
					found = 1'b1;
				end
				
				else
				begin
				    new_state = state0;
				    found = 1'b0;
				end
		    
	    endcase
		
	end
	
endmodule

module mealy_1101 (input data, input clock, output found);

	reg [1:0] curr_state;
	wire [1:0] new_state;
	
	mealy_state_manager sm(data, clock, curr_state, new_state, found);
	
	initial
	begin
	    curr_state = 2'b00;
	end
	
	always @(new_state)
	begin
	    curr_state = new_state;
	end
	
endmodule

`endif