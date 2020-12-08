`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 11:01:32 PM
// Design Name: 
// Module Name: encryption_tb
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


module encryption_test(

    );
    reg [31:0] data_rx;
    reg clk_tb;
    reg rst_tb;
    wire [31:0] output_e;
    encryption U1 (
                .data_rx(data_rx),
                .clk(clk_tb),
                .rst(rst_tb),
                .output_e(output_e)
                
            );
    
    
    initial 
    begin
    clk_tb <= 1;
    rst_tb <= 1;
    data_rx <= 32'h00000002;
    
    #10
    rst_tb <= 0;
    

    
    #1000  $finish;
    end
 
    always begin 
    #5 clk_tb = ~clk_tb;
    end
 
    
endmodule

