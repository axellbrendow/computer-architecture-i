// -------------------------
// Multiplexador com 1 bit para selecao e 2 bits para a saida
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef MULTIPLEXER_1X2
`define MULTIPLEXER_1X2

`include "mux_1x1.v"

module mux_1x2 (input [1:0] in1, input [1:0] in2, input key, output [1:0] out);

    mux_1x1 mux1(in1[0], in2[0], key, out[0]);
	mux_1x1 mux2(in1[1], in2[1], key, out[1]);

endmodule

`endif