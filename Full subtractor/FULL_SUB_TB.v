`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 13:28:06
// Design Name: 
// Module Name: FULL_SUB_TB
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


module FULL_SUB_TB;
    reg a, b, bin;
    wire d, bout;
  
    FULL_SUB fs(a, b, bin, d, bout);
  
initial begin
  $monitor("At time %0t: a=%b b=%b, bin=%b, difference=%b, borrow=%b",$time, a,b,bin,d,bout);
    a = 0; b = 0; bin = 0; #1;
    a = 0; b = 0; bin = 1; #1;
    a = 0; b = 1; bin = 0; #1;
    a = 0; b = 1; bin = 1; #1;
    a = 1; b = 0; bin = 0; #1;
    a = 1; b = 0; bin = 1; #1;
    a = 1; b = 1; bin = 0; #1;
    a = 1; b = 1; bin = 1;
  end
endmodule
  
