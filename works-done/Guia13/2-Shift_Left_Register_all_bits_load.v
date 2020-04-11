// -------------------------
// Registrador de deslocamento para esquerda com carregamento de todos os bits
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef SHIFT_LEFT_REGISTER_ALL_BITS_LOAD_V
`define SHIFT_LEFT_REGISTER_ALL_BITS_LOAD_V

`include "flip_flop_d_with_triggered_bit_load.v"

module shift_left_register_all_bits_load (clock, data, load, clear, bit0, bit1, bit2, bit3, bit4, a, b, c, d, e);

    input clock;
	input data;
	input load;
	input clear;
	input bit0;
	input bit1;
	input bit2;
	input bit3;
	input bit4;
	
	output a;
	output b;
	output c;
	output d;
	output e;
	
	wire a_negated;
    wire b_negated;
    wire c_negated;
    wire d_negated;
    wire e_negated;
	
	flip_flop_d_with_triggered_bit_load ff_d1(clock, data, load, bit0, 1'b0, clear, e, e_negated);
    flip_flop_d_with_triggered_bit_load ff_d2(clock, e   , load, bit1, 1'b0, clear, d, d_negated);
    flip_flop_d_with_triggered_bit_load ff_d3(clock, d   , load, bit2, 1'b0, clear, c, c_negated);
    flip_flop_d_with_triggered_bit_load ff_d4(clock, c   , load, bit3, 1'b0, clear, b, b_negated);
    flip_flop_d_with_triggered_bit_load ff_d5(clock, b   , load, bit4, 1'b0, clear, a, a_negated);

endmodule

`endif