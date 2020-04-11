// -------------------------
// Flip-Flop SR
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef FLIP_FLOP_SR_V
`define FLIP_FLOP_SR_V

`include "flip_flop_sr_with_no_clock.v"

module flip_flop_sr (input clock, input set, input reset, input preset, input clear, output saved_data, output saved_data_negated);

    wire set_value, reset_value;
	nand set_gate(set_value, clock, reset);
	nand reset_gate(reset_value, clock, set);
	
	flip_flop_sr_with_no_clock ff_sr_no_clock(set, reset, preset, clear, saved_data, saved_data_negated);

endmodule

`endif