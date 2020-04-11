// -------------------------
// Exemplo_0505 - OR USANDO NOR
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module NOT ( input p, output result );

	nor p_NOR_q ( result, p, p );
	
endmodule

module OR ( input p, input q, output result );

	// redes locais
	wire p_nor_q;
	
	// conexao das redes com as saidas das portas logicas
	nor p_NOR_q ( p_nor_q, p, q );
	
	// conexao do resultado com a porta logica final
	NOT p_AND_q ( p_nor_q, result );
	
endmodule

module Exemplo_0505;

	// ------------------------- definicao de dados
	reg p;
	reg q;
	wire result;
	OR myOr ( p, q, result );
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0505 - Axell Brendow - 631822");
		$display("");
		
		// projetar testes do modulo
		$monitor("or(%b, %b) = %b", p, q, result);
		
		   p = 1; q = 1;
		#1 p = 1; q = 0;
		#1 p = 0; q = 1;
		#1 p = 0; q = 0;
	end
	
endmodule