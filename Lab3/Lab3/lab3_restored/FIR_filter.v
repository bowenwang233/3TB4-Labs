`timescale 1ns / 1ps
module FIR_filter(input sample_clock, 
						input reset, 
						input [15:0] input_sample, 
						output reg [15:0] output_sample);

parameter N = 17;
integer j;
integer k;

reg signed [15:0] coeff[16:0];
reg [15:0] shift_reg[N-1: 0];
wire signed [15:0] multi_res [N-1:0];
reg signed [15:0] multi_res1;
reg signed [15:0] multi_res2 [N-1:0];


always @(*)
begin
	coeff[  0]=     -3778;
	coeff[  1]=        -2;
	coeff[  2]=      2889;
	coeff[  3]=        -4;
	coeff[  4]=     -3571;
	coeff[  5]=        -4;
	coeff[  6]=      4044;
	coeff[  7]=        -2;
	coeff[  8]=     28564;
	coeff[  9]=        -2;
	coeff[ 10]=      4044;
	coeff[ 11]=        -4;
	coeff[ 12]=     -3571;
	coeff[ 13]=        -4;
	coeff[ 14]=      2889;
	coeff[ 15]=        -2;
	coeff[ 16]=     -3778;

end

generate 
genvar i;

for (i=0; i<N; i=i+1)
begin: mult
	multiplier mult(.dataa(coeff[i]), .datab(shift_reg[i]), .result(multi_res[i]));
end
endgenerate

always @(posedge sample_clock or posedge reset)
begin
	if(reset)
	begin
		output_sample = 0;
		for (k=0; k<N; k=k+1)
		begin
			shift_reg[k] = 0;
		end
	end
	
	else
	begin
		for (k=N-1; k>0; k=k-1)
		begin
			shift_reg[k] = shift_reg[k-1];
		end
		shift_reg[0] = input_sample;
	end
	
	for (k=0; k<N; k=k+1)
	begin
		multi_res2[k] = multi_res[k];
	end
	multi_res1 = 0;
	for (k=0; k<N; k=k+1)
	begin
		multi_res1 = multi_res1 + multi_res2[k];
	end
	output_sample = multi_res1;
end
endmodule