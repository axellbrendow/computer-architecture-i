// -------------------------
// Multiplexador com 1 bit para selecao e 4 bits para a saida
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef MULTIPLEXER_1X4
`define MULTIPLEXER_1X4

`include "mux_1x2.v"

module mux_1x4 (input [3:0] in1, input [3:0] in2, input key, output [3:0] out);

    mux_1x2 mux1(in1[1:0], in2[1:0], key, out[1:0]);
	mux_1x2 mux2(in1[3:2], in2[3:2], key, out[3:2]);

endmodule

`endif