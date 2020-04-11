// -------------------------
// 5-RAM_8X8 (8 enderecos para 8 bits)
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef RAM_8X8_V
`define RAM_8X8_V

`include "4-RAM_4X8.v"
`include "demux_1x2.v"
`include "demux_1x1.v"
`include "mux_1x8.v"

module ram_8x8 (input [2:0] address, input read_write, input clock, input [7:0] data, input clear, output [7:0] saved_data_or_0);

    wire [1:0] mem1_address;
    wire [1:0] mem2_address;
	
	demux_1x2 demux1(address[1:0], address[2], mem1_address, mem2_address);
	
    wire mem1_clock;
    wire mem2_clock;
	
	demux_1x1 demux2(clock, address[2], mem1_clock, mem2_clock);
	
	wire [7:0] mem1_saved_data;
	wire [7:0] mem2_saved_data;
	
	ram_4x8 ram1(mem1_address, read_write, mem1_clock, data, clear, mem1_saved_data);
    ram_4x8 ram2(mem2_address, read_write, mem2_clock, data, clear, mem2_saved_data);
	
	mux_1x8 mux1(mem1_saved_data, mem2_saved_data, address[2], saved_data_or_0);

endmodule

`endif