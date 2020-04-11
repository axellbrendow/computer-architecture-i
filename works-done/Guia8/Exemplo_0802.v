// -------------------------
// Exemplo_0802 - 2-Subtrador_completo_4bits
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module half_subtracter ( input a, input b, output borrowed_bit, output bit0 );

	and(borrowed_bit, ~a, b);
	xor(bit0, a, b);
	
endmodule

module full_subtracter ( input a, input b, input lent, output borrowed_bit, output bit0 );

    wire borrowed_bit1, borrowed_bit2, first_subtraction;
    
    half_subtracter ha1 (a, b, borrowed_bit1, first_subtraction);
    half_subtracter ha2 (first_subtraction, lent, borrowed_bit2, bit0);
    or or1 (borrowed_bit, borrowed_bit1, borrowed_bit2);

endmodule

module full_subtracter_4bits ( input [3:0] a, input [3:0] b, input lent, output borrowed_bit, output [3:0] a_minus_b );

    wire borrowed_bit1, borrowed_bit2, borrowed_bit3;
	
	full_subtracter fa1 (a[0], b[0], lent, borrowed_bit1, a_minus_b[0]);
	full_subtracter fa2 (a[1], b[1], borrowed_bit1, borrowed_bit2, a_minus_b[1]);
	full_subtracter fa3 (a[2], b[2], borrowed_bit2, borrowed_bit3, a_minus_b[2]);
	full_subtracter fa4 (a[3], b[3], borrowed_bit3, borrowed_bit, a_minus_b[3]);

endmodule

module Exemplo_0802;

	// ------------------------- definicao de dados
	reg [3:0] a;
	reg [3:0] b;
	wire borrowed_bit;
	wire [3:0] a_minus_b;
	
	full_subtracter_4bits fs4(a, b, 1'b0, borrowed_bit, a_minus_b);
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0802 - Axell Brendow - 631822");
		$display("");
		
		for (a = 4'b0000; a < 4'b1111; a = a + 1)
		begin
		    
			for (b = 4'b0000; b < 4'b1111; b = b + 1)
			begin
				#1 $display("%4b - %4b = %4b and borrowed_bit = %b", a, b, a_minus_b, borrowed_bit);
			end
			
			#1 $display("%4b - %4b = %4b and borrowed_bit = %b\n", a, b, a_minus_b, borrowed_bit);
		end
		
		for (b = 4'b0000; b < 4'b1111; b = b + 1)
		begin
			#1 $display("%4b - %4b = %4b and borrowed_bit = %b", a, b, a_minus_b, borrowed_bit);
		end
		
		#1 $display("%4b - %4b = %4b and borrowed_bit = %b\n", a, b, a_minus_b, borrowed_bit);

	end
	
endmodule