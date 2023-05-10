`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 10:45:20
// Design Name: 
// Module Name: FA_Seq
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


module FA_Seq(A,B,Cin, Sum, Cout);
    input A,B,Cin;
    output Sum, Cout;
    reg Sum, Cout;
    reg T1,T2,T3;
    always
        @(A or B or Cin) begin
            Sum = (A^B)^Cin;
            T1 = A & Cin;
            T2 = B & Cin;
            T3 = A & B ;
            Cout = (T1|T2)|T3;
        end
endmodule
