// -------------------------
// Exemplo_0903 - 3-Varios_geradores_de_pulso
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`include "clock.v"

module pulse1(input clock, output signal);

    reg signal;
	
	// executa sempre que clock mudar para a borda positiva
	always @(posedge clock)
	begin
		   signal = 1'b1;
		#4 signal = 1'b0;
		#4 signal = 1'b1;
		#4 signal = 1'b0;
		#4 signal = 1'b1;
		#4 signal = 1'b0;
	end

endmodule

module pulse2(input clock, output signal);

    reg signal;
	
	// executa sempre que clock mudar para a borda positiva
	always @(posedge clock)
	begin
		   signal = 1'b1;
		#5 signal = 1'b0;
	end

endmodule

module pulse3(input clock, output signal);

    reg signal;
	
	// executa sempre que clock mudar para a borda negativa
	always @(negedge clock)
	begin
		    signal = 1'b1;
		#15 signal = 1'b0;
		#15 signal = 1'b1;
	end

endmodule

module pulse4(input clock, output signal);

    reg signal;
	
	// executa sempre que clock mudar para a borda negativa
	always @(negedge clock)
	begin
		    signal = 1'b1;
		#20 signal = 1'b0;
		#20 signal = 1'b1;
		#20 signal = 1'b0;
	end

endmodule

module Exemplo_0903;

	// ------------------------- definicao de dados
	wire clock1;
	clock clk1(clock1);
	
	wire pulse1;
	wire pulse2;
	wire pulse3;
	wire pulse4;
	pulse1 pul1(clock1, pulse1);
	pulse2 pul2(clock1, pulse2);
	pulse3 pul3(clock1, pulse3);
	pulse4 pul4(clock1, pulse4);
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0903 - Axell Brendow - 631822");
		$display("");
		
		$dumpfile("Exemplo_0903.vcd");
		
		// O parametro 1 informa que apenas as variaveis do modulo
		// Exemplo_0903 devem ser analisadas, nao importando os outros
		// modulos que forem criados a partir desse. Os outros parametros
		// informam quais as variaveis que quero despejar no arquivo.
		$dumpvars(1, clock1, pulse1, pulse2, pulse3, pulse4);
		
		#480 $finish;
	end
	
endmodule