// -------------------------
// Exemplo_0602 - 2-AND_e_OR_1_Resposta_Selecionavel
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

// if key = 0, output is a, else, output is b
module multiplexer(input a, input b, input key, output out);

	wire not_key;
	wire a_and_not_key;
	wire b_and_key;
	
	not(not_key, key);
	
	// if key = 0, not_key = 1 and, and(a, not_key) = a
	// if key = 1, not_key = 0 and, and(a, not_key) = 0
	and(a_and_not_key, a, not_key);
	
	// if key = 1, and(b, key) = b
	// if key = 0, and(b, key) = 0
	and(b_and_key, b, key);
	
	// if key = 0, b_and_key = 0, so, who decides the or result is a
	// if key = 1, a_and_not_key = 0, so, who decides the or result is b
	or(out, a_and_not_key, b_and_key);

endmodule

module AND_OR ( input a, input b, output and1, output or1 );

	and(and1, a, b);
	or(or1, a, b);
	
endmodule

module Exemplo_0602;

	// ------------------------- data definition
	reg a;
	reg b;
	reg key;
	wire a_and_b, a_or_b;
	wire choosed_operation_result;
	
	AND_OR and_or ( a, b, a_and_b, a_or_b );
	multiplexer mux (a_or_b, a_and_b, key, choosed_operation_result);
	
	// ------------------------- main part
	initial
	begin : main
		$display("");
		$display("Exemplo_0602 - Axell Brendow - 631822");
		$display("");
		$display("key = 0  -->  or is used");
		$display("key = 1  -->  and is used");
		$display("");
		
		// projecting module tests
		$monitor("(%b, %b) = %b", a, b, choosed_operation_result);
		
		$display("for key = 0");
		   a = 1; b = 1; key = 0;
		#1 a = 1; b = 0;
		#1 a = 0; b = 1;
		#1 a = 0; b = 0;
		
		#1 $display("\nfor key = 1");
		   a = 1; b = 1; key = 1;
		#1 a = 1; b = 0;
		#1 a = 0; b = 1;
		#1 a = 0; b = 0;
	end
	
endmodule