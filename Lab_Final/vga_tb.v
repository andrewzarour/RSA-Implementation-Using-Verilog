`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 01:14:43 AM
// Design Name: 
// Module Name: vga_tb
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


module vga_tb(

    );
    
    reg clk, rst;
    reg [1:0] BP_R, BP_G, BP_B;
    wire hs, vs;
    wire [2:0] rgb;
    
    top U1 (
            .clk(clk),
            .rst(rst),
            .BP_R(BP_R),
            .BP_G(BP_G),
            .BP_B(BP_B),
            .vsync(vs),
            .hsync(hs),
            .text_rgb(rgb)
            );
    
    
    initial 
    begin
    clk <= 1;
    rst <= 1;
    BP_R <= 2'b00;
    BP_G <= 2'b00;
    BP_B <= 2'b00;
    
    #10
    rst <= 0;
    

    
    #10000000  $finish;
    end
 
    always begin 
    #20 clk = ~clk;
    end
endmodule
