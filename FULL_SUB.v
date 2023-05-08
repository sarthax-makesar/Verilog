`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 13:22:38
// Design Name: 
// Module Name: FULL_SUB
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


module FULL_SUB(a,b,bin,d,bout);
    input a,b,bin;
    output d,bout;
    assign d = a^b^bin;
    assign bout =(~a & b)|(~(a^b)& bin);
    
endmodule
