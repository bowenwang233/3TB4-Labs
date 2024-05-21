module temp_register (input clk, reset_n, load, increment, decrement, input [7:0] data, output negative, positive, zero);
	reg signed [7:0] Var;
	
	assign negative=Var[7];
	assign positive=(~Var[7] && ~zero);
	assign zero=(Var==8'b0);	
	
	always @(posedge clk or negedge reset_n) begin
		if (!reset_n) begin
			Var<=8'b0;
		end else if (load) begin
			Var<=data;
		end else if (increment) begin
			Var<=Var+8'b1;
		end else if (decrement) begin
			Var<=Var-8'b1;
		end
	end

endmodule
