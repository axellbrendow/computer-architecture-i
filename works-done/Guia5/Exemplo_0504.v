// -------------------------
// Exemplo_0504 - AND USANDO NAND
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module NOT ( input p, output result );

	nand p_NAND_q ( result, p, p );
	
endmodule

module AND ( input p, input q, output result );

	// redes locais
	wire p_nand_q;
	
	// conexao das redes com as saidas das portas logicas
	nand p_NAND_q ( p_nand_q, p, q );
	
	// conexao do resultado com a porta logica final
	NOT p_AND_q ( p_nand_q, result );
	
endmodule

module Exemplo_0504;

	// ------------------------- definicao de dados
	reg p;
	reg q;
	wire result;
	AND myAnd ( p, q, result );
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0504 - Axell Brendow - 631822");
		$display("");
		
		// projetar testes do modulo
		$monitor("and(%b, %b) = %b", p, q, result);
		
		   p = 1; q = 1;
		#1 p = 1; q = 0;
		#1 p = 0; q = 1;
		#1 p = 0; q = 0;
	end
	
endmodule