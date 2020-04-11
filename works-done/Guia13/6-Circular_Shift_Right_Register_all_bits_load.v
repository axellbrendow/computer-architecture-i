// -------------------------
// Registrador de deslocamento circular para direita com carregamento de todos os bits
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef CIRCULAR_SHIFT_RIGHT_REGISTER_ALL_BITS_LOAD_V
`define CIRCULAR_SHIFT_RIGHT_REGISTER_ALL_BITS_LOAD_V

`include "flip_flop_d_with_triggered_bit_load.v"

module circular_shift_right_register_all_bits_load (clock, data, load, clear, bit4, bit3, bit2, bit1, bit0, out, a, b, c, d, e);

    input clock;
	input data;
	input load;
	input clear;
	input bit4;
	input bit3;
	input bit2;
	input bit1;
	input bit0;
	
	output out;
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
	wire last_bit_catched;
	
	or last_bit_catched_gate(last_bit_catched, e, data);
	
	flip_flop_d_with_triggered_bit_load ff_d1(clock, last_bit_catched, load, bit4, 1'b0, clear, a, a_negated);
    flip_flop_d_with_triggered_bit_load ff_d2(clock, a               , load, bit3, 1'b0, clear, b, b_negated);
    flip_flop_d_with_triggered_bit_load ff_d3(clock, b               , load, bit2, 1'b0, clear, c, c_negated);
    flip_flop_d_with_triggered_bit_load ff_d4(clock, c               , load, bit1, 1'b0, clear, d, d_negated);
    flip_flop_d_with_triggered_bit_load ff_d5(clock, d               , load, bit0, 1'b0, clear, e, e_negated);
	
	assign out = e;

endmodule

`endif