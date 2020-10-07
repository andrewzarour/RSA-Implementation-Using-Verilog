`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2020 02:02:23 PM
// Design Name: 
// Module Name: seven_seg_tb
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


module seven_seg_tb( );

  reg [3:0] SW_tb;
  reg clk_tb;
  reg rst_tb;
  wire [6:0] a_to_g_tb;
  wire [7:0] an_tb;
  wire dp_tb;
  
  ssd_gen U1(
            .SW(SW_tb),
            .clk(clk_tb),
            .rst(rst_tb),
            .a_to_g(a_to_g_tb),
            .an(an_tb),
            .dp(dp_tb)
            );
            
   initial
    begin
    clk_tb=1;
    end;
    
    always
    begin
    #5 clk_tb=~clk_tb;
    end
    
    initial
        begin
        #10 rst_tb=1;
        end
    initial
        begin:test1
       #0 SW_tb =0;
       #10 SW_tb=7;
       #15 SW_tb=9;
       
       #40
         $finish;
      end     
endmodule
