// -------------------------
// Exemplo_0601 - 1-AND_e_OR_2_Respostas
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module AND_OR ( input a, input b, output and1, output or1 );

	and(and1, a, b);
	or(or1, a, b);
	
endmodule

module Exemplo_0601;

	// ------------------------- definicao de dados
	reg a;
	reg b;
	wire a_and_b, a_or_b;
	
	AND_OR and_or ( a, b, a_and_b, a_or_b );
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0601 - Axell Brendow - 631822");
		$display("");
		
		// projetar testes do modulo
		$monitor("and(%b, %b) = %b\nor(%b, %b) = %b\n", a, b, a_and_b, a, b, a_or_b);
		
		   a = 1; b = 1;
		#1 a = 1; b = 0;
		#1 a = 0; b = 1;
		#1 a = 0; b = 0;
	end
	
endmodule