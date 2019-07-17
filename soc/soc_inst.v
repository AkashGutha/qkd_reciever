	soc u0 (
		.clk_clk            (<connected-to-clk_clk>),            //     clk.clk
		.mem1_s1_address    (<connected-to-mem1_s1_address>),    // mem1_s1.address
		.mem1_s1_clken      (<connected-to-mem1_s1_clken>),      //        .clken
		.mem1_s1_chipselect (<connected-to-mem1_s1_chipselect>), //        .chipselect
		.mem1_s1_write      (<connected-to-mem1_s1_write>),      //        .write
		.mem1_s1_readdata   (<connected-to-mem1_s1_readdata>),   //        .readdata
		.mem1_s1_writedata  (<connected-to-mem1_s1_writedata>),  //        .writedata
		.mem1_s1_byteenable (<connected-to-mem1_s1_byteenable>), //        .byteenable
		.mem2_s1_address    (<connected-to-mem2_s1_address>),    // mem2_s1.address
		.mem2_s1_clken      (<connected-to-mem2_s1_clken>),      //        .clken
		.mem2_s1_chipselect (<connected-to-mem2_s1_chipselect>), //        .chipselect
		.mem2_s1_write      (<connected-to-mem2_s1_write>),      //        .write
		.mem2_s1_readdata   (<connected-to-mem2_s1_readdata>),   //        .readdata
		.mem2_s1_writedata  (<connected-to-mem2_s1_writedata>),  //        .writedata
		.mem2_s1_byteenable (<connected-to-mem2_s1_byteenable>), //        .byteenable
		.memory_mem_a       (<connected-to-memory_mem_a>),       //  memory.mem_a
		.memory_mem_ba      (<connected-to-memory_mem_ba>),      //        .mem_ba
		.memory_mem_ck      (<connected-to-memory_mem_ck>),      //        .mem_ck
		.memory_mem_ck_n    (<connected-to-memory_mem_ck_n>),    //        .mem_ck_n
		.memory_mem_cke     (<connected-to-memory_mem_cke>),     //        .mem_cke
		.memory_mem_cs_n    (<connected-to-memory_mem_cs_n>),    //        .mem_cs_n
		.memory_mem_ras_n   (<connected-to-memory_mem_ras_n>),   //        .mem_ras_n
		.memory_mem_cas_n   (<connected-to-memory_mem_cas_n>),   //        .mem_cas_n
		.memory_mem_we_n    (<connected-to-memory_mem_we_n>),    //        .mem_we_n
		.memory_mem_reset_n (<connected-to-memory_mem_reset_n>), //        .mem_reset_n
		.memory_mem_dq      (<connected-to-memory_mem_dq>),      //        .mem_dq
		.memory_mem_dqs     (<connected-to-memory_mem_dqs>),     //        .mem_dqs
		.memory_mem_dqs_n   (<connected-to-memory_mem_dqs_n>),   //        .mem_dqs_n
		.memory_mem_odt     (<connected-to-memory_mem_odt>),     //        .mem_odt
		.memory_mem_dm      (<connected-to-memory_mem_dm>),      //        .mem_dm
		.memory_oct_rzqin   (<connected-to-memory_oct_rzqin>),   //        .oct_rzqin
		.reset_reset_n      (<connected-to-reset_reset_n>)       //   reset.reset_n
	);

