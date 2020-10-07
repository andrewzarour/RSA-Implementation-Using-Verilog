`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2020 08:17:06 PM
// Design Name: 
// Module Name: counter_seg_tb
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


module counter_seg_tb(

    );
    reg clk_tb;
    reg rst_tb;
    reg [4:0] mux_ctrl_tb;
    wire [6:0] segment_tb;
    wire [7:0] an_tb;
    wire dp_tb;
    wire [3:0] count1;
    
    counter U1 (
                .clk(clk_tb),
                .rst(rst_tb),
                .mux_ctrl(mux_ctrl_tb),
                .SEG(segment_tb),
                .AN(an_tb),
                .dp(dp_tb),
                .count(count1)
                );
                
    initial
      begin
        clk_tb <= 1;
      end
      
    always
      begin
        #5 clk_tb = ~clk_tb;
      end
      
    initial
      begin
         rst_tb <= 1;
         mux_ctrl_tb <= 5'b00000;
        #10
         rst_tb <= 0;
        
        #10
         mux_ctrl_tb <= 5'b00001;
   
        #100000
      $finish;  
      end
endmodule
