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
                input upd,
                output wire [31:0] count
                );
               wire [7:0] tmp; 
               
               assign tmp[0] = en; 
               
               genvar i;
               
               
               generate 
               
               for (i = 0; i<8 ; i = i+1)
               begin 
               bcd_counter  UNIT  (
                                    .clk(clk),
                                    .rst(rst),
                                    .en_in(tmp[i]), 
                                    .upd(upd),
                                    .op(count [4*(i+1)-1 : 4*i]),
                                    .en_out(tmp[i+1])
                                   ); 
             end 
             endgenerate    
endmodule
