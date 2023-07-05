`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:Sarthak Makesar
// 
// Create Date: 05.07.2023 12:11:09
// Design Name: 
// Module Name: JK_flip_flop
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


primitive JK_flip_flop(q ,clk, j , k );

output  q;

input clk ,j ,k;

table
    //clk  J   K   Q   Q_bar
        1   0   0 :  0;  //:  1;
        1   0   1 :  1; //:  0;
        1   1   0 :  0; //:  1;
        1   1   1 :  0; //:  1;       //toggle
        1   1   1 :  1; //:  0;       //toggle
endtable
endprimitive
