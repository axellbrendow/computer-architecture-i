// -------------------------
// Multiplexador com 1 bit para selecao e 16 bits para a saida
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef MULTIPLEXER_1X16
`define MULTIPLEXER_1X16

`include "mux_1x8.v"

module mux_1x16 (input [15:0] in1, input [15:0] in2, input key, output [15:0] out);

    mux_1x8 mux1(in1[7:0], in2[7:0], key, out[7:0]);
	mux_1x8 mux2(in1[15:8], in2[15:8], key, out[15:8]);

endmodule

`endif