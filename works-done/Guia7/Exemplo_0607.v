// -------------------------
// Exemplo_0607 - 7-GREATER_e_SMALLER_1_Resposta_Selecionavel
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module mux2inputs(input [1:0] inputArray, input key, output selectedInput);

    assign selectedInput = inputArray[key];

endmodule

// if key = 0, operation is number1 == number2
// if key = 1, operation is number1 != number2
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

// if key = 0, operation is number1 > number2
// if key = 1, operation is number1 < number2
module greater_or_smaller_checker(input [1:0] number1, input [1:0] number2, input key, output greater_or_smaller_result);

    wire not_digit0_of_number2, not_digit1_of_number2;
	
	not not02(not_digit0_of_number2, number2[0]);
	not not12(not_digit1_of_number2, number2[1]);
	
	wire and1_result, and2_result, and3_result;
	
	and and1(and1_result, number1[0], not_digit1_of_number2, not_digit0_of_number2);
	and and2(and2_result, number1[1], number1[0], not_digit0_of_number2);
	and and3(and3_result, number1[1], not_digit1_of_number2);
	
	wire number1_greater_than_number2_result, number1_not_greater_than_number2_result;
	// esta porta or fornece o valor logico de number1 > number2
	or number1_greater_than_number2(number1_greater_than_number2_result, and1_result, and2_result, and3_result);
	not number1_not_greater_than_number2(number1_not_greater_than_number2_result, number1_greater_than_number2_result);
	
	wire number1_not_equals_number2_result;
	// checa se os dois numeros sao diferentes
	equals_or_not_equals_checker number1_not_equals_number2(number1, number2, 1'b1, number1_not_equals_number2_result);
	
	wire number1_smaller_than_number2_result;
	// number1 so' e' menor que number2 se number1 nao' e' maior nem igual a number2
	and number1_smaller_than_number2(number1_smaller_than_number2_result, number1_not_greater_than_number2_result, number1_not_equals_number2_result);
	
	mux2inputs result_selector( { number1_smaller_than_number2_result, number1_greater_than_number2_result }, key, greater_or_smaller_result );

endmodule

module Exemplo_0607;

	// ------------------------- data definition
	reg [1:0] number1;
	reg [1:0] number2;
	reg key;
	wire greater_or_smaller_result;
	
	greater_or_smaller_checker greater_or_smaller_checker1(number1, number2, key, greater_or_smaller_result);
	
	// ------------------------- main part
	initial
	begin : main
		$display("");
		$display("Exemplo_0607 - Axell Brendow - 631822");
		$display("");
		$display("key = 0  -->  greater than is used");
		$display("key = 1  -->  smaller than is used");
		$display("");
		
		// projecting module tests
		$monitor("(%2b, %2b) = %b", number1, number2, greater_or_smaller_result);
		
		$display("\nfor key = 0\n");
		   number1 = 2'b00; number2 = 2'b00; key = 0;
		#1                  number2 = 2'b01;
		#1                  number2 = 2'b10;
		#1                  number2 = 2'b11;
		
		#1 $display("");
		   number1 = 2'b01; number2 = 2'b00; key = 0;
		#1                  number2 = 2'b01;
		#1                  number2 = 2'b10;
		#1                  number2 = 2'b11;
		
		#1 $display("");
		   number1 = 2'b10; number2 = 2'b00; key = 0;
		#1                  number2 = 2'b01;
		#1                  number2 = 2'b10;
		#1                  number2 = 2'b11;
		
		#1 $display("");
		   number1 = 2'b11; number2 = 2'b00; key = 0;
		#1                  number2 = 2'b01;
		#1                  number2 = 2'b10;
		#1                  number2 = 2'b11;
		
		#1 $display("\n-----------------------\n");
		$display("\nfor key = 1\n");
		   number1 = 2'b00; number2 = 2'b00; key = 1;
		#1                  number2 = 2'b01;
		#1                  number2 = 2'b10;
		#1                  number2 = 2'b11;
		
		#1 $display("");
		   number1 = 2'b01; number2 = 2'b00; key = 1;
		#1                  number2 = 2'b01;
		#1                  number2 = 2'b10;
		#1                  number2 = 2'b11;
		
		#1 $display("");
		   number1 = 2'b10; number2 = 2'b00; key = 1;
		#1                  number2 = 2'b01;
		#1                  number2 = 2'b10;
		#1                  number2 = 2'b11;
		
		#1 $display("");
		   number1 = 2'b11; number2 = 2'b00; key = 1;
		#1                  number2 = 2'b01;
		#1                  number2 = 2'b10;
		#1                  number2 = 2'b11;
	end
	
endmodule