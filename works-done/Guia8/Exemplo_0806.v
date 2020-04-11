// -------------------------
// Exemplo_0806 - 6-Addition_subtraction_equals_e_not_equals_com_somador_algebrico_4bits
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

module bit_expander_4bits(input bit_to_expand, output [3:0] extended_bit);

    assign extended_bit = { 4{bit_to_expand} };
    
endmodule

module mux8inputs(input [31:0] inputArray, input [2:0] key, output [3:0] selectedInput);
    
	reg [3:0] selectedInput;
	
	always @(inputArray or key)
	begin
	
		case (key)
		    3'b000 : selectedInput = inputArray[3:0];
		    3'b001 : selectedInput = inputArray[7:4];
		    3'b010 : selectedInput = inputArray[11:8];
		    3'b011 : selectedInput = inputArray[15:12];
		    3'b100 : selectedInput = inputArray[19:16];
		    3'b101 : selectedInput = inputArray[23:20];
		    3'b110 : selectedInput = inputArray[27:24];
		    3'b111 : selectedInput = inputArray[31:28];
		endcase
		
	end

endmodule

// operation_key = 000  -->  num1 + num2
// operation_key = 100  -->  num1 - num2
// operation_key = 101  -->  num1 == num2
// operation_key = 110  -->  num1 != num2
module au_with_add_and_sub_and_lu_with_equal_and_not_equal(input [3:0] num1, input [3:0] num2, input [2:0] operation_key, output [3:0] result);

	wire [3:0] result1;
	
	algebric_adder aa1 (num1, num2, operation_key[2], result1);
	
	wire equals, not_equals;
	
	nor equals_gate(equals, result1[0], result1[1], result1[2], result1[3]);
	not not_equals_gate(not_equals, equals);
	
	wire [3:0] equals_extended;
	wire [3:0] not_equals_extended;
	
	bit_expander_4bits be1(equals, equals_extended);
	bit_expander_4bits be2(not_equals, not_equals_extended);
	
	mux8inputs mux8 ({4'b0000, not_equals_extended, equals_extended, result1, 4'b0000, 4'b0000, 4'b0000, result1}, operation_key, result);
	
endmodule

module Exemplo_0806;

	// ------------------------- definicao de dados
	reg [3:0] num1;
	reg [3:0] num2;
	reg [2:0] operation_key;
	wire [3:0] result;
	
	au_with_add_and_sub_and_lu_with_equal_and_not_equal au_and_lu(num1, num2, operation_key, result);
	
	// ------------------------- parte principal
	
	// executa esse bloco paralelamente com os outros blocos initial e always
	initial
	begin
		#1500 $finish; // apos aguardar 1500 unidades de tempo finaliza o programa
	end
	
	always @(operation_key) // executa sempre que o registro operation_key mudar
	begin
		#1 $display("for operation_key = %3b\n", operation_key);
		
		for (num1 = 4'b0000; num1 < 4'b1111; num1 = num1 + 1)
		begin
			
			for (num2 = 4'b0000; num2 < 4'b1111; num2 = num2 + 1)
			begin
				#1 $display("(%4b, %4b) = %4b", num1, num2, result);
			end
			
			#1 $display("(%4b, %4b) = %4b\n", num1, num2, result);
		end
		
		for (num2 = 4'b0000; num2 < 4'b1111; num2 = num2 + 1)
		begin
			#1 $display("(%4b, %4b) = %4b", num1, num2, result);
		end
		
		#1 $display("(%4b, %4b) = %4b\n", num1, num2, result);
		
		#1 $display("------------------------------\n");
	end
	
	initial
	begin : main
		$display("");
		$display("Exemplo_0806 - Axell Brendow - 631822");
		$display("");
		$display("operation_key = 000  -->  num1 + num2");
		$display("operation_key = 100  -->  num1 - num2");
		$display("operation_key = 101  -->  num1 == num2");
		$display("operation_key = 110  -->  num1 != num2");
		$display(""); #1;
		
		operation_key = 3'b000; #300
		operation_key = 3'b100; #300
		operation_key = 3'b101; #300
		operation_key = 3'b110; #300;
	end
	
endmodule