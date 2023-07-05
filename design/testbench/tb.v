`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sarthak Makesar 
// 
// Create Date: 05.07.2023 11:52:00
// Design Name: 
// Module Name: tb
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


module tb( );
    reg clk, t;
    reg [1:0] dly;
    wire q;
    integer i;
    
t_flip_flop( q, clk,t);

always #10  clk= ~clk;
initial 
begin
    clk =0;
    $monitor("T=%t, clk=%b, t = %b, q =%b, q_bar= %b", $time, clk, t ,q ,q_bar);
    #10;

    for(i=0; i<20;i =i+1) 
        begin
        dly= $random;
        repeat(dly)@ (posedge clk);
        t<=$random;
    end
    #20 $finish;
end
endmodule
