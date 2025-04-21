`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 12:04:50
// Design Name: 
// Module Name: irom
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


module irom(address,oe,dataRomOut);
    input [31:0]address;//地址
    input oe;//oe 为输出允许
    output  [31:0]dataRomOut;//数据输出
    reg [31:0]RomOut;
    always @(*)
        begin
//            if (oe)
                case(address[6:2])
                    5'b00000:RomOut <= 32'b00100100000010000000000000011110;
                    5'b00001:RomOut <= 32'b00100101000010000000000000110010;
                    5'b00010:RomOut <= 32'b00100101000010000000000000110010;
                    default: RomOut <= 32'b0;          
                endcase
//            else RomOut <= 32'hzz;       
        end
        assign dataRomOut=RomOut;
endmodule
