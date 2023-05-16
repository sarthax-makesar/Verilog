`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2023 12:05:53
// Design Name: 
// Module Name: magnitude_comparator_8bit
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


module magnitude_comparator_8bit(A, B, AgtB, AeqB, AltB);
parameter BUS=8;
parameter EQ_DELAY = 5, LT_DELAY=8, GT_DELAY=8;
input [1:BUS] A,B;
output AgtB, AeqB, AltB;

assign #EQ_DELAY  AeqB = A==B;
assign #GT_DELAY  AgtB = A>B;
assign #LT_DELAY  AltB = A<B;
endmodule
