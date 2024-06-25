`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2024 12:55:40
// Design Name: 
// Module Name: NeuronMain
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
module ExP(
    input signed [20:0] arr,
    output reg signed [20:0] power
    );
    reg[10:0]X_I;
    reg signed [20:0]X_F;
    reg sign;
    reg sign2;
    reg I_a;
    reg signed [20:0] m2data;
    reg signed [20:0] m3data;
    
    always @(*)
    begin
    //  Segregating Integer, fractional and Sign Parts 
        sign = arr[20];
        if(sign == 1)
        begin
             X_F = {{12{1'b1}}, arr[8:0]};
        end
        
        else
        begin
            X_F = {{12{1'b0}}, arr[8:0]};
        end
        
    // Processing on Fractional part
    
    // M1
    if(sign == 1)
        begin
            X_F = {1'b1, X_F[20:1]};
        end
    else 
        begin
            X_F = X_F;
        end
     // M1
     
     X_F = X_F + {{11{1'b0}},1'b1 , {9{1'b0}}};
     // After here number has become positive
        
     //M2
     if(I_a == 1) 
        begin 
            m2data = X_F << 1;
        end
    else 
        begin
            m2data = X_F; 
        end
        
     //M3
     if(I_a == 0)
        begin
            m3data = X_F >> 1;
        end
     else 
        begin
            m3data = X_F;
        end
     
     if(sign == 0)
        begin
            power = m2data;
        end
     else
        begin
            power = m3data;
        end
     end
     
    always @(*)
    begin 
    X_I = arr[19:9];
    sign2 = arr[20];
        if(sign2 == 0)
            begin
                I_a = X_I[0];
            end
        else
            begin
                X_I = ~X_I;
                X_I = X_I + 1;
                I_a = X_I[0];
            end
    end
endmodule
