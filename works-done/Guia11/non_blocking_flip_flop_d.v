// -------------------------
// Non Blocking Flip-Flop D
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef NON_BLOCKING_FLIP_FLOP_D_V
`define NON_BLOCKING_FLIP_FLOP_D_V

// Enfim encontrei uma forma de usar flip-flops no verilog.
// Este flip-flop abaixo pode ser conectado com outros
// flip-flops do mesmo tipo sem problemas de propagacao
// de dados.

module non_blocking_flip_flop_d (input data, input clock, input preset, input reset, output last_saved_data, output last_saved_data_negated);

    reg last_saved_data, last_saved_data_negated;
    
	initial
	begin
		last_saved_data <= preset;
		last_saved_data_negated <= ~preset;
	end
	
    always @(posedge clock or posedge reset)
    begin
	    if (reset)
		begin
			last_saved_data <= preset;
			last_saved_data_negated <= ~preset;
		end
		
		else
		begin
			last_saved_data <= data;
			last_saved_data_negated <= ~data;
		end
    end

endmodule

`endif