`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2024 23:24:02
// Design Name: 
// Module Name: testMUX
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


module testMUX();
    reg signed [20:0] a;
    reg signed [20:0] b;
    reg signed [20:0] v;
    wire signed [20:0] c;
    
    //muxVsel m (a, b, c);
    mux2 m (v, a, b, c);
    initial begin
        #0 v = 21'b0000_0001_0100_000_000_000; b = 21'b1111_1011_1111_000000000; a =21'b0000_0000_1111_000_000_000;
        #10 v = 21'b0000_0011_0010_000_000_000; b = 21'b1111_1011_1111_000000000; a =21'b0000_0000_1111_000_000_000;
        #10 v = 21'b1111_1011_0000_000000000 ; b = 21'b1111_1011_1111_000000000; a =21'b0000_0000_1111_000_000_000;
        #10 $finish;
    end
    
endmodule
