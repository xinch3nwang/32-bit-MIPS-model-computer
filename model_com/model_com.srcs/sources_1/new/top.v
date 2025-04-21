`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 12:11:18
// Design Name: 
// Module Name: top
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


module top(

    input start,

    input clk_m,//ram
    input wena,
    input ena,
    input [4:0]addr,
	output [31:0]data_out,     
//	input [4:0]R_Addr_A,
//	input [4:0]R_Addr_B,
//	input [4:0]W_Addr,
//	input Write_Reg,
	input reg_rst,
//	input clk,
	output [31:0]R_Data_A,
	output [31:0]R_Data_B,
	output [31:0]o_y,
	output [31:0]y,
    output [31:0]g,
//    input iromoe,
    output [31:0]dataRomOut,
//    input ldpc,
    input RST,
    input [31:0]pcin,
    output [31:0]pcout,
//    input immtoSignex,
    output [31:0]eximm,
//    input [31:0]inst_i,
    input ldir,
    output [31:0]inst_o,
//    input [31:0] inst,
    output [5:0]op,func,
    output [4:0]rs,
    output [4:0]rt,
    output [4:0]rd,sa,
    output [15:0]i_imm,

    output [4:0]miaddr,
    output [4:0]address,
    output [20:0]minst,
    output [3:0]m,
    output lddr1,lddr2,i_sel,immen,aluout_sel,RegClk_1,RegWr,iromoe,ldpc,rw_sel,addr_sel,
    
    input rst_n,
    input clk,
    output T1,T2,T3,T4
);
    
	ram ram(
		  .ena(ena),
		  .clk(clk_m), // input clka
		  .wena(wena), // input [0 : 0] wea
		  .addr(addr), // input [5 : 0] addra
		  .data_in(R_Data_B), // input [31 : 0] dina
		  .data_out(data_out) // output [31 : 0] douta
	);

	regfile regfile(
		.R_Addr_A(rs),
		.R_Addr_B(rt), 
		.W_Addr((rw_sel)?rt:rd), 
		.Write_Reg(RegWr),
		.W_Data(y), 
		.clk(RegClk_1&T2), 
		.rst(reg_rst), 
		.R_Data_A(R_Data_A), 
		.R_Data_B(R_Data_B)
	);
	
	select select1(
        .s(aluout_sel),
        .a(o_y),
        .b(data_out),
        .y(y)
	);
	 
	ALU ALU(
        .i_a(R_Data_A),
        .i_b(g),
        .lddr1(lddr1),
        .lddr2(lddr2),
        .alu_sel(m),
        .o_y(o_y)
	);
	 
	select select2(
	    .s(i_sel),
	    .a(R_Data_B),
	    .b(eximm),
	    .y(g)
	);
	 
	signex signex(
	    .a(i_imm),
	    .nDataToBus(immen),
	    .y(eximm)
	);
	 
	pc pc(
	    .LDPC(ldpc&T3),
        .RST(RST),
        .pcin(pcin),
        .pcout(pcout)
	);
	 
	 irom irom(
	     .address(pcout),
         .oe(iromoe|start),
         .dataRomOut(dataRomOut)
	 );

    ireg ireg(
        .inst_i(dataRomOut),
        .ldir(ldir&T1),
        .inst_o(inst_o)
    );
    
    controller controller(
        .inst(inst_o),
        .op(op),
        .func(func),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .sa(sa),
        .imm(i_imm),
        .miaddr(miaddr)
    );
    
    cm cm(
        .miaddr(miaddr),
        .address(address),
        .addr_sel(addr_sel),
        .minst(minst)
    );
    
    mireg mireg(
        .minst(minst),
        .m(m),
        .addr(address),
        .lddr1(lddr1),
        .lddr2(lddr2),
        .i_sel(i_sel),
        .imm(immen),
        .aluout_sel(aluout_sel),
        .RegClk_1(RegClk_1),
        .RegWr(RegWr),
        .iromoe(iromoe),
        .ldpc(ldpc),
        .rw_sel(rw_sel),
        .addr_sel(addr_sel)
    );
    
    circle_counter circle_counter(
        .rst_n(rst_n),
        .clk(clk),
        .T1(T1),
        .T2(T2),
        .T3(T3),
        .T4(T4)
    );
    
endmodule
