`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2024 21:34:46
// Design Name: 
// Module Name: testBuffer
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


module testBuffer();
    reg signed [20:0]in;
    wire signed [20:0]out;
    reg clk;
    
    buffer bf (in, clk, out);
    
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end
    integer i;
    initial begin
        in = 10;
        #1.2;
        in = 0;
        #0.1;
        for(i = 0; i < 6; i = i + 1) begin
            in = i*8;
            #2;
        end
       #1000 $finish;
    end
endmodule
