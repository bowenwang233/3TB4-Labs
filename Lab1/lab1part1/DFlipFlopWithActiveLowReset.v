// flipflop active low synchronous reset
module DFlipFlopWithActiveLowReset(
    input wire clk,
    input wire rst,
    input wire d,
    output reg q
);

   always @(posedge clk) 
	begin
      //if (!rst) 
      //  q <= 1'b0; // Active low synchronous reset
      //else 
         q <= d;
   end

endmodule