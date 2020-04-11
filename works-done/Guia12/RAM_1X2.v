// -------------------------
// RAM_1X2 (1 endereco para 2 bit)
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef RAM_1X2_V
`define RAM_1X2_V

`include "RAM_1x1.v"

module ram_1x2 (input enable, input read_write, input clock, input [1:0] data, input clear, output [1:0] saved_data_or_0);

    ram_1x1 ram1(enable, read_write, clock, data[0], clear, saved_data_or_0[0]);
    ram_1x1 ram2(enable, read_write, clock, data[1], clear, saved_data_or_0[1]);

endmodule

`endif