`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2020 10:22:50 PM
// Design Name: 
// Module Name: lab2_tb
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


module lab2_tb #(parameter SIZE_tb = 16)(

    );
    
    reg [SIZE_tb-1:0]inpA_tb;
    reg load_tb;
    reg clr_tb;
    reg sub_tb;
    reg clk_tb;
    wire [SIZE_tb-1:0]LED_tb;
    wire [SIZE_tb-1:0]k1_tb;
    wire [SIZE_tb-1:0]k2_tb;
    
    lab2 #( .SIZE(SIZE_tb)) mux_tb
    (
     .inpA(inpA_tb),
     .load(load_tb),
     .clr(clr_tb),
     .clk(clk_tb),
     .sub(sub_tb),
     .LED(LED_tb),
     .k1(k1_tb),
     .k2(k2_tb)

    );
    
    initial
      begin: TB_START
            inpA_tb <= 4'b0111;
            load_tb <= 1'b0;
            sub_tb <= 1'b0;
            clr_tb <= 1'b0;
            clk_tb <= 1;
           #10
            load_tb <= 1'b1;
           #10
            load_tb <= 1'b0;
           #10
            inpA_tb <= 4'h2;
           #10
            sub_tb <= 1;
           #100
        $finish;
       end
    always
      #5 clk_tb = ~clk_tb;
endmodule
