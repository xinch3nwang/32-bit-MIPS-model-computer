`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/01 14:10:58
// Design Name: 
// Module Name: sim_top
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


module sim_top();
    
	reg reg_rst;
	wire [31:0]R_Data_A;
	wire [31:0]R_Data_B;
    wire [31:0]g;	
	wire [31:0]o_y;

    wire [31:0]dataRomOut;
    
    reg RST;
    reg [31:0]pcin;
    wire [31:0]pcout;
    
    wire [31:0]eximm;
    
    reg ldir;
    wire [31:0]inst_o;
    
    wire [5:0]op,func;
    wire [4:0]rs,rt;
    wire [4:0]rd,sa;
    wire [15:0]i_imm;
    
    wire [4:0]address;
    wire [4:0]miaddr;
    wire [20:0]minst;
    
    wire [3:0]m;
    wire lddr1,lddr2;
    wire i_sel,immen,aluout_sel,RegClk_1,RegWr,iromoe,ldpc,rw_sel,addr_sel;
    
    reg rst_n;
    reg clk;
    wire T1,T2,T3,T4;
    
    reg start;
    
    reg clk_m;//ram
    reg wena;
    reg [4:0]addr;
    wire [31:0]y;
    reg ena;
    wire [31:0]data_out;
    
    
    top uut(
        .clk_m(clk_m),.wena(wena),.addr(addr),.reg_rst(reg_rst),.data_out(data_out),.R_Data_A(R_Data_A),.R_Data_B(R_Data_A),.y(y),.o_y(o_y),.g(g),
        .dataRomOut(dataRomOut),.RST(RST),.pcin(pcin),.pcout(pcout),.eximm(eximm),.ldir(ldir),.inst_o(inst_o),.rs(rs),.rt(rt),.rd(rd),.sa(sa),
         .i_imm(i_imm),.miaddr(miaddr),.minst(minst),.m(m),.lddr1(lddr1),.lddr2(lddr2),.i_sel(i_sel),.immen(immen),.aluout_sel(aluout_sel),
         .RegClk_1(RegClk_1),.RegWr(RegWr),.iromoe(iromoe),.ldpc(ldpc),.rw_sel(rw_sel),.op(op),.func(func),.addr_sel(addr_sel),.address(address),
          .rst_n(rst_n),.clk(clk),.T1(T1),.T2(T2),.T3(T3),.T4(T4)
    );

    initial begin
        rst_n=0;
        clk=0;
        RST=0;
        reg_rst=0;
        ldir=1;
        #50
        rst_n=1;
        RST=1;
        reg_rst=1;
        #50
        start=1;
        #50
        start=0;
//        #50
//        start=1;
//        #50
//        start=0;
    end
    always #25 clk <= ~clk;
endmodule
