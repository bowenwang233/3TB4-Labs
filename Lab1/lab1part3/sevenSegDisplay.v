
module sevenSegDisplay(
input [3:0]X, 
output reg [6:0]LEDs
);



always @ (*)
	begin
		case (X)
			4'b0000: LEDs[6:0]=7'b1000000; //7'b1000000 decimal 0
			4'b0001: LEDs[6:0]=7'b1111001; //7'b1111001 decimal 1
			4'b0010: LEDs[6:0]=7'b0100100; //7'b0100100 decimal 2
			4'b0011: LEDs[6:0]=7'b0110000; //7'b0110000 decimal 3
			4'b0100: LEDs[6:0]=7'b0011001; //7'b0011001 decimal 4
			4'b0101: LEDs[6:0]=7'b0010010; //7'b0010010 decimal 5
			4'b0110: LEDs[6:0]=7'b0000010; //7'b0000010 decimal 6
			4'b0111: LEDs[6:0]=7'b1111000; //7'b1111000 decimal 7
			4'b1000: LEDs[6:0]=7'b0000000; //7'b0000000 decimal 8
			4'b1001: LEDs[6:0]=7'b0010000; //7'b0010000 decimal 9
			4'b1010: LEDs[6:0]=7'b0101111; //7'b0101111 R
			4'b1011: LEDs[6:0]=7'b0001000; //7'b0001000 A
			4'b1100: LEDs[6:0]=7'b1000110; //7'b1000110 C
			4'b1101: LEDs[6:0]=7'b0001001; //7'b0001001 H
			4'b1110: LEDs[6:0]=7'b0000110; //7'b0000110 E
			4'b1111: LEDs[6:0]=7'b1111111; //7'b1111111 OFF
		endcase
	end
	
endmodule

