`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2024 19:39:34
// Design Name: 
// Module Name: shifterTest
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


module shifterTest();

    reg signed [20:0] in;
    reg flag;
    reg [3:0] b;
    wire signed [20:0] out;
    
    shifter s (in, b, flag, out);
    
    
    initial begin
        #0 in = 21'b1111_1111_0001_000000000; flag = 0; b = 6;   // -15 To check if it can save this negative number. 
        #10 in = 21'b0000_0000_0010_011000000; flag = 0; b = 9;  // 2.375 To check if overflow is avoided or not.
        #20 $finish;
    end
endmodule
