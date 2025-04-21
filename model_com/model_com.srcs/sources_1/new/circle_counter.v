`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/02 12:52:24
// Design Name: 
// Module Name: circle_counter
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


module circle_counter(rst_n, clk, T1,T2,T3,T4 ); 
    input rst_n;
    input clk;
    output T1,T2,T3,T4;
    reg [3 : 0] TT;
    always@(posedge clk)
        if(!rst_n)
            TT <= 4'b0001;
        else
            TT <= {TT[0],TT[3 : 1]};
    assign T1 = TT[3];
    assign T2 = TT[2];
    assign T3 = TT[1];
    assign T4 = TT[0];
endmodule
