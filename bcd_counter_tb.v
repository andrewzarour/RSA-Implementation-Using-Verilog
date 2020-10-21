`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 10:56:41 PM
// Design Name: 
// Module Name: bcd_counter_tb
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


module bcd_counter_tb();
                    reg clk_tb;
                    reg rst_tb;
                    reg en_in_tb; 
                    reg upd_tb;
                    wire[3:0] op_tb;
                    wire en_out_tb;
    
        bcd_counter U1(
        .clk(clk_tb),
        .rst(rst_tb),
        .en_in(en_in_tb),
        .upd(upd_tb),
        .op(op_tb),
        .en_out(en_out_tb)
         );
        
        always begin
         #5 clk_tb= ~clk_tb;
         end  
         
         initial 
         begin: TB_START
         clk_tb<=1;
         rst_tb<=1;
         en_in_tb<=0;
         upd_tb<=1;
         
         #10
         rst_tb<=0;
         en_in_tb<=1;
         
         #20
         upd_tb<=0;
         #40
         $finish;
         end
         
         
endmodule
