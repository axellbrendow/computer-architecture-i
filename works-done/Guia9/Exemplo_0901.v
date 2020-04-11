// -------------------------
// Exemplo_0901 - 1-Gerador_de_clock
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

module Exemplo_0901;

	// ------------------------- definicao de dados
	wire clk;
	clock clock1(clk);
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0901 - Axell Brendow - 631822");
		$display("");
		
		$dumpfile("Exemplo_0901.vcd");
		$dumpvars;
		
		#120 $finish;
	end
	
endmodule