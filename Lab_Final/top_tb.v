`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 03:37:12 PM
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
    
    reg clk, reset, reset1;
    reg ed, rd_e, wr_e, rx;
    reg [2:0] sel_tb;
    wire [7:0] led;
    wire [6:0] ag;
    wire [7:0] an;
    wire dp, hs, vs;
    wire [2:0] rgb;
    
    reg [31:0] data_tb;
    
    control UA (
    .clk(clk),//system wide clock
    .reset(reset),//resets inverter module
    .reset1(reset1),//resets modular exponentiation module
    .encrypt_decrypt(ed),//1 for encryption and 0 for decryption
    .RD(rd_e),
    .WR(wr_e),
    .main(sel_tb),
    .uart_rxd(rx),
    
    .led(led),
    .a_to_g(ag),
    .AN(an),
    .DP(dp),
     .hsync(hs),
     .vsync(vs),
     .rgb(rgb)
            
            );
            
   integer i;
            
   initial 
    begin
    clk <= 1;
    reset <= 1;
    reset1 <= 1;
    ed <= 0;
    
    data_tb <= 32'h10100101;
    sel_tb <= 3'b000;
    rd_e <= 0;
    wr_e <= 0;
    
    #10
    
    ed <= 0;
    reset <= 0;
    
    data_tb <= 32'h10100101;
    sel_tb <= 3'b000;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    
    ed <= 0;
    reset <= 0;
    
    data_tb <=  32'h10100101;
    sel_tb <= 3'b001;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    
    ed <= 0;
    reset <= 0;
    
    data_tb <= 32'h10100101;
    sel_tb <= 3'b010;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    
    ed <= 0;
    reset <= 0;
    
    data_tb <=  32'h10100101;
    sel_tb <= 3'b011;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    
    ed <= 0;
    reset <= 0;
    
    data_tb <=  32'h10100101;
    sel_tb <= 3'b100;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    
    ed <= 0;
    reset <= 0;
    
    data_tb <=  32'h10100101;
    sel_tb <= 3'b101;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    
    ed <= 0;
    reset <= 0;
    
    data_tb <=  32'h10100101;
    sel_tb <= 3'b110;
    rd_e <= 0;
    wr_e <= 1;
    
    #10
    
    ed <= 0;
    reset <= 0;
    
    data_tb <=  32'h10100101;
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
    
    #10
    reset1 <= 0;
    
    
    
    #1000000  $finish;
    end
    
    initial
    begin
        #10
        for (i = 0; i < 32; i = i+1) begin
        #10 rx = data_tb[i];
        end
    end
 
    always begin 
    #5 clk = ~clk;
    end
 
    
    
    
endmodule
