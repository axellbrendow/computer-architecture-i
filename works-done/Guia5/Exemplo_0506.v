// -------------------------
// Exemplo_0506 - XOR USANDO NAND
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module NOT ( input p, output result );

	nand p_NAND_q ( result, p, p );
	
endmodule

module OR ( input p, input q, output result );

	// redes locais
	wire not_p;
	wire not_q;
	
	// conexao das redes com as saidas das portas logicas
	NOT NOT_p ( p, not_p );
	NOT NOT_q ( q, not_q );
	
	// conexao do resultado com a porta logica final
	nand p_NAND_q ( result, not_p, not_q );
	
endmodule

module AND ( input p, input q, output result );

	// redes locais
	wire p_nand_q;
	
	// conexao das redes com as saidas das portas logicas
	nand p_NAND_q ( p_nand_q, p, q );
	
	// conexao do resultado com a porta logica final
	NOT p_AND_q ( p_nand_q, result );
	
endmodule

module XOR ( input p, input q, output result );

	// redes locais
	wire not_p;
	wire not_q;
	wire not_p_or_not_q;
	wire p_or_q;
	
	// conexao das redes com as saidas das portas logicas
	NOT NOT_p(p, not_p);
	NOT NOT_q(q, not_q);
	OR not_p_OR_not_q(not_p, not_q, not_p_or_not_q);
	OR p_OR_q(p, q, p_or_q);
	
	// conexao do resultado com a porta logica final
	AND OR_AND_OR(not_p_or_not_q, p_or_q, result);
	
endmodule

module Exemplo_0506;

	// ------------------------- definicao de dados
	reg p;
	reg q;
	wire result;
	XOR myXor ( p, q, result );
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0506 - Axell Brendow - 631822");
		$display("");
		
		// projetar testes do modulo
		$monitor("xor(%b, %b) = %b", p, q, result);
		
		   p = 1; q = 1;
		#1 p = 1; q = 0;
		#1 p = 0; q = 1;
		#1 p = 0; q = 0;
	end
	
endmodule