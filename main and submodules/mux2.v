`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2024 20:30:59
// Design Name: 
// Module Name: mux2
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


module mux2(
    input signed [20:0] a,
    input signed [20:0] b,
    input signed [20:0] c,
    output reg signed [20:0] d
    );
    reg signed [20:0] check;
    reg signed [20:0] store;
    always @(*)
    begin
        if(a[20] == 0) begin
            store = 21'b0000_0001_1110_000_000_000;
            check = a - store;
            if(check[20] == 0) begin
                d = c;
            end
            else d = b;
        end
        else d = b;
    end
endmodule
