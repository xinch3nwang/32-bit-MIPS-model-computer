`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 12:09:40
// Design Name: 
// Module Name: controller
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


module controller(
    input wire[31:0] inst,
    output wire[5:0] op,func,
	output wire[4:0] rs,rt,
	output reg[4:0] rd,sa,
	output reg[15:0] imm,
	output reg[4:0] miaddr
	);

	assign op = inst[31:26];
	assign rs = inst[25:21];
	assign rt = inst[20:16];
	assign func = inst[5:0];

    always @(*)
        begin
            case(op)
               6'b000000: rd <= inst[15:11];//r
               6'b001001:imm <= inst[15:0];//i
            endcase

            case(op)
                6'b000000:case(func)
                            6'b100001:miaddr <= 5'b00100;//addu
                            6'b100100:miaddr <= 5'b01000;//and
                            6'b100101:miaddr <= 5'b01100;//or
                            default: miaddr <= 5'bzzzzz;       
                        endcase
               6'b001001:miaddr <= 5'b00000;
               default: miaddr <= 5'bzzzzz;   
            endcase
        end
endmodule
