// -------------------------
// 7-RAM_4X16 (4 enderecos para 16 bits)
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef RAM_4X16_V
`define RAM_4X16_V

`include "6-RAM_1x16.v"
`include "demux_2x1.v"
`include "mux_2x16.v"

module ram_4x16 (input [1:0] address, input read_write, input clock, input [15:0] data, input clear, output [15:0] saved_data_or_0);

    wire enable_ram1, enable_ram2, enable_ram3, enable_ram4;
	
	demux_2x1 demux1(1'b1, address, enable_ram1, enable_ram2, enable_ram3, enable_ram4);
	
	wire [15:0] ram1_data;
    wire [15:0] ram2_data;
    wire [15:0] ram3_data;
    wire [15:0] ram4_data;
	
	ram_1x16 ram1(enable_ram1, read_write, clock, data, clear, ram1_data);
    ram_1x16 ram2(enable_ram2, read_write, clock, data, clear, ram2_data);
    ram_1x16 ram3(enable_ram3, read_write, clock, data, clear, ram3_data);
    ram_1x16 ram4(enable_ram4, read_write, clock, data, clear, ram3_data);
	
	mux_2x16 mux1(ram1_data, ram2_data, ram3_data, ram4_data, address, saved_data_or_0);

endmodule

`endif