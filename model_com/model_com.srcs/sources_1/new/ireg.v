`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 12:05:22
// Design Name: 
// Module Name: ireg
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


module ireg(inst_i,ldir,inst_o);
    input [31:0]inst_i;
    input ldir;
    output reg [31:0]inst_o;
    
    always @(posedge ldir)begin
        inst_o<=inst_i;
    end
endmodule
