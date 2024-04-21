module SystemVerilog2 (
					input logic [1:0] SW,
					input logic [0:0] KEY,
					output logic [4:0] LEDR);
	ex2 dut (.rst(SW[0]), .clk (KEY[0]), .x(SW[1]),.out(LEDR [4]),.currentstate (LEDR [3:0]));
	
endmodule 