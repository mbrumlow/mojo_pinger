`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:32 03/12/2016 
// Design Name: 
// Module Name:    blink 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module blink(
    input clk,
    output blink
    );
	 
	
  reg pulse = 1'b0; 
  reg [26:0] counter = 26'b0;

  always @(posedge clk) begin
		if(counter == 49999999)
			begin
			counter <= 0; 
			pulse = !pulse;
			end
		else
			counter <= counter + 1;
  end
  
  assign blink = pulse;
  
endmodule
