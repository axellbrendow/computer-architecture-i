// -------------------------
// Exemplo_1106 - 1-Reconhecedor_de_000_ou_111_Fsm_Model
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`include "clock.v"
`include "non_blocking_flip_flop_d.v"

module fsm_000_ou_111 (input data, input clock, output found);

    wire [2:0] flip_flops_data;
	wire [2:0] flip_flops_negated_data;
	wire found_000, found_111;
	
	non_blocking_flip_flop_d ff1(              data, clock, 1'b0, 1'b0, flip_flops_data[0], flip_flops_negated_data[0]);
	non_blocking_flip_flop_d ff2(flip_flops_data[0], clock, 1'b1, 1'b0, flip_flops_data[1], flip_flops_negated_data[1]);
	non_blocking_flip_flop_d ff3(flip_flops_data[1], clock, 1'b0, 1'b0, flip_flops_data[2], flip_flops_negated_data[2]);
	
	and and1(found_000, flip_flops_negated_data[0], flip_flops_negated_data[1], flip_flops_negated_data[2]);
	and and2(found_111,         flip_flops_data[0],         flip_flops_data[1],         flip_flops_data[2]);
	
	or or1(found, found_000, found_111);

endmodule

module test;

    reg data;
	wire clk;
	wire found;
	
	clock clock1(clk);
	
	fsm_000_ou_111 fsm(data, clk, found);
	
	always @(posedge clk)
	begin
	    #2 $display("%b\t%b", data, found);
	end
	
	initial
	begin
	    $display("");
		$display("Exemplo_1106 - Axell Brendow - 631822");
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
		data = 0; #24;
		data = 0; #24;
		data = 1; #24;
		data = 1; #24;
		data = 0; #24;
		data = 0; #24;
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