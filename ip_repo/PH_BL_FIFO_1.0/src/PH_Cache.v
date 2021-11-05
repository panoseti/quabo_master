`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PANOSETI Team
// Engineer: Wei Liu
// 
// Create Date: 10/19/2021 07:04:37 PM
// Design Name: 
// Module Name: PH_Cache
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


module PH_Cache(
    input clk,
    input rst,
    // ports connected to maroc_dc core
	input wire[31:0]axi_str_rxd_tdata,
    input wire axi_str_rxd_tlast,
    input wire axi_str_rxd_tvalid,
    output wire axi_str_rxd_tready,
    // control sigianl for writing ph data into the bram 
    input axi_cache_read,
    input axi_cache_sel,
    input [7:0] axi_cache_raddr,
    output [15:0] axi_cache_data,
    //signal between ph_cache and ph_bl
    output ph_cache_valid,    //it means the last seriel ph_data is stored in the ph_cache
    input ph_cache_enb,
    input [7:0] ph_cache_raddr,
    output [15:0] ph_cache_data
    );
    
wire ph_valid;
wire ph_last;
wire [31:0] ph_data;
assign ph_valid = axi_str_rxd_tvalid;
assign ph_last = axi_str_rxd_tlast;
assign ph_data = axi_str_rxd_tdata;

//when microbalze core is reading data from ph_cache, PH_BL shouldn't be able to get ph data from ph_cache
assign ph_cache_valid = ~axi_cache_read & ph_valid;

reg ph_valid_d1;
reg ph_last_d1;
reg [31:0] ph_data_d1;
always @(posedge clk)
begin
    if(rst)
        begin
            ph_valid_d1 <= 0;
            ph_last_d1  <= 0;
            ph_data_d1  <= 0;
        end
    else
        begin
            ph_valid_d1 <= ph_valid;
            ph_last_d1  <= ph_last;
            ph_data_d1  <= ph_data;
        end
end

parameter integer ADC_LANTENCE_VAL = 20;
parameter [4:0] IDLE = 5'b00000,
                ADC_LATENCE = 5'b00001,
                PRE_PH_DATA = 5'b00010,
                GET_PH_DATA = 5'b00100,
                GET_PH_LAST = 5'b01000,
                AXI_CTL     = 5'b10000;
                
reg [1:0] ph_state;
reg [1:0] next_state;

reg [8:0]ph_cnt; //This is a counter for ph_data
reg ph_cache0_ena;
reg ph_cache0_wea;
reg [7:0] ph_cache0_addr;
reg ph_cache1_ena;
reg ph_cache1_wea;
reg [7:0] ph_cache1_addr;
reg ph_cache_sel;
always @(posedge clk)
begin
    if(rst)
        ph_state <= IDLE;
    else
        ph_state <= next_state;
end

always @(ph_state or ph_valid or ph_cnt or ph_cache0_addr or ph_cache1_addr)
begin
    if(rst)
        next_state <= IDLE;
    else
        begin
            case(ph_state)
                IDLE:
                    begin
                        if(axi_cache_read == 1)
                            next_state = AXI_CTL;
                        else if((ph_valid == 1) && (ph_valid == 0)) // valid signal is the trigger for the state machine
                            next_state = ADC_LATENCE;
                        else
                            next_state = IDLE;
                     end
                ADC_LATENCE:
                    begin
                        if(ph_cnt == ADC_LANTENCE_VAL - 5)
                            next_state = PRE_PH_DATA;
                        else
                            next_state = ADC_LATENCE;
                    end
                PRE_PH_DATA:
                    begin
                        next_state = GET_PH_DATA;
                    end
                GET_PH_DATA:
                    begin
                        if((ph_cache0_addr == 253) || (ph_cache0_addr == 253)) 
                            next_state = GET_PH_LAST;
                        else
                            next_state = GET_PH_DATA;
                    end
                GET_PH_LAST:
                    begin
                        next_state = IDLE;
                    end
                AXI_CTL:
                    begin
                        if(axi_cache_read == 1)
                            next_state = AXI_CTL;
                        else
                            next_state = IDLE;
                    end
                default:
                    next_state = IDLE;
              endcase
        end
end

always @(posedge clk)
begin
    if(rst)
        begin
            ph_cnt          <= 0;
            ph_cache0_ena   <= 0;
            ph_cache0_wea   <= 0;
            ph_cache0_addr  <= 0;
            ph_cache1_ena   <= 0;
            ph_cache1_wea   <= 0;
            ph_cache1_addr  <= 0;
            ph_cache_sel    <= 0;
        end
     else 
        begin
            case(ph_state)
                IDLE:
                    begin
                        ph_cnt          <= 0;
                        ph_cache0_ena   <= 0;
                        ph_cache0_wea   <= 0;
                        ph_cache0_addr  <= 0;
                        ph_cache1_ena   <= 0;
                        ph_cache1_wea   <= 0;
                        ph_cache1_addr  <= 0;
                        ph_cache_sel    <= ph_cache_sel;
                    end
                ADC_LANTENCE_VAL:
                    begin
                        ph_cnt          <= ph_cnt + 1;
                        ph_cache0_ena   <= 0;
                        ph_cache0_wea   <= 0;
                        ph_cache0_addr  <= 0;
                        ph_cache1_ena   <= 0;
                        ph_cache1_wea   <= 0;
                        ph_cache1_addr  <= 0;
                        ph_cache_sel    <= ~ph_cache_sel;
                    end
                PRE_PH_DATA:
                    begin
                        ph_cnt          <= 1;           //It looks weird here, but it's correct. THis is from the timing diagram.
                        if(ph_cache_sel == 1)
                            begin
                                ph_cache0_ena   <= 1;
                                ph_cache1_ena   <= 0;
                            end
                        else
                            begin
                                ph_cache0_ena   <= 0;
                                ph_cache1_ena   <= 1;
                            end
                        ph_cache0_addr  <= 0;
                        ph_cache1_addr  <= 0;
                        ph_cache0_wea   <= 1;           //1 = W; 0 = R.
                        ph_cache1_wea   <= 1;
                        ph_cache_sel    <= ph_cache_sel;
                    end
                GET_PH_DATA:
                    begin
                        ph_cnt          <= ph_cnt + 1;
                        if(ph_cache_sel == 1)
                            begin
                                ph_cache0_ena   <= ~ph_cnt[1];
                                ph_cache1_ena   <= 0;
                            end
                        else
                            begin
                                ph_cache0_ena   <= 0;
                                ph_cache1_ena   <= ~ph_cnt[1];
                            end
                        if(ph_cache0_ena == 1)
                             ph_cache0_addr     <= ph_cache0_addr + 1;
                        else
                             ph_cache0_addr     <= 0;
                        if(ph_cache1_ena == 1)
                             ph_cache1_addr     <= ph_cache1_addr + 1;
                        else
                             ph_cache1_addr     <= 0;
                        ph_cache0_wea   <= 1;           //1 = W; 0 = R.
                        ph_cache1_wea   <= 1;
                        ph_cache_sel    <= ph_cache_sel;
                        
                    end
                 GET_PH_LAST:
                    begin
                        ph_cnt          <= ph_cnt + 1;
                        if(ph_cache_sel == 1)
                            begin
                                ph_cache0_ena   <= ~ph_cnt[1];
                                ph_cache1_ena   <= 0;
                            end
                        else
                            begin
                                ph_cache0_ena   <= 0;
                                ph_cache1_ena   <= ~ph_cnt[1];
                            end
                        if(ph_cache0_ena == 1)
                             ph_cache0_addr     <= ph_cache0_addr + 1;
                        else
                             ph_cache0_addr     <= 0;
                        if(ph_cache1_ena == 1)
                             ph_cache1_addr     <= ph_cache1_addr + 1;
                        else
                             ph_cache1_addr     <= 0;
                        ph_cache0_wea   <= 1;           //1 = W; 0 = R.
                        ph_cache1_wea   <= 1;
                        ph_cache_sel    <= ~ph_cache_sel; //this is the only difference between GET_PH_DATA and GET_PH_LAST
                        
                    end
                 AXI_CTL:
                    begin
                        ph_cnt          <= 0;
                        ph_cache_sel    <= ph_cache_sel;
                        ph_cache0_ena   <= 1;           // Both of the BRAMs are enable for reading, axi_cache_sel will be used for the selection of output data
                        ph_cache1_ena   <= 1;
                        ph_cache0_wea   <= 0;
                        ph_cache1_wea   <= 0;
                        ph_cache0_addr  <= axi_cache_raddr;
                        ph_cache1_addr  <= axi_cache_raddr;
                    end
                 default:
                    begin
                        ph_cnt          <= 0;
                        ph_cache0_ena   <= 0;
                        ph_cache0_wea   <= 0;
                        ph_cache0_addr  <= 0;
                        ph_cache1_ena   <= 0;
                        ph_cache1_wea   <= 0;
                        ph_cache1_addr  <= 0;
                        ph_cache_sel    <= 0;
                    end
            endcase
        end
end

wire [15:0] ph_cache0_data, ph_cache1_data;
wire [15:0] axi_cache0_data;
ph_bram ph_cache0 (
  .clka(clk),                       // input wire clka
  .rsta(rst),                       // input wire rsta
  .ena(ph_cache0_ena),              // input wire ena
  .wea(ph_cache0_wea),              // input wire [0 : 0] wea
  .addra(ph_cache0_addr),           // input wire [7 : 0] addra
  .dina(ph_data_d1),                // input wire [15 : 0] dina
  .douta(axi_cache0_data),          // output wire [15 : 0] douta
  .clkb(clk),                       // input wire clkb
  .rstb(rst),                       // input wire rstb
  .enb(ph_cache_enb),               // input wire enb
  .web(1'b0),                       // input wire [0 : 0] web 1: w; 0: r
  .addrb(ph_cache_raddr),           // input wire [7 : 0] addrb
  .dinb(32'b0),                     // input wire [15 : 0] dinb
  .doutb(ph_cache0_data)            // output wire [15 : 0] doutb
);

wire [15:0] axi_cache1_data;
ph_bram ph_cache1 (
  .clka(clk),                       // input wire clka
  .rsta(rst),                       // input wire rsta
  .ena(ph_cache1_ena),              // input wire ena
  .wea(ph_cache1_wea),              // input wire [0 : 0] wea
  .addra(ph_cache1_addr),           // input wire [7 : 0] addra
  .dina(ph_data_d1),                // input wire [15 : 0] dina
  .douta(axi_cache1_data),          // output wire [15 : 0] douta
  .clkb(clk),                       // input wire clkb
  .rstb(rst),                       // input wire rstb
  .enb(ph_cache_enb),               // input wire enb
  .web(1'b0),                       // input wire [0 : 0] web
  .addrb(ph_cache_raddr),           // input wire [7 : 0] addrb
  .dinb(32'b0),                     // input wire [15 : 0] dinb
  .doutb(ph_cache1_data)            // output wire [15 : 0] doutb
);

assign ph_cache_data = (ph_cache_sel)?ph_cache1_data:ph_cache0_data;

assign axi_cache_data = (axi_cache_sel)?axi_cache1_data:axi_cache0_data;

endmodule
