// -------------------------
// Somador Algebrico
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef SOMADOR_ALGEBRICO_8BITS_V
`define SOMADOR_ALGEBRICO_8BITS_V

`include "mux_1x8.v"
`include "somador_completo_8bits.v"

module somador_algebrico_8bits (input [7:0] a, input [7:0] b, input sum_subtract, output [7:0] a_plus_b_or_a_minus_b, output b_greater_than_a, output a_equals_b);

    wire [7:0] b_negated;
	wire [7:0] new_b;
	wire b_less_than_or_equals_to_a;
	
	not b0_negated_gate(b_negated[0], b[0]);
    not b1_negated_gate(b_negated[1], b[1]);
    not b2_negated_gate(b_negated[2], b[2]);
    not b3_negated_gate(b_negated[3], b[3]);
    not b4_negated_gate(b_negated[4], b[4]);
    not b5_negated_gate(b_negated[5], b[5]);
    not b6_negated_gate(b_negated[6], b[6]);
    not b7_negated_gate(b_negated[7], b[7]);
	
	mux_1x8 mux1(b, b_negated, sum_subtract, new_b );
	
	somador_completo_8bits fa_8bits(a, new_b, sum_subtract, b_less_than_or_equals_to_a, a_plus_b_or_a_minus_b);
	
	not b_greater_than_a_gate(b_greater_than_a, b_less_than_or_equals_to_a);
	
	nor a_equals_b_gate(a_equals_b, 
	a_plus_b_or_a_minus_b[0],
	a_plus_b_or_a_minus_b[1],
	a_plus_b_or_a_minus_b[2],
	a_plus_b_or_a_minus_b[3],
	a_plus_b_or_a_minus_b[4],
	a_plus_b_or_a_minus_b[5],
	a_plus_b_or_a_minus_b[6],
	a_plus_b_or_a_minus_b[7]);

endmodule

`endif