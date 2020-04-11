// -------------------------
// Demultiplexador com 4 bits para seleção e 1 bit para a entrada
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef DEMULTIPLEXER_4X1
`define DEMULTIPLEXER_4X1

`include "demux_3x1.v"

module demux_4x1 (input data, input [3:0] key, input enable, output out1, output out2, output out3, output out4, output out5, output out6, output out7, output out8, output out9, output out10, output out11, output out12, output out13, output out14, output out15, output out16);

    wire key_last_bit_negated; // most left bit
    
    not key_last_bit_negated_gate(key_last_bit_negated, key[3]);
    
    wire enable_demux1, enable_demux2;
    
    and enable_demux1_gate(enable_demux1, enable, key_last_bit_negated);
    and enable_demux2_gate(enable_demux2, enable, key[3]                          );
    
    demux_3x1 demux1(data, key[2:0], enable_demux1, out1, out2, out3, out4, out5, out6, out7, out8);
    demux_3x1 demux2(data, key[2:0], enable_demux2, out9, out10, out11, out12, out13, out14, out15, out16);

endmodule

`endif