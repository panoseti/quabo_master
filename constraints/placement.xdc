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
connect_debug_port u_ila_0/clk [get_nets [list base_mb_i/clk_wiz_1/inst/clk_100]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[0]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[1]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[2]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[3]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[4]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[5]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[6]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[7]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[8]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[9]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[10]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[11]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[12]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[13]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[14]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[15]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[16]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[17]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[18]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[19]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[20]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[21]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[22]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[23]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[24]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[25]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[26]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[27]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[28]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[29]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[30]} {base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[0]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[1]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[2]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[3]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[4]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[5]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[6]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[7]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[8]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[9]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[10]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[11]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[12]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[13]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[14]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[15]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[16]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[17]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[18]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[19]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[20]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[21]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[22]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[23]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[24]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[25]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[26]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[27]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[28]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[29]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[30]} {base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[0]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[1]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[2]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[3]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[4]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[5]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[6]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[7]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[8]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[9]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[10]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[11]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[12]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[13]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[14]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[15]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[16]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[17]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[18]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[19]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[20]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[21]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[22]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[23]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[24]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[25]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[26]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[27]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[28]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[29]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[30]} {base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 28 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[0]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[1]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[2]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[3]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[4]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[5]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[6]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[7]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[8]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[9]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[10]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[11]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[12]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[13]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[14]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[15]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[16]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[17]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[18]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[19]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[20]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[21]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[22]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[23]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[24]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[25]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[26]} {base_mb_i/HighSpeed_PH_v1_0_0/inst/StateMachine0/hs_im_state_16[27]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list base_mb_i/AXI_Stream_Switch_3_1/m_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list base_mb_i/HighSpeed_PH_v1_0_0/inst/port_sel_16]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list base_mb_i/AXI_Stream_Switch_3_1/s0_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list base_mb_i/AXI_Stream_Switch_3_0/s0_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list base_mb_i/AXI_Stream_Switch_3_0/inst/s0_sending]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list base_mb_i/AXI_Stream_Switch_3_0/s1_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list base_mb_i/AXI_Stream_Switch_3_1/s1_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list base_mb_i/AXI_Stream_Switch_3_0/inst/s1_sending]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list base_mb_i/AXI_Stream_Switch_3_0/s2_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list base_mb_i/AXI_Stream_Switch_3_0/inst/s2_sending]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list base_mb_i/AXI_Stream_Switch_3_1/inst/s0_sending]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list base_mb_i/AXI_Stream_Switch_3_1/inst/s1_sending]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list base_mb_i/AXI_Stream_Switch_3_1/inst/s2_sending]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list base_mb_i/AXI_Stream_Switch_3_1/s0_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list base_mb_i/AXI_Stream_Switch_3_1/m_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list base_mb_i/AXI_Stream_Switch_3_1/s1_axis_tlast]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_clk_100]
