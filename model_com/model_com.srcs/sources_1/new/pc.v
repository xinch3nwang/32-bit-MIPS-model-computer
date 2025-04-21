`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 12:03:48
// Design Name: 
// Module Name: pc
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


module pc(
    input wire LDPC,
    input wire RST,
    input wire [31:0]pcin,
    output reg [31:0]pcout    
);

    always @(posedge RST)
        if(RST == 1)
            pcout = 0;
    always @(posedge LDPC or posedge pcin)
        if(pcin!=0)
            pcout = pcin;
        else if(LDPC == 1)  
            pcout = pcout + 4;     
endmodule
