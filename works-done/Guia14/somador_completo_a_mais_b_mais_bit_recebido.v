// -------------------------
// Somador Completo a + b + received_bit
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef SOMADOR_COMPLETO_V
`define SOMADOR_COMPLETO_V

`include "meio_somador.v"

module somador_completo (input a, input b, input received_bit, output sent_bit, output bit0);

    wire ha1_sent_bit;
	wire ha2_sent_bit;
	wire ha3_sent_bit;
	wire bit0_of_a_plus_b;
	
	meio_somador ha1(a           , b               , ha1_sent_bit, bit0_of_a_plus_b);
    meio_somador ha2(received_bit, bit0_of_a_plus_b, ha2_sent_bit, bit0            );
    meio_somador ha3(ha1_sent_bit, ha2_sent_bit    , ha3_sent_bit, sent_bit        );

endmodule

`endif