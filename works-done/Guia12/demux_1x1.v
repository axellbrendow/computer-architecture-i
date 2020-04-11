// -------------------------
// Demultiplexador com 1 bit para seleção e 1 bit para a entrada
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef DEMULTIPLEXER_1X1
`define DEMULTIPLEXER_1X1

module demux_1x1 (input data, input key, output out1, output out2);

    wire key_negated;
	not key_negated_gate(key_negated, key);
	
	and and1(out1, key_negated, data);
	and and2(out2, key, data);

endmodule

`endif