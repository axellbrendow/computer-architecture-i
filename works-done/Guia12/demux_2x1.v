// -------------------------
// Demultiplexador com 2 bit para seleção e 1 bit para a entrada
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef DEMULTIPLEXER_2X1
`define DEMULTIPLEXER_2X1

module demux_2x1 (input data, input [1:0] key, output out1, output out2, output out3, output out4);

    wire [1:0] key_negated;
	
	not key_negated_gate(key_negated[0], key[0]);
	not key_negated_gate(key_negated[1], key[1]);
	
	and and1(out1, key_negated[1], key_negated[0], data);
	and and2(out2, key_negated[1], key[0]        , data);
	and and3(out3, key[1]        , key_negated[0], data);
	and and4(out4, key[1]        , key[0]        , data);
	
	/*
	wire out_1_2, out_3_4;
	
	demux_1x1 demux1(1'b1, key[1], out_1_2, out_3_4);
	
	wire out_1_3, out_2_4;
	
	demux_1x1 demux2(1'b1, key[0], out_1_3, out_2_4);
	*/

endmodule

`endif