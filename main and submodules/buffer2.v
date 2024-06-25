`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 13:35:09
// Design Name: 
// Module Name: buffer2
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


module buffer2(
    input [20:0] in,
    input clk,
    output reg signed [20:0] out
    );
    
    reg signed [62:0]b;
    
    always @(posedge clk)
    begin
        out = b[62:42];
        b[62:21] = b[41:0];
        b[20:0] = in;
    end
    
endmodule
