// -------------------------
// Exemplo_0902 - 2-Gerador_de_pulso_e_gatilho
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module clock(output clk);

    reg clk;
	
    initial // executa quando o modulo for iniciado
	begin
	    clk = 1'b0; // inicia o clock no nivel baixo
	end
	
    always // executa repetidas vezes ate' que o programa seja finalizado
	begin
	    #12 clk = ~clk; // espera 12 unidades de tempo padrao e muda o clk
	end

endmodule

module pulse(input clock, output signal);

    reg signal;
	
	// executa sempre que o clock mudar
	always @(clock)
	begin
	       signal = 1'b1;
		#3 signal = 1'b0;
		#3 signal = 1'b1;
		#3 signal = 1'b0;
	end

endmodule

module trigger(input clock, input on, output signal);

    reg signal;
	
	// executa sempre que clock mudar para a borda positiva e on for 1
	always @(posedge clock & on)
	begin
	    #60 signal = 1'b1;
	    #60 signal = 1'b0;
	end

endmodule

module Exemplo_0902;

	// ------------------------- definicao de dados
	wire clock1;
	clock clk1(clock1);
	
	wire pulse1;
	pulse pul1(clock1, pulse1);
	
	reg on;
	wire trigger1;
	trigger trig1(clock1, on, trigger1);
	
	initial
	begin
	    on = 1'b0;
	end
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0902 - Axell Brendow - 631822");
		$display("");
		
		$dumpfile("Exemplo_0902.vcd");
		
		// O parametro 1 informa que apenas as variaveis do modulo
		// Exemplo_0902 devem ser analisadas, nao importando os outros
		// modulos que forem criados a partir desse. Os outros parametros
		// informam quais as variaveis que quero despejar no arquivo.
		$dumpvars(1, clock1, pulse1, on, trigger1);
		
		#060 on = 1'b1;
		#120 on = 1'b0;
		#180 on = 1'b1;
		#240 on = 1'b0;
		#300 on = 1'b1;
		#360 on = 1'b0;
		#376 $finish;
	end
	
endmodule