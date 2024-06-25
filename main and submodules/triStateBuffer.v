`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2024 21:49:15
// Design Name: 
// Module Name: triStateBuffer
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


module triStateBuffer(
    input [20:0] in,
    input control,
    output [20:0] out
    );
    
    assign out = control? in : 21'bzzzz_zzzz_zzzz_zzz_zzz_zzz;
    
endmodule
