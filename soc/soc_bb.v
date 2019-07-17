
module soc (
	clk_clk,
	mem1_s1_address,
	mem1_s1_clken,
	mem1_s1_chipselect,
	mem1_s1_write,
	mem1_s1_readdata,
	mem1_s1_writedata,
	mem1_s1_byteenable,
	mem2_s1_address,
	mem2_s1_clken,
	mem2_s1_chipselect,
	mem2_s1_write,
	mem2_s1_readdata,
	mem2_s1_writedata,
	mem2_s1_byteenable,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	reset_reset_n);	

	input		clk_clk;
	input	[10:0]	mem1_s1_address;
	input		mem1_s1_clken;
	input		mem1_s1_chipselect;
	input		mem1_s1_write;
	output	[15:0]	mem1_s1_readdata;
	input	[15:0]	mem1_s1_writedata;
	input	[1:0]	mem1_s1_byteenable;
	input	[10:0]	mem2_s1_address;
	input		mem2_s1_clken;
	input		mem2_s1_chipselect;
	input		mem2_s1_write;
	output	[15:0]	mem2_s1_readdata;
	input	[15:0]	mem2_s1_writedata;
	input	[1:0]	mem2_s1_byteenable;
	output	[14:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[31:0]	memory_mem_dq;
	inout	[3:0]	memory_mem_dqs;
	inout	[3:0]	memory_mem_dqs_n;
	output		memory_mem_odt;
	output	[3:0]	memory_mem_dm;
	input		memory_oct_rzqin;
	input		reset_reset_n;
endmodule
