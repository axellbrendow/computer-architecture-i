// -------------------------
// Flip-Flop JK Mestre Escravo
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef FLIP_FLOP_JK_MASTER_SLAVE_V
`define FLIP_FLOP_JK_MASTER_SLAVE_V

`include "flip_flop_sr.v"

module flip_flop_jk_master_slave (input clock, input j, input k, input preset, input clear, output saved_data, output saved_data_negated);

    wire clock_negated;
	
	not clock_negated_gate(clock_negated, clock);
	
	wire set_value, reset_value;
	
	and set_gate(set_value, j, saved_data_negated); // se j = 1 e saved_data_negated = 1, que implica saved_data = 0, e' necessario fazer set = 1
	and reset_gate(reset_value, k, saved_data); // se k = 1 e saved_data = 1, e' necessario fazer reset = 1
	
	wire ff1_data, ff1_data_negated;
	
	flip_flop_sr ff_sr1(        clock, set_value,      reset_value, preset, clear,   ff1_data,   ff1_data_negated);
	flip_flop_sr ff_sr2(clock_negated,  ff1_data, ff1_data_negated, preset, clear, saved_data, saved_data_negated);

endmodule

`endif