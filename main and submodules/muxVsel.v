`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2024 23:09:06
// Design Name: 
// Module Name: muxVsel
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


module muxVsel(
    input signed [20:0] a,
    input signed [20:0] b,
    output reg signed [20:0] c
    );
    reg signed [20:0] check;
    reg signed [20:0] store;
    always @(*)
    begin
        if(a[20] == 0) begin
            store = 21'b0000_0001_1110_000_000_000;
            check = a - store;
            if(check[20] == 0) begin
                c = b;
            end
            else c = a;
        end
        else c = a;
    end
endmodule
