`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:    Sarthak Makesar 
// 
// Create Date: 05.07.2023 11:37:55
// Design Name: 
// Module Name: t_flip_flop
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


primitive t_flip_flop( q, clk,t);
output reg q;

input t;
input clk;
    
table 
    // clk  t  q  q_bar
    (01) 0 : 0: 0;
    (01) 0 : 1: 1;
    (0?) 1 : 0: 1;
    (0?) 1 : 1: 0;
    
endtable
     
endprimitive
