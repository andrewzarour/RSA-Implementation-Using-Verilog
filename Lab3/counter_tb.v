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
    
    reg clk_tb;
    reg rst_tb;
    reg [4:0] mux_ctrl_tb;
    wire [3:0] count_tb;
    
    wire [15:0] LED_tb;
    
    counter U1 (
                .clk(clk_tb),
                .rst(rst_tb),
                .mux_ctrl(mux_ctrl_tb),
                .count(count_tb),
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
            mux_ctrl_tb <= 4'b0000;
            rst_tb = 1;
            
           #10
            rst_tb = 0;
            mux_ctrl_tb <= 4'b1000;
           #100
        $finish;
       end
    
endmodule
    
    

