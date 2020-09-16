`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2020 03:26:50 PM
// Design Name: 
// Module Name: mux
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


module mux #(parameter SIZE = 4)
(

    input [SIZE-1:0]inp1_,
    input [SIZE-1:0]inp2_,
    input sw1_,
    input sw2_,
    
    output wire [SIZE-1:0]LED_,
    output wire [SIZE-1:0]LED2_
    );
    wire [SIZE-1:0]T1, T2, T3, T4;
    wire [SIZE-1:0]op_;
    genvar i;
    for(i = 0; i<SIZE; i=i+1)
        begin
        assign T1[i] = (sw1_ & inp1_[i]);
    //and(T1, sw1_, inp2_);
        assign T2[i] = ((~sw1_) & inp2_[i]);
    //and(T2, ~(sw1_), inp1_);
        assign op_[i] = (T1[i] | T2[i]);
    //or(op_, T1, T2);
    
    
        assign T3[i] = (sw2_ & op_[i]);
    //and(T3,sw2_,op_);
        assign T4[i] = ((~sw2_) & op_[i]);
    //and(T4,~(sw2_),op_);
    
        assign LED_[i] = T3[i];
        assign LED2_[i] = T4[i];
        end
    
    
    
endmodule
