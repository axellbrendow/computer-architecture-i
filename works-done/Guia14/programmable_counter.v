// -------------------------
// Contador Programavel
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef PROGRAMMABLE_COUNTER_V
`define PROGRAMMABLE_COUNTER_V

`include "RAM_1x8.v"
`include "flip_flop_jk_with_triggered_bit_load.v"
`include "somador_algebrico_8bits.v"
`include "flip_flop_d.v"
`include "mux_1x8.v"

// USAGE: clear, input lower_limit, input upper_limit, load (2x), clock

module programmable_counter (input clock, input clear, input load, input [7:0] lower_limit, input [7:0] upper_limit, input crescent_decrescent, output [7:0] current_value);

    wire clock_negated;
	wire reached_upper_limit_and_posedge_clock;
	wire didnt_reach_upper_limit_or_negedge_clock;
	wire reload;
	wire load_or_reload;
	wire [7:0] lower_limit_saved;
	wire [7:0] upper_limit_saved;
	wire [7:0] current_crescent_value;
	wire [7:0] current_crescent_value_negated;
	wire [7:0] upper_limit_minus_current_crescent_value;
	wire current_crescent_value_greater_than_upper_limit_saved;
	wire current_crescent_value_equals_to_upper_limit_saved;
	wire [7:0] lower_limit_plus_upper_limit_minus_current_crescent_value;
	wire no_sense1;
	wire no_sense2;
	
	not clock_negated_gate(clock_negated, clock);
	and reload_gate(reload, clock_negated, reached_upper_limit_and_posedge_clock);
	or load_or_reload_gate(load_or_reload, load, reload);
	
	ram_1x8 lower_limit_ram(1'b1, load_or_reload, 1'b1, lower_limit, clear, lower_limit_saved);
	ram_1x8 upper_limit_ram(1'b1, load_or_reload, 1'b1, upper_limit, clear, upper_limit_saved);
	
	flip_flop_jk_with_triggered_bit_load ff_jk1
	(clock                    , 1'b1, 1'b1, load_or_reload, lower_limit_saved[0], 1'b0, clear, current_crescent_value[0], current_crescent_value_negated[0]);
	
	flip_flop_jk_with_triggered_bit_load ff_jk2
	(current_crescent_value[0], 1'b1, 1'b1, load_or_reload, lower_limit_saved[1], 1'b0, clear, current_crescent_value[1], current_crescent_value_negated[1]);
	
	flip_flop_jk_with_triggered_bit_load ff_jk3
	(current_crescent_value[1], 1'b1, 1'b1, load_or_reload, lower_limit_saved[2], 1'b0, clear, current_crescent_value[2], current_crescent_value_negated[2]);
	
	flip_flop_jk_with_triggered_bit_load ff_jk4
	(current_crescent_value[2], 1'b1, 1'b1, load_or_reload, lower_limit_saved[3], 1'b0, clear, current_crescent_value[3], current_crescent_value_negated[3]);
	
	flip_flop_jk_with_triggered_bit_load ff_jk5
	(current_crescent_value[3], 1'b1, 1'b1, load_or_reload, lower_limit_saved[4], 1'b0, clear, current_crescent_value[4], current_crescent_value_negated[4]);
	
	flip_flop_jk_with_triggered_bit_load ff_jk6
	(current_crescent_value[4], 1'b1, 1'b1, load_or_reload, lower_limit_saved[5], 1'b0, clear, current_crescent_value[5], current_crescent_value_negated[5]);
	
	flip_flop_jk_with_triggered_bit_load ff_jk7
	(current_crescent_value[5], 1'b1, 1'b1, load_or_reload, lower_limit_saved[6], 1'b0, clear, current_crescent_value[6], current_crescent_value_negated[6]);
	
	flip_flop_jk_with_triggered_bit_load ff_jk8
	(current_crescent_value[6], 1'b1, 1'b1, load_or_reload, lower_limit_saved[7], 1'b0, clear, current_crescent_value[7], current_crescent_value_negated[7]);
	
	somador_algebrico_8bits fa_8bits_1
	(
	    upper_limit_saved, current_crescent_value, 1'b1, upper_limit_minus_current_crescent_value,
	    current_crescent_value_greater_than_upper_limit_saved, current_crescent_value_equals_to_upper_limit_saved
	);
	
	flip_flop_d ff_d(clock, current_crescent_value_equals_to_upper_limit_saved, 1'b0, 1'b0, reached_upper_limit_and_posedge_clock, didnt_reach_upper_limit_or_negedge_clock);
	
	somador_algebrico_8bits fa_8bits_2
	(
	    lower_limit_saved, upper_limit_minus_current_crescent_value, 1'b0, lower_limit_plus_upper_limit_minus_current_crescent_value, no_sense1, no_sense2
	);
	
	mux_1x8 mux1(current_crescent_value, lower_limit_plus_upper_limit_minus_current_crescent_value, crescent_decrescent, current_value);

endmodule

`endif