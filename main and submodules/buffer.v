`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2024 15:13:05
// Design Name: 
// Module Name: buffer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module buffer(
    input [20:0] in,
    input clk, 
    output reg signed [20:0] vbuffer
    );

   reg signed [104:0]b;
   always @(posedge clk)
    begin
        vbuffer = b[104:84];
        b[104:21] = b[83:0];
        b[20:0] = in;
    end
endmodule
