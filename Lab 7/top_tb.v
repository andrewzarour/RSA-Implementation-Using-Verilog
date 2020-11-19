`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2020 10:40:08 AM
// Design Name: 
// Module Name: top_tb
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


module top_tb(

    );
    
    reg clk_tb, rst_tb, upd_tb;
    reg [4:0] SW_tb;
    wire [6:0] SEG_tb;
    wire [7:0] AN_tb;
    wire dp_tb;
    
    reg [3:0] data_tb;
    reg [2:0] sel_tb;
    reg rd_e, wr_e;
    
    top U1(
        .clk(clk_tb),
        .rst(rst_tb),
        .SW(SW_tb),
        .data(data_tb),
        .sel(sel_tb),
        .rd_enable(rd_e),
        .wr_enable(wr_e),
        .upd(upd_tb),
        .SEG(SEG_tb),
        .AN(AN_tb),
        .dp(dp_tb)
    );
    
    initial 
    begin
    clk_tb <= 1;
    rst_tb <= 1;
    SW_tb <= 5'b00011;
    
    upd_tb <= 0;
    
    data_tb <= 4'b1011;
    sel_tb <= 3'b000;
    rd_e <= 0;
    wr_e <= 0;
    
    #10
    SW_tb <= 5'b00011;
    upd_tb <= 0;
    rst_tb <= 0;
    
    data_tb <= 4'b1011;
    sel_tb <= 3'b000;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    SW_tb <= 5'b00011;
    upd_tb <= 0;
    rst_tb <= 0;
    
    data_tb <= 4'b1011;
    sel_tb <= 3'b001;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    SW_tb <= 5'b00011;
    upd_tb <= 0;
    rst_tb <= 0;
    
    data_tb <= 4'b1011;
    sel_tb <= 3'b010;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    SW_tb <= 5'b00011;
    upd_tb <= 0;
    rst_tb <= 0;
    
    data_tb <= 4'b1011;
    sel_tb <= 3'b011;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    SW_tb <= 5'b00011;
    upd_tb <= 0;
    rst_tb <= 0;
    
    data_tb <= 4'b1011;
    sel_tb <= 3'b100;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    SW_tb <= 5'b00011;
    upd_tb <= 0;
    rst_tb <= 0;
    
    data_tb <= 4'b1011;
    sel_tb <= 3'b101;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    SW_tb <= 5'b00011;
    upd_tb <= 0;
    rst_tb <= 0;
    
    data_tb <= 4'b1011;
    sel_tb <= 3'b110;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    SW_tb <= 5'b00000;
    upd_tb <= 0;
    rst_tb <= 0;
    
    data_tb <= 4'b1011;
    sel_tb <= 3'b111;
    rd_e <= 0;
    wr_e <= 1;
    
    #20
    sel_tb <= 3'b000;
    
    wr_e <= 0;
    rd_e <= 1;
    #20
    
    rd_e <= 1;
    sel_tb <= 3'b001;
    #20
    rd_e <= 1;
    sel_tb <= 3'b010;
    #20
    rd_e <= 1;
    sel_tb <= 3'b011;
    #20
    rd_e <= 1;
    sel_tb <= 3'b100;
    #20
    rd_e <= 1;
    sel_tb <= 3'b101;
    #20
    rd_e <= 1;
    sel_tb <= 3'b110;
    #20
    rd_e <= 1;
    sel_tb <= 3'b111;
    #20
    rd_e <= 0;
    
    
    #1000  $finish;
    end
 
    always begin 
    #5 clk_tb = ~clk_tb;
    end
 
    
endmodule
