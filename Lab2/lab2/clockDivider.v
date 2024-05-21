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