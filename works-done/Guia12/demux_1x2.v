// -------------------------
// Demultiplexador com 1 bit para seleção e 2 bits para a entrada
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef DEMULTIPLEXER_1X2
`define DEMULTIPLEXER_1X2

`include "demux_1x1.v"

module demux_1x2 (input [1:0] data, input key, output [1:0] out1, output [1:0] out2);

    demux_1x1 demux1(data[0], key, out1[0], out2[0]);
    demux_1x1 demux2(data[1], key, out1[1], out2[1]);

endmodule

`endif