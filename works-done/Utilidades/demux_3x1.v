// -------------------------
// Demultiplexador com 3 bits para seleção e 1 bit para a entrada
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef DEMULTIPLEXER_3X1
`define DEMULTIPLEXER_3X1

`include "demux_2x1.v"

module demux_3x1 (input data, input [2:0] key, input enable, output out1, output out2, output out3, output out4, output out5, output out6, output out7, output out8);

    wire key_last_bit_negated; // most left bit
    
    not key_last_bit_negated_gate(key_last_bit_negated, key[2]);
    
    wire enable_demux1, enable_demux2;
    
    and enable_demux1_gate(enable_demux1, enable, key_last_bit_negated);
    and enable_demux2_gate(enable_demux2, enable, key[2]                          );
    
    demux_2x1 demux1(data, key[1:0], enable_demux1, out1, out2, out3, out4);
    demux_2x1 demux2(data, key[1:0], enable_demux2, out5, out6, out7, out8);

endmodule

`endif