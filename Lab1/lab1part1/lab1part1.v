//D flipflop:
module d_ff (
    input d,      // Data input to the flip-flop wire 
    input clk,    // Clock input for triggering on rising edge wire
    output reg q   // Output representing the state of the flip-flop
);
    always @(posedge clk) begin
        // This block represents a positive-edge-triggered D flip-flop behavior.
        // On the rising edge of the clock (posedge clk),
        // Update the value of the output (q) with the value of the input (d).
        q <= d;
    end
endmodule

// flipflop active low synchronous reset
module DFlipFlop_ActiveLowReset(
    input wire clk,
    input wire rst,
    input wire d,
    output reg q
);

   always @(posedge clk) 
	begin
      if (~rst) 
        q <= 1'b0; // Active low synchronous reset
      else 
         q <= d;
   end

endmodule

// flipflop active low synchronous reset and enable
module DFlipFlopWithResetAndEnable(
    input wire clk,
    input wire rst,
    input wire en,
    input wire d,
    output reg q
);


   always @(posedge clk) 
	begin
      if (~rst) 
         q <= 1'b0; // Active low synchronous reset
      else if (~en) 
         q <= d; // Active low enable
		//else 
			//q <= d;
   end

endmodule

//D latch 
module DLatchWithSynchronousEnable(
    input wire en,
    input wire d,
    output reg q
);

   always @(en or d) begin
      begin
			if(en)
				q <= d; // asynchronous enable
      end
   end

endmodule


module mux4t1(
    input in0, in1, in2, in3,
    input [1:0] sel,
    output reg out
);
   always @(in0 or in1 or in2 or in3 or sel) begin
      if (sel == 2'b00)
         out = in0;
      else if (sel == 2'b01)
         out = in1;
      else if (sel == 2'b10)
         out = in2;
      else
         out = in3;
   end	
endmodule


//4 Bit counter 
module counter(
    input wire clk,
    input wire rst,
    input wire en,
    output reg [3:0] count
);	
   always @(posedge clk) begin
      if (rst) 
         count <= 4'b0000; // Reset state
      else if (en) 
         count <= count + 1; // Increment on enable
   end
endmodule



