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
				if(!stop_n) 
				begin 
					hold <= 1'b0;
				end
				else if(!start_n)
				begin 
					hold <= 1'b1;
				end
				else if(hold)
				begin 
					ms_count <= ms_count + 1;
				end
		end
endmodule
