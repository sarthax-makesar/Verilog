`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sarthak Makesar
// 
// Create Date: 10.05.2023 10:22:28
// Design Name: 
// Module Name: cross_coupled_NAND_TB
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
module TEST;
    reg TS,TR;
    wire TQ, TQb;
    cross_coupled_NAND_TB NSTA(.Q(TQ),.S(TS),.R(TR),.Qbar(TQb));
    initial
        begin
            TR = 0;
            TS = 0;
            #5 TS = 1 ;
            #5 TS = 0;
            TR = 0;
            #5 TS=0;
            #5 TR = 1;
        end
        initial 
            $monitor("At time %t,",$time,"TR=%b,TS=%b,TQ =%b TQb= %b", TR, TS, TQ , TQb);
endmodule
           
        