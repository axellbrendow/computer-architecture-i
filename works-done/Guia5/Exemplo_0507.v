// -------------------------
// Exemplo_0507 - XNOR USANDO NOR
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

module AND ( input p, input q, output result );

	// redes locais
	wire not_p;
	wire not_q;
	
	// conexao das redes com as saidas das portas logicas
	NOT NOT_p ( p, not_p );
	NOT NOT_q ( q, not_q );
	
	// conexao do resultado com a porta logica final
	nor p_NOR_q ( result, not_p, not_q );
	
endmodule

module XNOR ( input p, input q, output result );

	// redes locais
	wire not_p;
	wire not_q;
	wire not_p_and_not_q;
	wire p_and_q;
	
	// conexao das redes com as saidas das portas logicas
	NOT NOT_p(p, not_p);
	NOT NOT_q(q, not_q);
	AND not_p_AND_not_q(not_p, not_q, not_p_and_not_q);
	AND p_AND_q(p, q, p_and_q);
	
	// conexao do resultado com a porta logica final
	OR AND_OR_AND(not_p_and_not_q, p_and_q, result);
	
endmodule

module Exemplo_0507;

	// ------------------------- definicao de dados
	reg p;
	reg q;
	wire result;
	XNOR myXnor ( p, q, result );
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0507 - Axell Brendow - 631822");
		$display("");
		
		// projetar testes do modulo
		$monitor("xnor(%b, %b) = %b", p, q, result);
		
		   p = 1; q = 1;
		#1 p = 1; q = 0;
		#1 p = 0; q = 1;
		#1 p = 0; q = 0;
	end
	
endmodule