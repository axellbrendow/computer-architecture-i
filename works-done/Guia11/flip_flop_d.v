// -------------------------
// Flip-Flop D
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef FLIP_FLOP_D_V
`define FLIP_FLOP_D_V

module flip_flop_d (input data, input clock, output last_saved_data, output last_saved_data_negated);

    wire data_negated;
    wire data_negated_or_1, negation_of_data_negated_or_1;
	
	not not1(data_negated, data);
	
	// quando o clock esta' em 0, as nands1,2 sempre retornam 1
	// quando o clock esta' em 1, as nands1,2 sempre retornam a
	// negacao do seu segundo parametro.
    nand nand1(data_negated_or_1, data, clock);
	nand nand2(negation_of_data_negated_or_1, data_negated, clock);
	
	// quando o clock esta' em 0, as nands3,4 permanecem com seus valores
	// quando o clock esta' em 1, num primeiro momento, a resposta da nand3
	// ou da nand4 fica indeterminada. Porem, quando a nand3 fica indeterminada,
	// pela natureza do circuito, a nand4 esta' com um valor estabelecido e este
    // e' responsavel por remover a indeterminacao da nand3. Funciona analogamente
	// quando quem esta' indeterminada e' a nand4.
	nand nand3(last_saved_data, data_negated_or_1, last_saved_data_negated);
	nand nand4(last_saved_data_negated, negation_of_data_negated_or_1, last_saved_data);

endmodule

`endif