	sopc_system u0 (
		.clk_clk            (<connected-to-clk_clk>),            //         clk.clk
		.reset_reset_n      (<connected-to-reset_reset_n>),      //       reset.reset_n
		.sdram_dq_export    (<connected-to-sdram_dq_export>),    //    sdram_dq.export
		.sdram_addr_export  (<connected-to-sdram_addr_export>),  //  sdram_addr.export
		.sdram_cs_n_export  (<connected-to-sdram_cs_n_export>),  //  sdram_cs_n.export
		.sdram_we_n_export  (<connected-to-sdram_we_n_export>),  //  sdram_we_n.export
		.sdram_ba_export    (<connected-to-sdram_ba_export>),    //    sdram_ba.export
		.sdram_ras_n_export (<connected-to-sdram_ras_n_export>), // sdram_ras_n.export
		.sdram_cas_n_export (<connected-to-sdram_cas_n_export>), // sdram_cas_n.export
		.sdram_udqm_export  (<connected-to-sdram_udqm_export>),  //  sdram_udqm.export
		.sdram_ldaqm_export (<connected-to-sdram_ldaqm_export>), // sdram_ldaqm.export
		.sdram_cke_export   (<connected-to-sdram_cke_export>),   //   sdram_cke.export
		.sdram_clk_clk      (<connected-to-sdram_clk_clk>)       //   sdram_clk.clk
	);

