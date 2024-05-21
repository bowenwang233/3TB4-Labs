module tutorial2 (input CLOCK_50, input [2:0] KEY, output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	wire clk_en; // Clock divider output
	wire [19:0] ms; // Counter output
	wire [3:0] b0, b1, b2, b3, b4, b5; // BCD_digits
	wire [6:0] d0, d1, d2, d3, d4, d5; // hex display
	
	assign HEX0 = d0;
	assign HEX1 = d1;
	assign HEX2 = d2;
	assign HEX3 = d3;
	assign HEX4 = d4;
	assign HEX5 = d5;
	
	clockDivider clk1(.clk(CLOCK_50), 
							 .reset_n(KEY[0]), 
							 .clk_ms(clk_en));
	
	counter cnt1(.clk(clk_en), 
					 .reset_n(KEY[0]), 
					 .start_n(KEY[1]), 
					 .stop_n(KEY[2]), 
					 .ms_count(ms));
	
	hexToBCD htb1(.clk(CLOCK_50),
									  .hex_number(counter_hex),
									  .bcd_digit_0(b0),
									  .bcd_digit_1(b1),
									  .bcd_digit_2(b2),
									  .bcd_digit_3(b3),
									  .bcd_digit_4(b4),
									  .bcd_digit_5(b5));
	
	sevenSegDisplay seg0(.X(b0), .LEDs(d0));
	sevenSegDisplay seg1(.X(b1), .LEDs(d1));
	sevenSegDisplay seg2(.X(b2), .LEDs(d2));
	sevenSegDisplay seg3(.X(b3), .LEDs(d3));
	sevenSegDisplay seg4(.X(b4), .LEDs(d4));
	sevenSegDisplay seg5(.X(b5), .LEDs(d5));
	
endmodule

module clockDivider (input clk, reset_n, output reg clk_ms);
	parameter factor= 50000; //50000; 
	reg [31:0] countQ = 32'b0;
	always @ (posedge clk, negedge reset_n) 
	begin
		if (!reset_n) 
			begin
			clk_ms <= 32'b0;
			end
		else 
			begin 
				countQ <= countQ + 1;
				if(countQ<factor/2)
					begin
						clk_ms <= 0;
					end
				else if(countQ<factor-1)
					begin 
						clk_ms <= 1;
					end 
				else 
					begin
						countQ <= 32'b0;
					end
			end	
	end
endmodule 


module hexToBCD(
    input wire clk,
    input wire reset,
    input wire [19:0] hex_number,
    output [3:0] bcd_digit_0, bcd_digit_1, bcd_digit_2, bcd_digit_3, bcd_digit_4, bcd_digit_5
);
    integer i, k;
    wire [19:0] hex_number1;
    reg [3:0] bcd_digit [5:0];
    assign hex_number1 = hex_number[19:0];

    assign bcd_digit_0 = bcd_digit[0];
    assign bcd_digit_1 = bcd_digit[1];
    assign bcd_digit_2 = bcd_digit[2];
    assign bcd_digit_3 = bcd_digit[3];
    assign bcd_digit_4 = bcd_digit[4];
    assign bcd_digit_5 = bcd_digit[5];

    always @ (*)
        begin
            bcd_digit[0] = 4'd0;
            bcd_digit[1] = 4'd0;
            bcd_digit[2] = 4'd0;
            bcd_digit[3] = 4'd0;
            bcd_digit[4] = 4'd0;
            bcd_digit[5] = 4'd0;

            for(i = 19; i>0; i = i-1)
            begin
                //check all 6 BCD tetrads, if >=5 then add 3
                for (k = 5; k >= 0; k = k-1)
                begin
                    if (bcd_digit[k] >= 4'b0101)
                    begin
                        bcd_digit[k] = bcd_digit[k]+3;
                    end
                end//end of add 3
                //shift one bit of BIN/HEX left 
                //for the first 5 tetrads
                for (k = 5; k >= 1; k = k-1)
                begin
                    bcd_digit[k] = bcd_digit[k] << 1;
                    bcd_digit[k][0] = bcd_digit[k-1][3];
                end//end of shift for first 5 tetrads
                //shift one bit of BIN/HEX left, for the last tetrad
                bcd_digit[0] = bcd_digit[0] << 1;
                bcd_digit[0][0] = hex_number1[i];
            end//end of for loop
        end//end of always
endmodule

module counter ( 
input clk, 
input reset_n, start_n, stop_n, 
output reg [ 19:0 ] ms_count);
	reg hold = 1'b0;
	always@(posedge clk, negedge reset_n) 
		begin
			if (!reset_n)
				begin 
					ms_count <= 0;
				end
			else
				if(!start_n && stop_n) 
				begin 
					ms_count <= ms_count + 1;
				end
		
		end
endmodule

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

