`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2023 11:37:01
// Design Name: 
// Module Name: Ex_OR
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


module Ex_OR(a , b ,z);
    input a,b;
    output z;
    wire  abar,bbar, z1and, z2and;
    
    assign #1 abar = ~a;
    assign #1 bbar = ~b;
    assign #5 z1and = (a&bbar);
    assign #5 z2and = (b&abar);
    assign #4 z = (z1and& z2and);
endmodule
