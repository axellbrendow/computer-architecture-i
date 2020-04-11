// -------------------------
// Exemplo_0904 - 4-Gerador_com_metade_da_frequencia_do_clock
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`include "clock.v"

module pulse1(input clock, output signal);

    reg signal;
	
	// executa sempre que o clock mudar
	always @(clock)
	begin
	    signal = 1'b1; #24;
		signal = 1'b0; #23;
		// para cada 2 ciclos do clock, este pulso faz 1 ciclo
	end

endmodule

module Exemplo_0904;

	// ------------------------- definicao de dados
	wire clock1;
	clock clk1(clock1);
	
	wire pulse1;
	pulse1 pul1(clock1, pulse1);
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0904 - Axell Brendow - 631822");
		$display("");
		
		$dumpfile("Exemplo_0904.vcd");
		
		// O parametro 1 informa que apenas as variaveis do modulo
		// Exemplo_0904 devem ser analisadas, nao importando os outros
		// modulos que forem criados a partir desse. Os outros parametros
		// informam quais as variaveis que quero despejar no arquivo.
		$dumpvars(1, clock1, pulse1);
		
		#480 $finish;
	end
	
endmodule