// -------------------------
// 6-RAM_1X16 (1 endereco para 16 bit)
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef RAM_1X16_V
`define RAM_1X16_V

`include "RAM_1x8.v"

module ram_1x16 (input enable, input read_write, input clock, input [15:0] data, input clear, output [15:0] saved_data_or_0);

    ram_1x8 ram1(enable, read_write, clock, data[7:0], clear, saved_data_or_0[7:0]);
    ram_1x8 ram2(enable, read_write, clock, data[15:8], clear, saved_data_or_0[15:8]);

endmodule

`endif