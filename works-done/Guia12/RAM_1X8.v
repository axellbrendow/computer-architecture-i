// -------------------------
// RAM_1X8 (1 endereco para 8 bit)
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef RAM_1X8_V
`define RAM_1X8_V

`include "1-RAM_1x4.v"

module ram_1x8 (input enable, input read_write, input clock, input [7:0] data, input clear, output [7:0] saved_data_or_0);

    ram_1x4 ram1(enable, read_write, clock, data[3:0], clear, saved_data_or_0[3:0]);
    ram_1x4 ram2(enable, read_write, clock, data[7:4], clear, saved_data_or_0[7:4]);

endmodule

`endif