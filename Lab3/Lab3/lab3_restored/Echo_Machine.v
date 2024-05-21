

module Echo_Machine(input sample_clk, input [15:0] inputSample, output reg [15:0] outputSample);
	wire signed[15:0] delay, feedbackLoop;
	assign feedBackLoop = outputSample;
	
	
	shiftRegister myEcho(.clock(sample_clk), .shiftin( feedBackLoop), .shiftout(delay),.taps())
	
	always @(posedge sample_clk)
	
	begin
		outputSample <= (delay>>7) + inputSample;
	end
	
endmodule 
