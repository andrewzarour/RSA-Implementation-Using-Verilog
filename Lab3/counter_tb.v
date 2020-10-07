`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 10:34:42 PM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb(

    );
    wire [3:0]count_tb;
    reg clk_tb;
    reg rst_tb;
    reg [4:0] mux_ctrl_tb;
    
    
    wire [15:0] LED_tb;
    
    counter U1 (
                .clk(clk_tb),
                .rst(rst_tb),
                .mux_ctrl(mux_ctrl_tb),
                
                .LED(LED_tb)
                );
               
    initial
    begin
        clk_tb = 1;
    end 
    
    always
      begin
      #5 clk_tb = ~clk_tb;
      end
      
    initial
      begin: TB_START
            mux_ctrl_tb = 5'b00000;
            rst_tb = 1'b1;
            
           #100
            rst_tb = 1'b0;
            mux_ctrl_tb <= 5'b00010;
           #1000
          $finish;
       end
    
endmodule
    
    

