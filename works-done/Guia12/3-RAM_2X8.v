// -------------------------
// 3-RAM_2X8 (2 enderecos para 8 bits)
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef RAM_2X8_V
`define RAM_2X8_V

`include "RAM_1x8.v"
`include "demux_1x1.v"
`include "mux_1x8.v"

module ram_2x8 (input address, input read_write, input clock, input [7:0] data, input clear, output [7:0] saved_data_or_0);

    wire enable_ram1, enable_ram2;
	
	demux_1x1 demux1(1'b1, address, enable_ram1, enable_ram2);
	
	wire [7:0] ram1_data;
    wire [7:0] ram2_data;
	
	ram_1x8 ram1(enable_ram1, read_write, clock, data, clear, ram1_data);
    ram_1x8 ram2(enable_ram2, read_write, clock, data, clear, ram2_data);
	
	mux_1x8 mux1(ram1_data, ram2_data, address, saved_data_or_0);

endmodule

`endif