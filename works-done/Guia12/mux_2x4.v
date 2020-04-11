// -------------------------
// Multiplexador com 2 bits para selecao e 4 bits para a saida
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef MULTIPLEXER_2X4
`define MULTIPLEXER_2X4

`include "mux_2x2.v"

module mux_2x4 (input [3:0] in1, input [3:0] in2, input [3:0] in3, input [3:0] in4, input [1:0] key, output [3:0] out);

    mux_2x2 mux1(in1[1:0], in2[1:0], in3[1:0], in4[1:0], key, out[1:0]);
    mux_2x2 mux2(in1[3:2], in2[3:2], in3[3:2], in4[3:2], key, out[3:2]);

endmodule

`endif