// -------------------------
// 2-RAM_1X4_with_2_1X2_RAMs (1 endereco para 4 bit)
// Nome: Axell Brendow
// Matricula: 631822
// -------------------------

`ifndef RAM_1X4_WITH_2_1X2_RAMS_V
`define RAM_1X4_WITH_2_1X2_RAMS_V

`include "RAM_1x2.v"

module ram_1x4_with_2_1x2_rams (input enable, input read_write, input clock, input [3:0] data, input clear, output [3:0] saved_data_or_0);

    ram_1x2 ram1(enable, read_write, clock, data[1:0], clear, saved_data_or_0[1:0]);
    ram_1x2 ram2(enable, read_write, clock, data[3:2], clear, saved_data_or_0[3:2]);

endmodule

`endif