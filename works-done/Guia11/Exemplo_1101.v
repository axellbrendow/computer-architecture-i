// -------------------------
// Exemplo_1101 - 1-Reconhecedor_de_1101_Mealy_And_Moore_Model
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`include "Mealy_1101.v"
`include "Moore_1101.v"

module test;

    reg data;
	wire clk;
	wire found_by_mealy, found_by_moore;
	
	clock clock1(clk);
	
	mealy_1101 me_1101(data, clk, found_by_mealy);
    moore_1101 mo_1101(data, clk, found_by_moore);
	
	always @(posedge clk)
	begin
	    #2 $display("%b\t%b\t%b\t%4d", data, found_by_mealy, found_by_moore, $time);
	end
	
	initial
	begin
	    $display("");
		$display("Exemplo_1101 - Axell Brendow - 631822");
		$display("");
	    $display("data\tmealy\tmoore\ttime");
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