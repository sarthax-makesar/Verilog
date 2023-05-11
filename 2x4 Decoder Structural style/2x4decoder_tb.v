`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2023 11:04:21
// Design Name: 
// Module Name: 2x4decoder_tb
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


module decoder_2_to_4_tb;
    reg a0, a1;
    wire d0 ,d1,d2,d3;
    decoder_2_to_4 DC(a0,a1,d0,d1,d2,d3);
initial begin
// Initialize Inputs
a0 = 0;a1 = 0;
// Wait 100 ns for global reset to finish
#100;
// Add stimulus here
#100; a0=1;a1=0;
#100; a0=0;a1=1;
#100; a0=1;a1=1;

end

endmodule
