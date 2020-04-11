// -------------------------
// Flip-Flop D
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef FLIP_FLOP_D_V
`define FLIP_FLOP_D_V

`include "flip_flop_sr.v"

module flip_flop_d (input clock, input data, input preset, input clear, output saved_data, output saved_data_negated);

    wire data_negated;
	not data_negated_gate(data_negated, data);
	
	flip_flop_sr ff_sr(clock, data, data_negated, preset, clear, saved_data, saved_data_negated);

endmodule

`endif