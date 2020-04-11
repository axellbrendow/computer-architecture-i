// -------------------------
// Exemplo_0906 - 6-Gerador_sincronizado_com_a_borda_de_subida_e_com_tempo_de_2_unidades
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`include "clock.v"

module pulse1(input clock, output signal);

    reg signal;
	
	// executa sempre que clock mudar para a borda positiva
	always @(posedge clock)
	begin
		signal = 1'b1; #2;
		signal = 1'b0; #2;
		signal = 1'b1; #2;
		signal = 1'b0; #2;
		signal = 1'b1; #2;
		signal = 1'b0;
		// para cada borda negativa do clock, este pulso faz 3 ciclos
	end

endmodule

module Exemplo_0906;

	// ------------------------- definicao de dados
	wire clock1;
	clock clk1(clock1);
	
	wire pulse1;
	pulse1 pul1(clock1, pulse1);
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0906 - Axell Brendow - 631822");
		$display("");
		
		$dumpfile("Exemplo_0906.vcd");
		
		// O parametro 1 informa que apenas as variaveis do modulo
		// Exemplo_0906 devem ser analisadas, nao importando os outros
		// modulos que forem criados a partir desse. Os outros parametros
		// informam quais as variaveis que quero despejar no arquivo.
		$dumpvars(1, clock1, pulse1);
		
		#480 $finish;
	end
	
endmodule