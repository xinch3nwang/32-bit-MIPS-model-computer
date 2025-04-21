`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 12:10:19
// Design Name: 
// Module Name: cm
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


module cm(
    input [4:0]miaddr,
    input [4:0]address,
    input addr_sel,
    output reg miareg,
    output [20:0]minst
    );

    reg [20:0]RomOut;
    
    always @(*)
        begin
                case((addr_sel)?miaddr:address)
//                    5'b00000:RomOut <= 20'b10001111011011011111;
//                    5'b00000:RomOut <= 20'b00000000000111100001;//addiu
                    5'b00000:RomOut <= 20'b10001111011111100001;//test
                    5'b00001:RomOut <= 20'b00001000011001000010;
                    5'b00010:RomOut <= 20'b00000111000001000011;
                    5'b00011:RomOut <= 20'b10000000011001011111;//addiu end
                    
                    5'b00100:RomOut <= 20'b00000000000110100101;//addu
                    5'b00101:RomOut <= 20'b00001000011000000110;
                    5'b00110:RomOut <= 20'b00000100000000000111;
                    5'b00111:RomOut <= 20'b10000000011000011111;//addu end
                    
                    5'b01000:RomOut <= 20'b00000000000110101001;//and
                    5'b01001:RomOut <= 20'b00001000011000001010;
                    5'b01010:RomOut <= 20'b00000100000000001011;                   
                    5'b01011:RomOut <= 20'b10100000011000011111;//and end
                    
                    5'b01100:RomOut <= 20'b00000000000110101101;//or
                    5'b01101:RomOut <= 20'b00001000011000001110;
                    5'b01110:RomOut <= 20'b00000100000000001111;
                    5'b01111:RomOut <= 20'b01100000011000011111;//or end
                    
                    default: RomOut <= 20'h0;          
                endcase  
        end
    assign minst=RomOut;
endmodule