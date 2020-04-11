// -------------------------
// 1-RAM_1X4 (1 endereco para 4 bit)
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef RAM_1X4_V
`define RAM_1X4_V

`include "RAM_1x1.v"

module ram_1x4 (input enable, input read_write, input clock, input [3:0] data, input clear, output [3:0] saved_data_or_0);

    ram_1x1 ram1(enable, read_write, clock, data[0], clear, saved_data_or_0[0]);
    ram_1x1 ram2(enable, read_write, clock, data[1], clear, saved_data_or_0[1]);
    ram_1x1 ram3(enable, read_write, clock, data[2], clear, saved_data_or_0[2]);
    ram_1x1 ram4(enable, read_write, clock, data[3], clear, saved_data_or_0[3]);

endmodule

`endif