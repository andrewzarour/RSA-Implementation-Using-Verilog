`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2020 10:49:09 PM
// Design Name: 
// Module Name: decryption_tb
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


module decryption_tb(

    );
    
            reg clk;
            reg rst;
            reg [31:0] e_key;
            reg [31:0] e_data;
            reg [31:0] nval, phival;
            wire [31:0] d_key;
            wire [31:0] d_data;
            reg enc_done; 
            wire done_d;
    
    decryption  U1 (
                .clk(clk),
                .rst(rst),
                .e_key(e_key),
                .e_data(e_data),
                .phival(phival),
                .enc_done(enc_done),
                .nval(nval),
                
                .d_key(d_key),
                .d_data(d_data),
                .done_d(done_d)
                );
                
    initial 
    begin
    clk <= 1;
    rst <= 1;
    enc_done <= 1;
    phival <= 32'h00000006;
    e_data <= 32'h00000004;
    nval <= 32'h0000000e;
    e_key <= 32'h00000005;
    #10
    rst <= 0;
    enc_done <= 1;
    phival <= 32'h00000006;
    e_data <= 32'h00000004;
    nval <= 32'h0000000e;
    e_key <= 32'h00000005;

    
    #1000  $finish;
    end
 
    always begin 
    #5 clk = ~clk;
    end
    
endmodule
