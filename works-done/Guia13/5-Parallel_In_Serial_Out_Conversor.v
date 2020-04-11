// -------------------------
// Conversor paralelo-serie
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef PARALLEL_IN_SERIAL_OUT_CONVERSOR_V
`define PARALLEL_IN_SERIAL_OUT_CONVERSOR_V

`include "flip_flop_d_with_triggered_bit_load.v"

module parallel_in_serial_out_conversor (clock, load, clear, bit4, bit3, bit2, bit1, bit0, out, a, b, c, d, e);

    input clock;
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
	
	flip_flop_d_with_triggered_bit_load ff_d1(clock, 1'b0, load, bit4, 1'b0, clear, a, a_negated);
    flip_flop_d_with_triggered_bit_load ff_d2(clock, a   , load, bit3, 1'b0, clear, b, b_negated);
    flip_flop_d_with_triggered_bit_load ff_d3(clock, b   , load, bit2, 1'b0, clear, c, c_negated);
    flip_flop_d_with_triggered_bit_load ff_d4(clock, c   , load, bit1, 1'b0, clear, d, d_negated);
    flip_flop_d_with_triggered_bit_load ff_d5(clock, d   , load, bit0, 1'b0, clear, e, e_negated);
	
	assign out = e;

endmodule

`endif