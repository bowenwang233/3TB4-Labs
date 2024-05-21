//4 Bit counter 

module fourBitCounter(
    input KEY3,
	 input KEY0,
    output reg [3:0] count
);
   always @(negedge KEY3,  negedge KEY0) begin
      if (!KEY0) begin
         count <= 4'b0000; // Reset state
      end else begin
         count <= count + 1'b1; // Increment on enable
		end
	end
endmodule

