// -------------------------
// RAM_1X1 (1 endereco para 1 bit)
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef RAM_1X1_V
`define RAM_1X1_V

`include "flip_flop_jk_master_slave.v"

/*
(IGNORAR TODO O COMENTARIO)
enable -> Se igual a 0, desativa a memoria RAM e coloca sua saida como 0. Se igual a 1, ativa a memoria RAM e permite a leitura e a escrita.
read_write -> Se igual a 1, coloca a memoria RAM no estado de escrita. Se igual a 0, coloca no estado de leitura.
clock -> Se igual a 0, nao permite realizar leitura nem escrita. Se igual a 1, permite a leitura ou a escrita de acordo com o read_write.
data -> Dado a ser guardado na escrita.
clear -> Escreve 0 na memoria. E' independente de qualquer uma das outras entradas (enable, clock, read_write). E' necessario fazer o clear
pelo menos uma vez antes de usar a memoria pela primeira vez.
*/

module ram_1x1 (input enable, input read_write, input clock, input data, input clear, output saved_data_or_0);

    wire jk_clock;
	and jk_clock_gate(jk_clock, clock, enable, read_write); // so' permite a gravacao no jk se o clock, o enable e o read_write forem iguais a 1
	
	wire data_negated;
	not data_negated_gate(data_negated, data);
	
	wire saved_data, saved_data_negated;
	flip_flop_jk_master_slave ff_jk_master_slave(jk_clock, data, data_negated, 1'b0, clear, saved_data, saved_data_negated);
	
	and module_out_gate(saved_data_or_0, enable, saved_data);

endmodule

`endif