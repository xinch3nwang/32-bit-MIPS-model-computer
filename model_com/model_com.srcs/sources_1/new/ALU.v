`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 11:50:14
// Design Name: 
// Module Name: alu
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


module ALU(
    input [31:0] i_a,                  
    input [31:0] i_b,
    input lddr1,
    input lddr2,
    input [3:0] alu_sel,               
    output reg[31:0] o_y                         
    );
   
    reg[31:0] dr1,dr2;//alu_dr1&2
    always @(posedge lddr1)
    begin
         dr1 <= i_a;
    end
    always @(posedge lddr2)
    begin
         dr2 <= i_b;
    end
    
    always @(*) begin
        case (alu_sel)
                4'b0001:begin
                    o_y = i_a + i_b;
                end
                4'b0010:begin
                    o_y = dr1 - dr2;       
                end
                4'b0011:begin
                    o_y = dr1 + 1;
                end
                4'b0100:begin
                    o_y = dr1 - 1;
                end
                4'b0101:begin
                    o_y = dr1 & dr2;
                end
                4'b0110:begin
                    o_y = dr1 | dr2;
                end
                4'b0111:begin
                    o_y = dr1 ^ dr2;
                    end
                4'b1000:begin
                    o_y = ~dr1;
                end
                4'b1001:begin
                    o_y = dr1<<1;
                end
                4'b1010:begin
                    o_y = dr1>>1;
                end
                4'b1011:begin
                    o_y = dr1;
                end
                4'b1100:begin
                    o_y = ~(dr1 & dr2);
                end
                4'b1101:begin
                    o_y = ~(dr1 | dr2);
                end           
            default:
                begin
                    o_y <= 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
                end
        endcase              
    end
endmodule
