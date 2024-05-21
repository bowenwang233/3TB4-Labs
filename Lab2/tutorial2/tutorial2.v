module tutorial2 (input CLOCK_50, input [2:0] KEY, output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
	wire clk_en;
	wire [19:0] ms;
	wire [3:0] digit0,digit1,digit2,digit3,digit4,digit5;
	
	clockDivider cd1(.clk(CLOCK_50), .reset_n(KEY[0]), .clk_ms(clk_en));
	counter(.clk(clk_en), .reset_n(KEY[0]), .start_n(KEY[1]), .stop_n(KEY[2]), .ms_count(ms));
	hexToBCD(CLOCK_50, KEY[0], ms, digit0,digit1,digit2,digit3, digit4,digit5);	

	sevenSegDisplay decoder0(digit0,HEX0);
	sevenSegDisplay decoder1(digit1,HEX1);
	sevenSegDisplay decoder2(digit2,HEX2);
	sevenSegDisplay decoder3(digit3,HEX3);
	sevenSegDisplay decoder4(digit4,HEX4);
	sevenSegDisplay decoder5(digit5,HEX5);
	
endmodule

