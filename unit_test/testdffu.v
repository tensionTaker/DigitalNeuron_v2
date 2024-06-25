`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2024 19:59:37
// Design Name: 
// Module Name: testdffu
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


module testdffu();
    reg signed [20:0] q;
    reg set;
    reg clk;
    wire signed [20:0]out;
    
    dffu d1 (q, set, clk, out);
    
    initial begin
        clk = 0;
        forever #0.5 clk = ~clk;
    end
    
    initial begin
        #5 q = 21'b0000_0000_1111_000000000; set = 0;
        #5 set = 1;
        #5 set = 0; q = 21'b0000_0000_1111_000000000;
        #5 $finish;
    end
endmodule
