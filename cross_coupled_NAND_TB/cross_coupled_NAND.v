`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2023 10:46:53
// Design Name: 
// Module Name: cross_coupled_NAND
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


module cross_coupled_NAND_TB(Q ,Qbar,R, S);
    output Q, Qbar;
    input R,S;
    
    nand #1 (Q, R, Qbar);
    nand #1 (Qbar, S, Q);
    
endmodule
