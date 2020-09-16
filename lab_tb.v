`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2020 05:49:54 PM
// Design Name: 
// Module Name: lab_tb
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


module lab_tb #(parameter SIZE_tb = 4)(

    );
    reg [SIZE_tb-1:0]inp1_tb;
    reg [SIZE_tb-1:0]inp2_tb;
    reg sw1_tb;
    reg sw2_tb;
    wire [SIZE_tb-1:0]LED;
    wire [SIZE_tb-1:0]LED2;
    
    mux #( .SIZE(SIZE_tb)) mux_tb
    (

     .inp1_(inp1_tb),
     .inp2_(inp2_tb),
     .sw1_(sw1_tb),
     .sw2_(sw2_tb),
     .LED_(LED),
     .LED2_(LED2)
    
    );
    
    initial
      begin: TB_START
            sw1_tb <= 1'b0;
            inp1_tb <= 4'hF;
            inp2_tb <= 4'h7;
            sw2_tb <= 1'b0;
           #10
            sw2_tb = 1'b1;
           #10
            sw1_tb = 1'b1;
           #100
        $finish;
       end

endmodule
