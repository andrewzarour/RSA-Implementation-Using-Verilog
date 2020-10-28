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
            input enable, 
            input upd,
            
            input loadTop,
            input [2:0] sel_,
            input [3:0] subs,
             
            output wire [6:0] SEG,
            output wire [7:0] AN,
            output wire dp
    );
         wire clk_div;
         //reg loadT = 0;
          wire [7:0] decoder_op_;
         
        
          
         clk_divider  GEN    (
                              .clk(clk),
                              .rst(rst),
                              .SW(SW), 
                              .clk_div(clk_div)
                              ); 
          
         wire [31:0] TMP;                 

         bcd_32  BCD    (
                          .clk(clk_div),
                          .rst(rst),
                          .en(enable),
                          .upd(upd),
                          .loadT(loadTop),
                          .sel_bcd(sel_),
                          .toreplace(subs),
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
