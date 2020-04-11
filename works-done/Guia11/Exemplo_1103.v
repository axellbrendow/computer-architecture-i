// -------------------------
// Exemplo_1103 - 1-Reconhecedor_de_1010_Moore_Model
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`include "clock.v"

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
				if (in)
				    new_state = state1;
					
				else // --10
				    new_state = state2;
				    
	        state2: //--10
				if (in) // -101
				    new_state = state3;
					
				else
				    new_state = state0;
				    
	        state3: //-101
				if (in)
				    new_state = state0;
					
				else
				    new_state = state4;
				    
	        state4: //1010
				if (in) //-101
				    new_state = state3;
					
				else
				    new_state = state0;
		    
	    endcase
		
	end
	
endmodule

module moore_1010 (input data, input clock, output found);

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

module test;

    reg data;
	wire clk;
	wire found;
	
	clock clock1(clk);
	
	moore_1010 m_1010(data, clk, found);
	
	always @(posedge clk)
	begin
	    $display("%b\t%b", data, found);
	end
	
	initial
	begin
	    $display("");
		$display("Exemplo_1103 - Axell Brendow - 631822");
		$display("");
	    $display("data\tfound");
		$display("");
		
		#10;
		data = 0; #24;
		data = 1; #24;
		data = 0; #24;
		data = 1; #24;
		data = 1; #24;
		data = 1; #24;
		data = 1; #24;
		data = 0; #24;
		data = 0; #24;
		data = 1; #24;
		data = 1; #24;
		data = 0; #24;
		data = 1; #24;
		data = 1; #24;
		data = 1; #24;
		data = 0; #24;
		data = 1; #24;
		data = 0; #24;
		data = 1; #24;
		data = 0; #24;
		data = 1; #24;
		data = 0; #24;
		data = 0; #24;
		
		$finish;
	end

endmodule