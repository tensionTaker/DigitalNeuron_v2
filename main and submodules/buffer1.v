`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 13:26:12
// Design Name: 
// Module Name: buffer1
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


module buffer1(
    input [20:0] in,
    input clk,
    output reg signed [20:0] out
    );
    
    reg [20:0] b;
    
    always @(posedge clk)
    begin
        out = b;
        b = in;
    end
endmodule
