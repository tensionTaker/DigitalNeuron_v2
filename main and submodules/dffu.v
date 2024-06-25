`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2024 19:28:42
// Design Name: 
// Module Name: dffu
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


module dffu(
    input [20:0] d,
    input set,
    input clk,
    output reg signed [20:0] q
    );
    always @(posedge clk)
    begin
        if(set == 1) begin
            q <= 21'b1111_1111_0010_110_011_000;
            //q <= 21'b1111_1111_0010_000_000_000;
            //q <= 21'b0000_0000_1111_000_000_000;
        end
        else begin
            q <= d;
        end
    end
endmodule
