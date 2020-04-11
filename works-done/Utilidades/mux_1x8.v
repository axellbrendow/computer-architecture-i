// -------------------------
// Multiplexador com 1 bit para selecao e 8 bits para a saida
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef MULTIPLEXER_1X8
`define MULTIPLEXER_1X8

`include "mux_1x4.v"

module mux_1x8 (input [7:0] in1, input [7:0] in2, input key, output [7:0] out);

    mux_1x4 mux1(in1[3:0], in2[3:0], key, out[3:0]);
	mux_1x4 mux2(in1[7:4], in2[7:4], key, out[7:4]);

endmodule

`endif