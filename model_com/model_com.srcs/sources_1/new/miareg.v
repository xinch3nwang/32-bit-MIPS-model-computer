`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/02 00:27:31
// Design Name: 
// Module Name: miareg
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


module miareg(
    input [4:0]address,
    input [4:0]miaddr,
    input addr_sel,
    output [4:0]addr
    );
    assign addr=addr_sel?miaddr:address;
endmodule
