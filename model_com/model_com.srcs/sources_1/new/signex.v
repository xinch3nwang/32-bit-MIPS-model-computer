`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 12:03:08
// Design Name: 
// Module Name: signex
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


module signex (
    input  [15:0] a,
    input nDataToBus,
    output [31:0] y
);
    assign y= (nDataToBus)? {{16{a[15]}}, a} : 31'bz;
endmodule
