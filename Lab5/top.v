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
            output wire [6:0] SEG,
            output wire [7:0] AN,
            output wire dp
    );
         wire clk_div; 
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
