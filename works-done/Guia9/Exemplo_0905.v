// -------------------------
// Exemplo_0905 - 5-Gerador_com_4_vezes_a_frequencia_do_clock
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`include "clock.v"

module pulse1(input clock, output signal);

    reg signal;
	
	// executa sempre que o clock mudar
	always @(clock)
	begin
		signal = 1'b1; #3;
		signal = 1'b0; #3;
		signal = 1'b1; #3;
		signal = 1'b0; #2;
		// para cada ciclo do clock, este pulso faz 4 ciclos
	end

endmodule

module Exemplo_0905;

	// ------------------------- definicao de dados
	wire clock1;
	clock clk1(clock1);
	
	wire pulse1;
	pulse1 pul1(clock1, pulse1);
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0905 - Axell Brendow - 631822");
		$display("");
		
		$dumpfile("Exemplo_0905.vcd");
		
		// O parametro 1 informa que apenas as variaveis do modulo
		// Exemplo_0905 devem ser analisadas, nao importando os outros
		// modulos que forem criados a partir desse. Os outros parametros
		// informam quais as variaveis que quero despejar no arquivo.
		$dumpvars(1, clock1, pulse1);
		
		#480 $finish;
	end
	
endmodule