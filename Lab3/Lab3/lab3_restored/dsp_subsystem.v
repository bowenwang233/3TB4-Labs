module dsp_subsystem (input sample_clock,  
							 input reset, 
							 input [1:0] selector, 
							 input [15:0] input_sample, 
output reg [15:0] output_sample);
	wire [15:0] echoOut;
	wire [15:0] filter;
	
	Echo_Machine sw10 (.sample_clk(sample_clock), .inputSample(input_sample), .outputSample(echoOut));
	FIR_filter   sw01 (.sample_clock(sample_clock), .reset(reset), .input_sample(input_sample), .output_sample(filter));
	
	always @(posedge sample_clock)
	begin
		case(selector)
			2'b00: output_sample = input_sample;
			2'b01: output_sample = filter;
			2'b10: output_sample = echoOut;
			2'b11: output_sample = input_sample;
		endcase
	end

endmodule
