
module sopc_system (
	clk_clk,
	reset_reset_n,
	sdram_dq_export,
	sdram_addr_export,
	sdram_cs_n_export,
	sdram_we_n_export,
	sdram_ba_export,
	sdram_ras_n_export,
	sdram_cas_n_export,
	sdram_udqm_export,
	sdram_ldaqm_export,
	sdram_cke_export,
	sdram_clk_clk);	

	input		clk_clk;
	input		reset_reset_n;
	inout	[15:0]	sdram_dq_export;
	output	[12:0]	sdram_addr_export;
	output		sdram_cs_n_export;
	output		sdram_we_n_export;
	output	[1:0]	sdram_ba_export;
	output		sdram_ras_n_export;
	output		sdram_cas_n_export;
	output		sdram_udqm_export;
	output		sdram_ldaqm_export;
	output		sdram_cke_export;
	output		sdram_clk_clk;
endmodule
