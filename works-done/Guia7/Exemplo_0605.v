// -------------------------
// Exemplo_0605 - 5-NOT_OR_NOR_AND_NAND_XOR_XNOR_1_Resposta_Selecionavel
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module mux8inputs(input [7:0] inputArray, input [2:0] key, output selectedInput);

    assign selectedInput = inputArray[key];

endmodule

module Exemplo_0605;

	// ------------------------- data definition
	reg a;
	reg b;
	reg [2:0] key;
	wire not_a, a_or_b, a_nor_b, a_and_b, a_nand_b, a_xor_b, a_xnor_b;
	wire choosed_operation_result;
	
	not not1(not_a, a);
	or or1(a_or_b, a, b);
	nor nor1(a_nor_b, a, b);
	and and1(a_and_b, a, b);
	nand nand1(a_nand_b, a, b);
	xor xor1(a_xor_b, a, b);
	xnor xnor1(a_xnor_b, a, b);
	// O colchete com virgulas {,} faz com que os resultados das operacoes sejam concatenados
	// formando, assim, um numero binario. O bit menos significativo do numero e' 'not_a'. (little endian).
	mux8inputs mux8 ( { a_xnor_b, a_xor_b, a_nand_b, a_and_b, a_nor_b, a_or_b, not_a }, key, choosed_operation_result );
	
	// ------------------------- main part
	initial
	begin : main
		$display("");
		$display("Exemplo_0605 - Axell Brendow - 631822");
		$display("");
		$display("key = 000  -->  not is used");
		$display("key = 001  -->  or is used");
		$display("key = 010  -->  nor is used");
		$display("key = 011  -->  and is used");
		$display("key = 100  -->  nand is used");
		$display("key = 101  -->  xor is used");
		$display("key = 110  -->  xnor is used");
		$display("");
		
		$display("for key = 000");
		   a = 0; key = 3'b000;
		#1 $display("not(%b) = %b", a, choosed_operation_result);
		   a = 1;
		#1 $display("not(%b) = %b", a, choosed_operation_result);
		
		// projecting module tests
		#1 $monitor("(%b, %b) = %b", a, b, choosed_operation_result);
		
		$display("\nfor key = 001");
		   a = 1; b = 1; key = 3'b001;
		#1 a = 1; b = 0;
		#1 a = 0; b = 1;
		#1 a = 0; b = 0;
		
		#1 $display("\nfor key = 010");
		   a = 1; b = 1; key = 3'b010;
		#1 a = 1; b = 0;
		#1 a = 0; b = 1;
		#1 a = 0; b = 0;
		
		#1 $display("\nfor key = 011");
		   a = 1; b = 1; key = 3'b011;
		#1 a = 1; b = 0;
		#1 a = 0; b = 1;
		#1 a = 0; b = 0;
		
		#1 $display("\nfor key = 100");
		   a = 1; b = 1; key = 3'b100;
		#1 a = 1; b = 0;
		#1 a = 0; b = 1;
		#1 a = 0; b = 0;
		
		#1 $display("\nfor key = 101");
		   a = 1; b = 1; key = 3'b101;
		#1 a = 1; b = 0;
		#1 a = 0; b = 1;
		#1 a = 0; b = 0;
		
		#1 $display("\nfor key = 110");
		   a = 1; b = 1; key = 3'b110;
		#1 a = 1; b = 0;
		#1 a = 0; b = 1;
		#1 a = 0; b = 0;
	end
	
endmodule