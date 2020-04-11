// -------------------------
// Exemplo_0805 - 5-ComplementoDe2_4bits
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module complement_of_1_to_4bits(input [3:0] number, output [3:0] complement_of_1_of_number);
    
	wire not_bit0_of_number, not_bit1_of_number, not_bit2_of_number, not_bit3_of_number;
	
	not not1(not_bit0_of_number, number[0]);
	not not1(not_bit1_of_number, number[1]);
	not not1(not_bit2_of_number, number[2]);
	not not1(not_bit3_of_number, number[3]);
	
	assign complement_of_1_of_number = { not_bit3_of_number, not_bit2_of_number, not_bit1_of_number, not_bit0_of_number };
	
endmodule

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

module complement_of_2_to_4bits(input [3:0] number, output [3:0] minus_number);
    
	wire [3:0] complement_of_1_of_number;
	wire sent_bit;
	
	complement_of_1_to_4bits c1_of_number(number, complement_of_1_of_number);
	full_adder_4bits fa4(complement_of_1_of_number, 4'b0001, 1'b0, sent_bit, minus_number);
	
endmodule

module Exemplo_0805;

	// ------------------------- definicao de dados
	reg [3:0] number;
	wire [3:0] c2_of_number;
	
	complement_of_2_to_4bits complement_of_2_of_number(number, c2_of_number);
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0805 - Axell Brendow - 631822");
		$display("");
		
		for (number = 4'b0000; number < 4'b1111; number = number + 1)
		begin
		    #1 $display("c2(%4b) = %4b", number, c2_of_number);
		end
		
		#1 $display("c2(%4b) = %4b\n", number, c2_of_number);
	end
	
endmodule