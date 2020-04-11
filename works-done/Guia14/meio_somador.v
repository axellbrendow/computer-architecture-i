// -------------------------
// Meio Somador
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef MEIO_SOMADOR_V
`define MEIO_SOMADOR_V

module meio_somador (input a, input b, output sent_bit, output bit0);

    and sent_bit_gate(sent_bit, a, b);
	xor bit0_gate(bit0, a, b);

endmodule

`endif