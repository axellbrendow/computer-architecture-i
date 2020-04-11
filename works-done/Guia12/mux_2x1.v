// -------------------------
// Multiplexador com 2 bits para selecao e 1 bit para a saida
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef MULTIPLEXER_2X1
`define MULTIPLEXER_2X1

`include "mux_1x1.v"

module mux_2x1 (input in1, input in2, input in3, input in4, input [1:0] key, output out);

    wire mux1_out, mux2_out;
	
	mux_1x1 mux1(in1, in3, key[1], mux1_out);
	mux_1x1 mux2(in2, in4, key[1], mux2_out);
	mux_1x1 mux3(mux1_out, mux2_out, key[0], out);

endmodule

`endif