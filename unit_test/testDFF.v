`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2024 20:34:19
// Design Name: 
// Module Name: testDFF
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


module testDFF();
    reg signed [20:0] in;
    reg clk;
    reg set;
    wire signed [20:0] out;
    
    dff1 df (in, set, clk, out);
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        #0 set = 0; in = 21'b0000_0010_0011_111_110_000;
        #10 set = 1;
        #10 set = 0; in = 21'b0000_0010_0011_111_110_000;
        #10 $finish;
    end
endmodule
