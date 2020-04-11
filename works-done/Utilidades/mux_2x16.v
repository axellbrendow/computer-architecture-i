// -------------------------
// Multiplexador com 2 bits para selecao e 16 bits para a saida
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef MULTIPLEXER_2X16
`define MULTIPLEXER_2X16

`include "mux_2x8.v"

module mux_2x16 (input [15:0] in1, input [15:0] in2, input [15:0] in3, input [15:0] in4, input [1:0] key, output [15:0] out);

    mux_2x8 mux1(in1[7:0], in2[7:0], in3[7:0], in4[7:0], key, out[7:0]);
    mux_2x8 mux2(in1[15:8], in2[15:8], in3[15:8], in4[15:8], key, out[15:8]);

endmodule

`endif