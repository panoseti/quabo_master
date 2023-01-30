#The following pblock definition was useful to get rid of timing violations associated with the fast reset
#  nets between the Elapsed Time counters (4-phase counters at 250MHz, thus 1ns reset paths).
#  When the triggers were remapped for the BGA version, these caused a placement problem.  But no timing errors cropped up.
#  If timing errors come back, we may need to revisit these
#create_pblock pblock_ctr_reset
#add_cells_to_pblock [get_pblocks pblock_ctr_reset] [get_cells -quiet [list base_mb_i/elapsed_time_gen_0/inst/counter_reset_1_reg base_mb_i/elapsed_time_gen_0/inst/counter_reset_2_reg base_mb_i/elapsed_time_gen_0/inst/counter_reset_3_reg]]
#resize_pblock [get_pblocks pblock_ctr_reset] -add {SLICE_X30Y39:SLICE_X31Y40}

#These constraints prevent some critical warnings from being issued during implementation
set_property IOB FALSE [get_cells base_mb_i/axi_quad_spi_0/U0/NO_DUAL_QUAD_MODE.QSPI_NORMAL/QSPI_LEGACY_MD_GEN.QSPI_CORE_INTERFACE_I/LOGIC_FOR_MD_0_GEN.SPI_MODULE_I/RATIO_NOT_EQUAL_4_GENERATE.SCK_O_NQ_4_NO_STARTUP_USED.SCK_O_NE_4_FDRE_INST]
set_property IOB FALSE [get_cells base_mb_i/axi_quad_spi_1/U0/NO_DUAL_QUAD_MODE.QSPI_NORMAL/QSPI_LEGACY_MD_GEN.QSPI_CORE_INTERFACE_I/LOGIC_FOR_MD_0_GEN.SPI_MODULE_I/RATIO_NOT_EQUAL_4_GENERATE.SCK_O_NQ_4_NO_STARTUP_USED.SCK_O_NE_4_FDRE_INST]















connect_debug_port u_ila_0/probe2 [get_nets [list {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[0]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[1]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[2]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[3]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[4]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[5]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[6]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[7]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[8]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[9]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[10]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[11]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[12]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[13]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[14]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[15]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[16]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[17]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[18]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[19]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[20]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[21]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[22]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[23]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[24]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[25]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[26]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[27]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[28]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[29]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[30]} {base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tdata[31]}]]
connect_debug_port u_ila_0/probe10 [get_nets [list base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tlast]]
connect_debug_port u_ila_0/probe12 [get_nets [list base_mb_i/ETH_CORE_CTRL_1/m_axis_txd_tvalid]]
connect_debug_port u_ila_0/probe26 [get_nets [list base_mb_i/ETH_CORE_CTRL_1/s_axis_txd_tready]]





create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list base_mb_i/clk_wiz_0/inst/clk_out250_0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 6 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {base_mb_i/maroc_dc_0/inst/USR_LOGIC/fullsum[0]} {base_mb_i/maroc_dc_0/inst/USR_LOGIC/fullsum[1]} {base_mb_i/maroc_dc_0/inst/USR_LOGIC/fullsum[2]} {base_mb_i/maroc_dc_0/inst/USR_LOGIC/fullsum[3]} {base_mb_i/maroc_dc_0/inst/USR_LOGIC/fullsum[4]} {base_mb_i/maroc_dc_0/inst/USR_LOGIC/fullsum[5]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_clk_out250_0]
