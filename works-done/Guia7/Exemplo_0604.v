// -------------------------
// Exemplo_0604 - 4-OR_NOR_XOR_XNOR_1_Resposta_Selecionavel
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

module mux4inputs(input [3:0] inputArray, input [1:0] key, output selectedInput);

    assign selectedInput = inputArray[key];

endmodule

module Exemplo_0604;

	// ------------------------- data definition
	reg a;
	reg b;
	reg [1:0] key;
	wire a_or_b, a_nor_b, a_xor_b, a_xnor_b;
	wire choosed_operation_result;
	
	or or1(a_or_b, a, b);
	nor nor1(a_nor_b, a, b);
	xor xor1(a_xor_b, a, b);
	xnor xnor1(a_xnor_b, a, b);
	// O colchete com virgulas {,} faz com que os resultados das operacoes sejam concatenados
	// formando, assim, um numero binario. A operacao 'a_or_b' representa o bit menos
	// significativo do numero. (little endian).
	mux4inputs mux4 ( { a_xnor_b, a_xor_b, a_nor_b, a_or_b }, key, choosed_operation_result );
	
	// ------------------------- main part
	initial
	begin : main
		$display("");
		$display("Exemplo_0604 - Axell Brendow - 631822");
		$display("");
		$display("key = 00  -->  or is used");
		$display("key = 01  -->  nor is used");
		$display("key = 10  -->  xor is used");
		$display("key = 11  -->  xnor is used");
		$display("");
		
		// projecting module tests
		$monitor("(%b, %b) = %b", a, b, choosed_operation_result);
		
		$display("for key = 00");
		   a = 1; b = 1; key = 2'b00;
		#1 a = 1; b = 0;
		#1 a = 0; b = 1;
		#1 a = 0; b = 0;
		
		#1 $display("\nfor key = 01");
		   a = 1; b = 1; key = 2'b01;
		#1 a = 1; b = 0;
		#1 a = 0; b = 1;
		#1 a = 0; b = 0;
		
		#1 $display("\nfor key = 10");
		   a = 1; b = 1; key = 2'b10;
		#1 a = 1; b = 0;
		#1 a = 0; b = 1;
		#1 a = 0; b = 0;
		
		#1 $display("\nfor key = 11");
		   a = 1; b = 1; key = 2'b11;
		#1 a = 1; b = 0;
		#1 a = 0; b = 1;
		#1 a = 0; b = 0;
	end
	
endmodule