// -------------------------
// Somador Completo a + b + received_bit
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef SOMADOR_COMPLETO_8BITS_V
`define SOMADOR_COMPLETO_8BITS_V

`include "somador_completo_a_mais_b_mais_bit_recebido.v"

module somador_completo_8bits (input [7:0] a, input [7:0] b, input received_bit, output sent_bit, output [7:0] a_plus_b);

    wire fa1_sent_bit;
	wire fa2_sent_bit;
	wire fa3_sent_bit;
	wire fa4_sent_bit;
	wire fa5_sent_bit;
	wire fa6_sent_bit;
	wire fa7_sent_bit;
	
	somador_completo fa1(a[0], b[0], received_bit, fa1_sent_bit, a_plus_b[0]);
    somador_completo fa2(a[1], b[1], fa1_sent_bit, fa2_sent_bit, a_plus_b[1]);
    somador_completo fa3(a[2], b[2], fa2_sent_bit, fa3_sent_bit, a_plus_b[2]);
    somador_completo fa4(a[3], b[3], fa3_sent_bit, fa4_sent_bit, a_plus_b[3]);
    somador_completo fa5(a[4], b[4], fa4_sent_bit, fa5_sent_bit, a_plus_b[4]);
    somador_completo fa6(a[5], b[5], fa5_sent_bit, fa6_sent_bit, a_plus_b[5]);
    somador_completo fa7(a[6], b[6], fa6_sent_bit, fa7_sent_bit, a_plus_b[6]);
    somador_completo fa8(a[7], b[7], fa7_sent_bit, sent_bit    , a_plus_b[7]);

endmodule

`endif