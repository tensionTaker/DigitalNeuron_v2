`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2024 23:50:39
// Design Name: 
// Module Name: testMain
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


module testMain();

    reg [20:0] I;
    reg clk;
    reg set;
    reg [20:0] c;
    reg [20:0] d;
    wire signed [20:0] v;
    wire signed [20:0] wu3;
    wire signed [20:0] wu4;
   wire signed [20:0] check;
    wire signed [20:0] x;
    wire signed [20:0] ufinal;
    wire signed [20:0] final;
    wire signed [4:0] count;
    wire signed [4:0] count2;
    main m (I, clk, set, c, d, v, final, ufinal, x, check, wu3, wu4, count, count2);//, u, e1s3, f, x, g, h);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        #0 c = 21'b1111_1011_0000_000_000_000; // Regular Spiking 
       #0 d = 21'b0000_0000_1111_000_000_000; // Regular Spiking 
       // c = 21'b1111_1100_1000_000_000_000; // Chattering 
       // d = 21'b0000_0000_0100_110_000_000; // Chattering 
       // c = 21'b1111_1011_0000_000_000_000; // Fast Spiking
       // d = 21'b0000_0000_0111_010_000_000; // Fast Spiking
       // c = 21'b1111_1100_0011_000_000_000; // Intrinsically Bursting
       // d = 21'b0000_0000_1000_100_000_000; // Intrinsically Bursting
        #0 I = 0;
        set = 1;
        #15 set = 0;
        #2 I = 21'b0000_0000_1111_000_000_000;
        #10000 $finish;
    end
    
endmodule

