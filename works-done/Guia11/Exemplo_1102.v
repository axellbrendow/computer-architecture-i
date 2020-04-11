// -------------------------
// Exemplo_1102 - 1-Reconhecedor_de_101_Mealy_Model
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`include "clock.v"

module mealy_state_manager (input in, input clock, input [1:0] curr_state, output [1:0] new_state, output found);

    parameter
	    state0 = 2'b00,
	    state1 = 2'b01,
	    state2 = 2'b10;

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
					
	        state1: //--1
				if (in)
				begin
				    new_state = state1;
					found = 1'b0;
				end
				
				else // -01
				begin
				    new_state = state2;
				    found = 1'b0;
				end
					
	        state2: //-01
				if (in) // 101
				begin
				    new_state = state0;
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

module mealy_101 (input data, input clock, output found);

	reg [1:0] curr_state = 2'b00;
	wire [1:0] new_state;
	
	mealy_state_manager sm(data, clock, curr_state, new_state, found);
	
	always @(new_state)
	begin
	    curr_state = new_state;
	end
	
endmodule

module test;

    reg data;
	wire clk;
	wire found;
	
	clock clock1(clk);
	
	mealy_101 m_101(data, clk, found);
	
	always @(posedge clk)
	begin
	    #2 $display("%b\t%b", data, found);
	end
	
	initial
	begin
	    $display("");
		$display("Exemplo_1102 - Axell Brendow - 631822");
		$display("");
	    $display("data\tfound");
		$display("");
		
		#10;
		data = 0; #24;
		data = 1; #24;
		data = 0; #24;
		data = 1; #24;
		data = 0; #24;
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
		
		$finish;
	end

endmodule