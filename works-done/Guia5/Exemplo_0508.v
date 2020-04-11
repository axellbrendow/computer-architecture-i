// -------------------------
// Exemplo_0508 - p_AND_not_q USANDO NOR
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module NOT ( input p, output result );

	nor p_NOR_q ( result, p, p );
	
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

module p_AND_not_q ( input p, input q, output result );

	// redes locais
	wire not_q;
	
	// conexao das redes com as saidas das portas logicas
	NOT NOT_q(q, not_q);
	
	// conexao do resultado com a porta logica final
	AND p_AND_not_q(p, not_q, result);
	
endmodule

module Exemplo_0508;

	// ------------------------- definicao de dados
	reg p;
	reg q;
	wire result;
	p_AND_not_q p_and_not_q ( p, q, result );
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0508 - Axell Brendow - 631822");
		$display("");
		
		// projetar testes do modulo
		$monitor("p_AND_not_q(%b, %b) = %b", p, q, result);
		
		   p = 1; q = 1;
		#1 p = 1; q = 0;
		#1 p = 0; q = 1;
		#1 p = 0; q = 0;
	end
	
endmodule