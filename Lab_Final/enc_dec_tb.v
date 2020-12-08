`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 12:50:58 AM
// Design Name: 
// Module Name: enc_dec_tb
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


module enc_dec_tb(

    );
    localparam p = 2;
    localparam q = 7;
    localparam n = p*q;
    localparam phi = (p-1)*(q-1);
    reg clk, rst;
    reg [31:0] data = 32'habccef01;
    wire [31:0] data_e, d_key, data_d;
    wire [31:0] enc_key;
    wire e_done, d_done;
    
    encryption #(.k(5)) U1 (
                .data_rx(data),
                .clk(clk),
                .rst(rst),
                .output_e(data_e),
                .enc_key(enc_key),
                .done(e_done)
            );
   decryption  U2 (
                .clk(clk),
                .rst(rst),
                .e_key(enc_key),
                .e_data(data_e),
                .phival(phi),
                .nval(n),
                .enc_done(e_done),
                .d_key(d_key),
                .d_data(data_d),
                .done_d(d_done)
                );
    
    initial 
    begin
    clk <= 1;
    rst <= 1;
    
    #10
    rst <= 0;
    

    
    #10000000  $finish;
    end
 
    always begin 
    #5 clk = ~clk;
    end
    
    
endmodule
