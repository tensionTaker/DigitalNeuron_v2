`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2024 18:25:21
// Design Name: 
// Module Name: shifter
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


module shifter(
    input signed [20:0] a,
    input [3:0] b,
    input flag,
    output reg signed [20:0] shifted
    );
    
    always @(*)
        begin
            if(a[20] == 1) begin  // Number is negative
                if(flag == 1) begin // Right shift
                    case(b)
                    3 : shifted = { {3{1'b1}} , a[20:3]};
                    4 : shifted = { {4{1'b1}} , a[20:4]};
                    6 : shifted = { {6{1'b1}} , a[20:6]};
                    7 : shifted = { {7{1'b1}} , a[20:7]};
                    8 : shifted = { {8{1'b1}} , a[20:8]};
                    9 : shifted = { {9{1'b1}} , a[20:9]};
                    endcase
                end
                else begin // Left shift 
                    //This have undefined behaviour but should work for given range of values and block diagram
                    case(b)
                    3 : shifted = { a[16:0] , {3{1'b1}} };
                    4 : shifted = { a[15:0] , {4{1'b1}} };
                    6 : shifted = { a[14:0] , {6{1'b1}} }; // Only Working case 
                    7 : shifted = { a[12:0] , {7{1'b1}} };
                    8 : shifted = { a[11:0] , {8{1'b1}} };
                    9 : shifted = { a[10:0] , {9{1'b1}} };
                    endcase                    
                end
            end
            else begin // Number is positive 
                if(flag == 1) begin
                    case(b)
                    3 : shifted = a >> 3;
                    4 : shifted = a >> 4;
                    6 : shifted = a >> 6;
                    7 : shifted = a >> 7;
                    8 : shifted = a >> 8;
                    9 : shifted = a >> 9;                    
                    endcase          
                end
                else begin
                    case(b)
                    3 : shifted = a << 3;
                    4 : shifted = a << 4;
                    5 : shifted = a << 5;
                    6 : shifted = a << 6;
                    7 : shifted = a << 7;
                    8 : shifted = a << 8;
                    9 : shifted = a << 9;                    
                    endcase                            
                end
            end
        end
endmodule
