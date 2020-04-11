// -------------------------
// Demultiplexador com 2 bits para seleção e 1 bit para a entrada
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef DEMULTIPLEXER_2X1
`define DEMULTIPLEXER_2X1

`include "demux_1x1.v"

module demux_2x1 (input data, input [1:0] key, input enable, output out1, output out2, output out3, output out4);

    wire key_last_bit_negated; // most left bit
    
    not key_last_bit_negated_gate(key_last_bit_negated, key[1]);
    
    wire enable_demux1, enable_demux2;
    
    and enable_demux1_gate(enable_demux1, enable, key_last_bit_negated);
    and enable_demux2_gate(enable_demux2, enable, key[1]                          );
    
    demux_1x1 demux1(data, key[0], enable_demux1, out1, out2);
    demux_1x1 demux2(data, key[0], enable_demux2, out3, out4);

endmodule

`endif