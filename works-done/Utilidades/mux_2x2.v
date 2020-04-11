// -------------------------
// Multiplexador com 2 bits para selecao e 2 bits para a saida
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef MULTIPLEXER_2X2
`define MULTIPLEXER_2X2

`include "mux_2x1.v"

module mux_2x2 (input [1:0] in1, input [1:0] in2, input [1:0] in3, input [1:0] in4, input [1:0] key, output [1:0] out);

    mux_2x1 mux1(in1[0], in2[0], in3[0], in4[0], key, out[0]);
    mux_2x1 mux2(in1[1], in2[1], in3[1], in4[1], key, out[1]);

endmodule

`endif