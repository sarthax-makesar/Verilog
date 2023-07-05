`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sarthak Makesar
// 
// Create Date: 05.07.2023 12:30:07
// Design Name: 
// Module Name: jk_tb
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


module jk_tb();
reg clk, j, k;
wire q, qbar;
reg [1:0] dly;
integer i;

JK_flip_flop(q ,clk, j , k );

always #2 clk= ~clk;
initial 
begin
    clk =0;
    $display("clk = %b, q =%b, q_bar=%b", clk, q, q_bar);
    
    drive(2'b00);
    drive(2'b01);
    drive(2'b10);
    drive(2'b11);
    drive(2'b11);
    #5;
    $finish;
end
task drive( [1:0]ip);
    @(posedge clk);
    {j , k} = ip;
    #1 $display("j =%b, k =%b, q=%b, q_bar=%b",j, k, q, q_bar);
endtask
endmodule
