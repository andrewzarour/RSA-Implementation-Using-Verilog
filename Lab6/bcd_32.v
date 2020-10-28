`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 07:13:44 PM
// Design Name: 
// Module Name: bcd_32
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


module bcd_32(
                input clk,
                input rst,
                input en,
                input loadT,
                input upd,
                
                input [3:0]toreplace,
                input [2:0] sel_bcd,
                output wire [31:0] count
                );
               wire [7:0] tmp;
               wire [7:0]decoder_op;
            
            
                 demux UNIT1 (
                        .en(loadT),
                        .sel(sel_bcd),
                        .out(decoder_op)
                        );
               
               assign tmp[0] = en&(!loadT); 
               
               
               genvar i;
               
               
               generate 
               
               for (i = 0; i<8 ; i = i+1)
               begin 
               bcd_counter  UNIT  (
                                    .clk(clk),
                                    .rst(rst),
                                    .en_in(tmp[i]), 
                                    .upd(upd),
                                    .load(decoder_op[i]),
                                    .replace(toreplace),
                                    .op(count [4*(i+1)-1 : 4*i]),
                                    .en_out(tmp[i+1])
                                   ); 
             end 
             endgenerate
endmodule
