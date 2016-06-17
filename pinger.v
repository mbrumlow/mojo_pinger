`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:25:21 03/12/2016 
// Design Name: 
// Module Name:    pinger 
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
module pinger(
	 input clk,
	 input rst, 
	 output trig,
	 input echo,
	 output ledt, 
	 output lede
    );

	reg [32:0] counter = 32'b0;
	reg [32:0] counter_echo = 32'b0;
	reg [32:0] distance = 36000;
	
	reg trig_ = 1'b0; 
	reg tsig = 1'b0; 
	reg esig = 1'b0; 
	
	assign lede = esig; 
	assign ledt = tsig;
	assign trig = trig_; 

	always @(posedge clk) begin
	
		if(counter <= 500) 
			trig_ <= 1'b1;
		else 
			trig_ <= 1'b0;
		
		if(echo) begin
			esig <= 1'b1;
			counter_echo <= counter_echo + 1; 
		end
		else begin
			esig <= 1'b0;
			if(counter_echo) begin
				if(rst) 
					distance = (counter_echo + 100);
					
				if( counter_echo < distance )
					tsig <= 1'b1;
				else 
					tsig <= 1'b0;
			end
			
		end

		if(counter == (3000000) / 2) begin 
			trig_ <= 1'b0;
			esig <= 1'b0;
			tsig <= 1'b0;
			counter <= 1'b0;
			counter_echo <= 1'b0; 
		end
		else 
			counter <= counter + 1; 
					
	end
	
endmodule
