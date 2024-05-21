module lab1part3 (input [9:0]SW,
						input [3:0]KEY,
						input CLOCK_50,
						output [6:0]HEX0);
						
	
	
	wire [3:0]OFF = 4'b1111;				//hard code off
	wire [3:0]buttonCounter;				//output of button counter
	wire [29:0]clockCounter;			//output of clock counter
		
	wire [3:0]in;					//multiplexer output
	wire [6:0]out;					//display
	
	
	assign HEX0 = out;
	
	fourBitCounter mode1(.KEY3(KEY[3]),
								.KEY0(KEY[0]),
								.count(buttonCounter));
	
	clkcounter mode2(	   .clock(CLOCK_50),
								.reset(KEY[0]),
								.result(clockCounter));
	
	mux4to1    mode3(	   .sel(SW[9:8]), 
								.in0(SW[3:0]), 
								.in1(buttonCounter), 
								.in2(clockCounter[29:26]), 		//4 most significant bits
								.in3(OFF), 
								.out(in));
	
	sevenSegDisplay mode4(	.X(in),
									.LEDs(out));
		

endmodule








