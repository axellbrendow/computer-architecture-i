// -------------------------
// Exemplo_0502 - OR USANDO NAND
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

module Exemplo_0502;

	// ------------------------- definicao de dados
	reg p;
	reg q;
	wire result;
	OR myOr ( p, q, result );
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0502 - Axell Brendow - 631822");
		$display("");
		
		// projetar testes do modulo
		$monitor("or(%b, %b) = %b", p, q, result);
		
		   p = 1; q = 1;
		#1 p = 1; q = 0;
		#1 p = 0; q = 1;
		#1 p = 0; q = 0;
	end
	
endmodule