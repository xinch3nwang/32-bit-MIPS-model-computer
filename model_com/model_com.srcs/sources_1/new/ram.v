`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 11:59:10
// Design Name: 
// Module Name: ram
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


module ram(
        input clk,  //存储器时钟信号，上升沿时向 ram 内部写入数据
        input ena,  //存储器有效信号，高电平时存储器才运行，否则输出 z
        input wena, //存储器读写有效信号，高电平为写有效，低电平为读有效，与ena 同时有效时才可对存储器进行读写
        input [4:0] addr,       //输入地址，指定数据读写的地址
        input [31:0] data_in,   //存储器写入的数据，在 clk 上升沿时被写入
        output [31:0] data_out  //存储器读出的数据，
    );

    reg [31:0] ram [31:0];

    always @(posedge clk)
    begin
        if (ena & wena)  // clk ena wena 同时有效"写"
            ram[addr] <= data_in;
    end
    
	assign data_out = ( ena & ~wena) ? ram[addr] : 32'hz;  //ena高 wena低 读
endmodule
