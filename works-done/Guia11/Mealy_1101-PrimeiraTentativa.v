// -------------------------
// Mealy_1101 - 1-Reconhecedor_de_1101_Mealy_Model
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`include "clock.v"
`include "flip_flop_d.v"

module mealy_1101 (input data, input clock, output found);

    wire [3:0] flip_flops_data;
    wire [3:0] flip_flops_negated_data;
	
	flip_flop_d ff1(              data, clock, flip_flops_data[0], flip_flops_negated_data[0]);
	flip_flop_d ff2(flip_flops_data[0], clock, flip_flops_data[1], flip_flops_negated_data[1]);
	flip_flop_d ff3(flip_flops_data[1], clock, flip_flops_data[2], flip_flops_negated_data[2]);
	flip_flop_d ff4(flip_flops_data[2], clock, flip_flops_data[3], flip_flops_negated_data[3]);
	
	and and1(found, flip_flops_data[0], flip_flops_negated_data[1], flip_flops_data[2], flip_flops_data[3]);
	
endmodule

module test;

    wire clk;
	wire found;
	reg data;
	
	clock clock1(clk);
	
	mealy_1101 m_1101(data, clk, found);
	
	always @(posedge clk)
	begin
	    $display("%b\t%b", data, found);
	end
	
	initial
	begin
	    $display("");
		$display("Mealy_1101 - Axell Brendow - 631822");
		$display("");
	    $display("data\tfound");
		$display("");
		
		#10;
		data = 0; #24;
		data = 1; #24;
		data = 0; #24;
		data = 1; #24;
		data = 1; #24;
		data = 0; #24;
		data = 0; #24;
		data = 1; #24;
		data = 1; #24;
		data = 0; #24;
		data = 1; #24;
		data = 1; #24;
		data = 0; #24;
		data = 1; #24;
		data = 0; #24;
		
		$finish;
	end

endmodule