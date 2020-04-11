// -------------------------
// Exemplo_0807 - 7-Equals_e_not_equals_com_somador_algebrico_4bits
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module mux2inputs(input [1:0] inputArray, input key, output selectedInput);

    assign selectedInput = inputArray[key];

endmodule

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

module mux2inputs_of_4bits(input [7:0] inputArray, input key, output [3:0] selectedInput);
	
    assign selectedInput = key == 0 ? inputArray[3:0] : inputArray[7:4];

endmodule

module algebric_adder (input [3:0] num1, input [3:0] num2, input add_sub, output [3:0] result);
    
	wire [3:0] complement_of_1_of_num2;
	
	complement_of_1_to_4bits complement_of_1 (num2, complement_of_1_of_num2);
	
	wire [3:0] num2_or_complement_of_num2;
	
	mux2inputs_of_4bits mux2_4bits ({ complement_of_1_of_num2, num2 }, add_sub, num2_or_complement_of_num2);
	
	wire sent_bit;
	
	full_adder_4bits fa4 (num1, num2_or_complement_of_num2, add_sub, sent_bit, result);
	
endmodule

// operation_key = 0  -->  num1 == num2
// operation_key = 1  -->  num1 != num2
module lu_with_equal_and_not_equal(input [3:0] num1, input [3:0] num2, input operation_key, output result);

	wire [3:0] result1;
	
	algebric_adder aa1 (num1, num2, 1'b1, result1);
	
	wire equals, not_equals;
	
	nor equals_gate(equals, result1[0], result1[1], result1[2], result1[3]);
	not not_equals_gate(not_equals, equals);
	
	mux2inputs mux2 ({not_equals, equals}, operation_key, result);
	
endmodule

module Exemplo_0807;

	// ------------------------- definicao de dados
	reg [3:0] num1;
	reg [3:0] num2;
	reg operation_key;
	wire result;
	
	lu_with_equal_and_not_equal lu(num1, num2, operation_key, result);
	
	// ------------------------- parte principal
	
	// executa esse bloco paralelamente com os outros blocos initial e always
	initial
	begin
		#900 $finish; // apos aguardar 900 unidades de tempo finaliza o programa
	end
	
	always @(operation_key) // executa sempre que o registro operation_key mudar
	begin
		#1 $display("for operation_key = %b\n", operation_key);
		
		for (num1 = 4'b0000; num1 < 4'b1111; num1 = num1 + 1)
		begin
			
			for (num2 = 4'b0000; num2 < 4'b1111; num2 = num2 + 1)
			begin
				#1 $display("(%4b, %4b) = %b", num1, num2, result);
			end
			
			#1 $display("(%4b, %4b) = %b\n", num1, num2, result);
		end
		
		for (num2 = 4'b0000; num2 < 4'b1111; num2 = num2 + 1)
		begin
			#1 $display("(%4b, %4b) = %b", num1, num2, result);
		end
		
		#1 $display("(%4b, %4b) = %b\n", num1, num2, result);
		
		#1 $display("------------------------------\n");
	end
	
	initial
	begin : main
		$display("");
		$display("Exemplo_0807 - Axell Brendow - 631822");
		$display("");
		$display("operation_key = 0  -->  num1 == num2");
		$display("operation_key = 1  -->  num1 != num2");
		$display(""); #1;
		
		operation_key = 1'b0; #300
		operation_key = 1'b1; #300;
	end
	
endmodule