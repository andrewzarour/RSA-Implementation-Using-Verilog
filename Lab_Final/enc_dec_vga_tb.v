`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 12:09:09 AM
// Design Name: 
// Module Name: enc_dec_vga_tb
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


module enc_dec_vga_tb(

    );
    
    reg clk, rst;
    wire hsync, vsync;
    wire [2:0] text_rgb;
    reg [31:0] data;
    
    top U1(
            .clk(clk),
            .rst(rst),
            //.data(data),
            .hsync(hsync),
            .vsync(vsync),
            .rgb(text_rgb)
            
            );
    
    initial 
    begin
    clk <= 1;
    rst <= 1;
    //data <= 32'habcdef01;
    
    #10
    rst <= 0;
    //data <= 32'habcdef01;

    
    #10000000  $finish;
    end
 
    always begin 
    #5 clk = ~clk;
    end
endmodule
