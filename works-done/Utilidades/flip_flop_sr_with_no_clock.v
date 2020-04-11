// -------------------------
// Flip-Flop SR sem clock
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef FLIP_FLOP_SR_WITH_NO_CLOCK_V
`define FLIP_FLOP_SR_WITH_NO_CLOCK_V

module flip_flop_sr_with_no_clock (input set, input reset, input preset, input clear, output saved_data, output saved_data_negated);

    wire preset_negated, clear_negated;
	not not1(preset_negated, preset);
	not not2(clear_negated, clear);
	
	nand data_saver(saved_data, preset_negated, reset, saved_data_negated);
	nand negated_data_saver(saved_data_negated, clear_negated, set, saved_data);

endmodule

`endif