module op2_mux (input [1:0] select, input [7:0] register, immediate,
				output reg [7:0] result);
				
	//mux
	always @(*) begin
		case(select)
			2'b00:result<=register;
			2'b01:result<=immediate;
			2'b10:result<=8'b01; //binary 1
			2'b11:result<=8'b10; //binary 2
			default:result<=register; //base case
		endcase
	end

endmodule
