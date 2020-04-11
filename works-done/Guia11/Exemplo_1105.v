// -------------------------
// Exemplo_1105 - 1-Reconhecedor_de_x111_Fsm_Model
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`include "clock.v"
`include "non_blocking_flip_flop_d.v"

module fsm_x111 (input data, input clock, output found);

    wire [3:0] flip_flops_data;
	wire [3:0] flip_flops_negated_data;
	
	non_blocking_flip_flop_d ff1(              data, clock, 1'b0, 1'b0, flip_flops_data[0], flip_flops_negated_data[0]);
	non_blocking_flip_flop_d ff2(flip_flops_data[0], clock, 1'b0, 1'b0, flip_flops_data[1], flip_flops_negated_data[1]);
	non_blocking_flip_flop_d ff3(flip_flops_data[1], clock, 1'b0, 1'b0, flip_flops_data[2], flip_flops_negated_data[2]);
	non_blocking_flip_flop_d ff4(flip_flops_data[2], clock, 1'b0, 1'b0, flip_flops_data[3], flip_flops_negated_data[3]);
	
	and and1(found, flip_flops_data[1], flip_flops_data[2], flip_flops_data[3]);

endmodule

module test;

    reg data;
	wire clk;
	wire found;
	
	clock clock1(clk);
	
	fsm_x111 fsm(data, clk, found);
	
	always @(posedge clk)
	begin
	    #2 $display("%b\t%b", data, found);
	end
	
	initial
	begin
	    $display("");
		$display("Exemplo_1105 - Axell Brendow - 631822");
		$display("");
	    $display("data\tfound");
		$display("");
		
		#10;
		data = 0; #24;
		data = 1; #24;
		data = 0; #24;
		data = 1; #24;
		data = 1; #24;
		data = 1; #24;
		data = 1; #24;
		data = 0; #24;
		data = 0; #24;
		data = 1; #24;
		data = 1; #24;
		data = 0; #24;
		data = 1; #24;
		data = 1; #24;
		data = 1; #24;
		data = 0; #24;
		data = 1; #24;
		data = 0; #24;
		
		$finish;
	end

endmodule