`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2023 11:02:23
// Design Name: 
// Module Name: 2x4decoder
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


module decoder_2_to_4(
    input a0,
    input a1,
    output d0,
    output d1,
    output d2,
    output d3
    );
               not(an0,a0),(an1,a1);
               and(d0,an0,an1),(d1,a0,an1),(d2,an0,a1),(d3,a0,a1);
endmodule


//Testbench code for 2-4 Decoder Structural/Gate Level Modelling

