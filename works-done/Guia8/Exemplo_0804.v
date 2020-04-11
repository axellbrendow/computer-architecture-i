// -------------------------
// Exemplo_0804 - 4-NOT_EQUALS_4bits
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module mux2inputs(input [1:0] inputArray, input key, output selectedInput);

    assign selectedInput = inputArray[key];

endmodule

// if key = 0, operation is number1 EQUALS number2
// if key = 1, operation is number1 NOT_EQUALS number2
module equals_or_not_equals_checker(input [1:0] number1, input [1:0] number2, input key, output equals_or_not_equals_result);

    wire not_digit0_of_number1, not_digit1_of_number1;
    wire not_digit0_of_number2, not_digit1_of_number2;
	
	not not11(not_digit0_of_number1, number1[0]);
	not not21(not_digit1_of_number1, number1[1]);
	not not12(not_digit0_of_number2, number2[0]);
	not not22(not_digit1_of_number2, number2[1]);
	
	wire and1_result, and2_result, and3_result, and4_result;
	
	and and1(and1_result, not_digit0_of_number1, not_digit1_of_number1, not_digit0_of_number2, not_digit1_of_number2);
	and and2(and2_result, not_digit0_of_number1, number1[1], not_digit0_of_number2, number2[1]);
	and and3(and3_result, number1[0], number1[1], number2[0], number2[1]);
	and and4(and4_result, number1[0], not_digit1_of_number1, number2[0], not_digit1_of_number2);
	
	wire equals_result, not_equals_result;
	// esta porta or fornece o valor logico da igualdade entre os numeros
	or equals(equals_result, and1_result, and2_result, and3_result, and4_result);
	not not_equals(not_equals_result, equals_result);
	
	mux2inputs mux2( { not_equals_result, equals_result }, key, equals_or_not_equals_result );

endmodule

module not_equals_checker_4bits(input [3:0] number1, input [3:0] number2, output number1_not_equals_number2);
    
	wire first_two_bits_not_equal, last_two_bits_not_equal;
	
	equals_or_not_equals_checker not_eq_checker1(number1[1:0], number2[1:0], 1'b1, first_two_bits_not_equal);
	equals_or_not_equals_checker not_eq_checker2(number1[3:2], number2[3:2], 1'b1, last_two_bits_not_equal);
	
	or n1_not_equals_n2(number1_not_equals_number2, first_two_bits_not_equal, last_two_bits_not_equal);
	
endmodule

module Exemplo_0804;

	// ------------------------- definicao de dados
	reg [3:0] number1;
	reg [3:0] number2;
	wire number1_not_equals_number2;
	
	not_equals_checker_4bits not_eqc4(number1, number2, number1_not_equals_number2);
	
	// ------------------------- parte principal
	initial
	begin : main
		$display("");
		$display("Exemplo_0804 - Axell Brendow - 631822");
		$display("");
		
		for (number1 = 4'b0000; number1 < 4'b1111; number1 = number1 + 1)
		begin
		    
			for (number2 = 4'b0000; number2 < 4'b1111; number2 = number2 + 1)
			begin
				#1 $display("%4b == %4b = %b", number1, number2, number1_not_equals_number2);
			end
			
			#1 $display("%4b == %4b = %b\n", number1, number2, number1_not_equals_number2);
		end
		
		for (number2 = 4'b0000; number2 < 4'b1111; number2 = number2 + 1)
		begin
			#1 $display("%4b == %4b = %b", number1, number2, number1_not_equals_number2);
		end
		
		#1 $display("%4b == %4b = %b\n", number1, number2, number1_not_equals_number2);
	end
	
endmodule