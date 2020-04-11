// -------------------------
// Exemplo_0801 - 1-Somador_completo_4bits
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module half_adder ( input a, input b, output sent_bit, output bit0 );

	and(sent_bit, a, b);
	xor(bit0, a, b);
	
endmodule

module full_adder ( input a, input b, input received, output sent_bit, output bit0 );

    wire sent_bit1, sent_bit2, sent_bit3, first_sum;
    
    half_adder ha1 (a, b, sent_bit1, first_sum);
    half_adder ha2 (first_sum, received, sent_bit2, bit0);
    half_adder ha3 (sent_bit1, sent_bit2, sent_bit3, sent_bit);

endmodule

module full_adder_4bits ( input [3:0] a, input [3:0] b, input received, output sent_bit, output [3:0] a_plus_b );

    wire sent_bit1, sent_bit2, sent_bit3;
	
	full_adder fa1 (a[0], b[0], received, sent_bit1, a_plus_b[0]);
	full_adder fa2 (a[1], b[1], sent_bit1, sent_bit2, a_plus_b[1]);
	full_adder fa3 (a[2], b[2], sent_bit2, sent_bit3, a_plus_b[2]);
	full_adder fa4 (a[3], b[3], sent_bit3, sent_bit, a_plus_b[3]);

endmodule

module Exemplo_0801;

	// ------------------------- definicao de dados
	reg [3:0] a;
	reg [3:0] b;
	wire sent_bit;
	wire [3:0] a_plus_b;
	
	full_adder_4bits fa4(a, b, 1'b0, sent_bit, a_plus_b);
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0801 - Axell Brendow - 631822");
		$display("");
		
		for (a = 4'b0000; a < 4'b1111; a = a + 1)
		begin
		    
			for (b = 4'b0000; b < 4'b1111; b = b + 1)
			begin
				#1 $display("%4b + %4b = %4b and sent_bit = %b", a, b, a_plus_b, sent_bit);
			end
			
			#1 $display("%4b + %4b = %4b and sent_bit = %b\n", a, b, a_plus_b, sent_bit);
		end
		
		for (b = 4'b0000; b < 4'b1111; b = b + 1)
		begin
			#1 $display("%4b + %4b = %4b and sent_bit = %b", a, b, a_plus_b, sent_bit);
		end
		
		#1 $display("%4b + %4b = %4b and sent_bit = %b\n", a, b, a_plus_b, sent_bit);

	end
	
endmodule