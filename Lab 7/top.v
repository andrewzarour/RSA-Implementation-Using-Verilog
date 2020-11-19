`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2020 06:33:47 PM
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
            input clk,
            input rst,
            input [4:0] SW, 
            input [3:0] data,
            input [2:0] sel,
            input rd_enable,
            input wr_enable,
            input upd, 
            output wire [6:0] SEG,
            output wire [7:0] AN,
            output wire dp
    );
         wire clk_div;
         wire enable; 
         clk_divider  GEN    (
                              .clk(clk),
                              .rst(rst),
                              .SW(SW), 
                              .clk_div(clk_div)
                              ); 
          
         wire [31:0] TMP;
         
        seq_system SYS (
                    .clk(clk),
                    .clk_div(clk_div),
                    .rst(rst),
                    .INP(data),
                    .WR_EN(wr_enable),
                    .RD_EN(rd_enable),
                    .main_ptr(sel),
                    .end_OP(enable)
                );                  

         bcd_32  BCD    (
                          .clk(clk_div),
                          .rst(rst),
                          .en(enable),
                          .upd(upd),
                          .count(TMP)
                          );
                          
         ssd_gen   SSD   (
                           .SW(TMP),
                           .clk(clk),
                           .rst(rst),
                           .a_to_g(SEG),
                           .an(AN),
                           .dp(dp)
                          );                 
          
endmodule
