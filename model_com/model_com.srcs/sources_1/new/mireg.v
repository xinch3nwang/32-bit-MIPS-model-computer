`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 12:08:52
// Design Name: 
// Module Name: mireg
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


module mireg(
    input [20:0]minst,
    output [3:0]m,
    output lddr1,lddr2,i_sel,imm,aluout_sel,RegClk_1,RegWr,iromoe,ldpc,rw_sel,addr_sel,
    output [4:0]addr
    );
    assign {m[0],m[1],m[2],m[3],lddr1,lddr2,i_sel,imm,aluout_sel,RegClk_1,RegWr,iromoe,ldpc,rw_sel,addr_sel,addr}=minst[19:0];
endmodule
