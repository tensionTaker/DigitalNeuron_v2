`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// 
// Create Date: 08.06.2024 15:23:14
// Design Name: 
// Module Name: main
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


module main(
    input [20:0] I,
    input clk,
    input set,
    input [20:0] c,
    input [20:0] d,
    output signed [20:0] v,
    output reg signed [20:0] finalv, 
    output signed [20:0] u,
    output signed [20:0]cd, 
    output reg signed [20:0] check,
    output signed [20:0] wu3, 
    output signed [20:0] wu4,
    output reg signed [4:0] count,
    output reg signed [4:0] count2
 //   output signed [20:0] e1s3,
 //   output signed [20:0] f, 
 //   output signed [20:0] x,
 //   output signed [20:0] g, 
 //   output signed [20:0] h
    );
    wire signed [20:0] tempU;
    
    // v Pipeline //////////////////////////////////////////////
    //wire signed [20:0] u;
    always @(posedge clk)
    begin
        if(set == 1) count = 0;
        else
        begin
        count = count + 1;
            if(count == 8) begin
                count = 1;
                finalv = v;
                check = tempU;
            end
        end
    end
    
    
    reg signed control;
    always @(posedge clk)
    begin
        if(set == 1) begin 
            control = 0;
            count2 = 1;
        end
        else
        begin
        if(count2 == 0) begin
            control = 0;
        end 
        
        count2 = count2 + 1;
        
        if(count2 == 7) begin
            control = 1;
            count2 = 0;
        end
        end
    end
    
    wire [20:0]bf1;
    wire signed [20:0]xu;
    wire signed [20:0]x; 
    triStateBuffer t1 (x, control, bf1);
    
    wire signed [20:0]t;
    
    dff1 dInitial (bf1, set, clk, t); // Helps in initialising membrane potential
    
    muxVsel m1 (t, c, v);
    
    wire signed [20:0] delayedV;
    
    buffer b1 (v, clk, delayedV);

    wire signed [20:0] negV;
    
    assign negV = ~v + 1;
    
    wire signed [20:0]vs1;
    wire signed [20:0]vs2;
    
    shifter s1 (v, 6, 1, vs1);
    shifter s2 (negV, 6, 1, vs2);
    
    
    wire signed [20:0]s1e1;
    wire signed [20:0]copys1e1;
    wire signed [20:0]s2e2;
    wire signed [20:0]copys2e2;
    
    ExP e1 (vs1, s1e1);
    assign copys1e1 = s1e1;
    
    ExP e2 (vs2, s2e2);
    assign copys2e2 = s2e2;
    
    
    wire signed [20:0]e1s3;
    wire signed [20:0]e1s4;
    wire signed [20:0]e2s5;
    wire signed [20:0]e2s6;
    
    shifter s3 (s1e1, 9, 0, e1s3);
    shifter s4 (copys1e1, 6, 0, e1s4);
    shifter s5 (s2e2, 6, 0, e2s5);
    shifter s6 (copys2e2, 4, 0, e2s6);
    
    wire signed [20:0]wv[0:17];
    dff1 dv1 (e1s3, 0, clk, wv[0]);
    dff1 dv2 (e1s4, 0, clk, wv[1]);
    dff1 dv3 (e2s5, 0, clk, wv[2]);
    dff1 dv4 (e2s6, 0, clk, wv[3]);
  //  wire signed [20:0]f; // f in place of wv[4]
    assign wv[4] = wv[0] - wv[1];
    assign wv[5] = wv[2] + wv[3];
    
    // h in place of wv[6]
    dff1 dv5 (wv[4], 0, clk, wv[6]);
    dff1 dv6 (wv[5], 0, clk, wv[7]);
    
    assign wv[8] = wv[6] + wv[7];
    
    dff1 dv7 (wv[8], 0, clk, wv[9]);
    
    wire signed [20:0]k3;
    assign k3 = 21'b0001_1000_1100_000_000_000;
   // assign k3 = 21'b1110_0111_0000_000_000_000;
   // wire signed [20:0] g; // g in place of wv[10]
    //wire signed [20:0]cd; 
    assign cd = wv[9] - k3;
    // cd in place of wv[10]
    dff1 dv8 (cd, 0, clk, wv[11]);
    

    wire signed [20:0] delayedU;
    assign wv[12] = wv[11] - delayedU;
    
    dff1 dv9 (wv[12], 0, clk, wv[13]);
    
    assign wv[14] = wv[13] + I;
    
    shifter s7 (wv[14], 7, 1, wv[15]);
    
    dff1 dv10 (wv[15], 0, clk, wv[16]);
    
    assign x = wv[16] + delayedV;
    
    // v Pipeline finishes //////////////////////////////////
    // u was declared above as signed wire of 21 bits////////
    wire signed [20:0]tu;
    dffu duInitial (xu, 0, clk, tu);
    
    wire signed [20:0]wu[0:20];
    wire signed [20:0] bf2;
    wire signed [20:0] bf3;
    
    assign wu[0] = d + tu;
    dffu du1 (tu, 0, clk, wu[1]);
    triStateBuffer t2 (wu[1], control, bf2);
    
    dffu du2 (wu[0], 0, clk, wu[2]);
    triStateBuffer t3 (wu[2], control, bf3);
    
    dffu du3 (bf2, set, clk, wu3);
    dffu du4 (bf3, 0, clk, wu4);
    // wu3 in place of wu[3], wu4 in place of wu[4]

    mux2 m2 (t, wu3, wu4, tempU);
    

    buffer1 bu2 (tempU, clk, u);
    buffer2 bu3 (tempU, clk, delayedU);
    
    wire signed [20:0]new;
    
    shifter suNew (v, 6, 1, new); 
    shifter su1 (v, 3, 1, wu[5]);
    shifter su2 (v, 4, 1, wu[6]);
    assign wu[7] = wu[5] + wu[6] + new;
    
   // shifter su3 (wu[7], 6, 0, wu[8]);
    dffu du5 (wu[7], 0, clk, wu[9]);
    wire signed [20:0] vq;
    dff1 duq (21'b0000_0000_0000_000_000_000, 0, clk, vq);
    assign wu[10] = wu[9] + 0;
    
    dffu du6 (wu[10], 0, clk, wu[11]);
    
    assign wu[12] =  wu[11] - u;
    assign wu[13] = wu[12];
    
    shifter su4 (wu[12], 6, 1, wu[14]);
    shifter su5 (wu[13], 8, 1, wu[15]);
    
    dffu du7 (wu[14], 0, clk, wu[16]);
    dffu du8 (wu[15], 0, clk, wu[17]);
    
    assign wu[18] = wu[16] + wu[17];
    
    shifter su6 (wu[18], 7, 1, wu[19]);
    dffu du9 (wu[19], 0, clk, wu[20]);
    
    assign xu = wu[20] + delayedU;

    
endmodule
