// -------------------------
// Flip-Flop D com carregamento de bit acionavel
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef FLIP_FLOP_D_WITH_TRIGGERED_BIT_LOAD_V
`define FLIP_FLOP_D_WITH_TRIGGERED_BIT_LOAD_V

`include "flip_flop_jk_master_slave.v"

module flip_flop_d_with_triggered_bit_load (input clock, input data, input load, input bit_to_load, input preset, input clear, output saved_data, output saved_data_negated);

    wire data_negated;
	wire bit_to_load_negated;
	wire load_1;
	wire load_0;
	wire active_preset;
	wire active_clear;
	
	not data_negated_gate(data_negated, data);
	not bit_to_load_negated_gate(bit_to_load_negated, bit_to_load);
	and load_1_gate(load_1, load, bit_to_load);
	and load_0_gate(load_0, load, bit_to_load_negated);
	or active_preset_gate(active_preset, load_1);
	or active_clear_gate(active_clear, load_0);
	
	flip_flop_jk_master_slave ff_jk_ms(clock, data, data_negated, active_preset, active_clear, saved_data, saved_data_negated);

endmodule

`endif