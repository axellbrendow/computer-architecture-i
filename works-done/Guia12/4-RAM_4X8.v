// -------------------------
// 4-RAM_4X8 (4 enderecos para 8 bits)
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef RAM_4X8_V
`define RAM_4X8_V

`include "RAM_1x8.v"
`include "demux_2x1.v"
`include "mux_2x8.v"

module ram_4x8 (input [1:0] address, input read_write, input clock, input [7:0] data, input clear, output [7:0] saved_data_or_0);

    wire enable_ram1, enable_ram2, enable_ram3, enable_ram4;
	
	demux_2x1 demux1(1'b1, address, enable_ram1, enable_ram2, enable_ram3, enable_ram4);
	
	wire [7:0] ram1_data;
    wire [7:0] ram2_data;
    wire [7:0] ram3_data;
    wire [7:0] ram4_data;
	
	ram_1x8 ram1(enable_ram1, read_write, clock, data, clear, ram1_data);
    ram_1x8 ram2(enable_ram2, read_write, clock, data, clear, ram2_data);
    ram_1x8 ram3(enable_ram3, read_write, clock, data, clear, ram3_data);
    ram_1x8 ram4(enable_ram4, read_write, clock, data, clear, ram3_data);
	
	mux_2x8 mux1(ram1_data, ram2_data, ram3_data, ram4_data, address, saved_data_or_0);

endmodule

`endif