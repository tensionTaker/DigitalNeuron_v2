`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2024 15:34:08
// Design Name: 
// Module Name: dff1
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


module dff1(
    input signed [20:0] d,
    input set,
    input clk,
    output reg signed [20:0] q
    );
    
    always @(posedge clk)
        begin
            if(set == 1)
                begin
                   // q <= 21'b1111_1011_1111_000000000; // -65
                   q <= 21'b1111_1011_1010_000_000_000;
                end
            else 
                begin
                    q <= d;
                end
        end
endmodule
