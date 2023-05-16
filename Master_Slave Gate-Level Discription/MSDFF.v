`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2023 12:16:30
// Design Name: 
// Module Name: MSDFF
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


module MSDFF(D, C, Q, Qbar);
input D, C;
output Q, Qbar ;

not 
    NT1(NotD, D),
    NT2(NotC, C),
    NT3(NotY,Y);
    
nand 
    ND1(D1,D,C),
    ND2(D2, C ,NotD),
    ND3(Y, D1, Ybar),
    ND4(Ybar, Y ,D2),
    ND5(Y1,Y,NotC),
    ND6(Y2, NotY,NotC),
    ND7(Q, Qbar, Y1),
    ND8(Qbar,Y2,Q);
    
endmodule
