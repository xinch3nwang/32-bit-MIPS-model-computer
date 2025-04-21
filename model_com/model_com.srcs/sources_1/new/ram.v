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
        input clk,  //�洢��ʱ���źţ�������ʱ�� ram �ڲ�д������
        input ena,  //�洢����Ч�źţ��ߵ�ƽʱ�洢�������У�������� z
        input wena, //�洢����д��Ч�źţ��ߵ�ƽΪд��Ч���͵�ƽΪ����Ч����ena ͬʱ��Чʱ�ſɶԴ洢�����ж�д
        input [4:0] addr,       //�����ַ��ָ�����ݶ�д�ĵ�ַ
        input [31:0] data_in,   //�洢��д������ݣ��� clk ������ʱ��д��
        output [31:0] data_out  //�洢�����������ݣ�
    );

    reg [31:0] ram [31:0];

    always @(posedge clk)
    begin
        if (ena & wena)  // clk ena wena ͬʱ��Ч"д"
            ram[addr] <= data_in;
    end
    
	assign data_out = ( ena & ~wena) ? ram[addr] : 32'hz;  //ena�� wena�� ��
endmodule
