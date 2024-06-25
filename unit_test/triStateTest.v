`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2024 22:02:45
// Design Name: 
// Module Name: triStateTest
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


module triStateTest();

    reg [20:0]in;
    reg [20:0]control;
    wire [20:0]out;
    
    triStateBuffer t1 (in, control, out);
    
    initial begin
        control = 0; in = 32;
        #5 control = 1; in = 64;
    end
endmodule
