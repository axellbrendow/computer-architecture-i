// -------------------------
// Multiplexador com 2 bits para selecao e 8 bits para a saida
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef MULTIPLEXER_2X8
`define MULTIPLEXER_2X8

`include "mux_2x4.v"

module mux_2x8 (input [7:0] in1, input [7:0] in2, input [7:0] in3, input [7:0] in4, input [1:0] key, output [7:0] out);

    mux_2x4 mux1(in1[3:0], in2[3:0], in3[3:0], in4[3:0], key, out[3:0]);
    mux_2x4 mux2(in1[7:4], in2[7:4], in3[7:4], in4[7:4], key, out[7:4]);

endmodule

`endif