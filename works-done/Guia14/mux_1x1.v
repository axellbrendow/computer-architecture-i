// -------------------------
// Multiplexador com 1 bit para selecao e 1 bit para a saida
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef MULTIPLEXER_1X1
`define MULTIPLEXER_1X1

module mux_1x1 (input in1, input in2, input key, output out);

    wire key_negated;
	not key_negated_gate(key_negated, key);
	
	wire new_in1, new_in2;
	and and1(new_in1, key_negated, in1);
	and and2(new_in2, key, in2);
	
	or or1(out, new_in1, new_in2);

endmodule

`endif