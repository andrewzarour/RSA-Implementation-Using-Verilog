`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2020 08:46:20 PM
// Design Name: 
// Module Name: lab2
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


module lab2 #(parameter SIZE = 16)(
    input sub,
    input clr,
    input load,
    input clk,
    input [SIZE-1:0] inpA,
    output wire [SIZE-1:0] LED
    //output wire [SIZE-1:0] k1,
    //output wire [SIZE-1:0] k2
    );
    reg [SIZE-1:0] load_data =4'h0;
    reg [SIZE-1:0] load_data2 = 4'h0;

    
    wire [SIZE-1:0]T1, T2, T3, T4, T5;
    wire [SIZE-1:0]op_load, op_sub, op_add;
    
    always @(posedge clk)
        begin
            if(clr)
              begin
                load_data <= 0;
              end
            else if(load)
              begin
                load_data <= inpA;
                
              end
        end
    //assign k1 = load_data;
    
    always @(posedge clk)
        begin
            if(~load)
              begin
                load_data2 <= inpA;
              end
        end
    //assign k2 = load_data2;
    
    //assign op_sub = (load_data-load_data2);
    //assign op_add = (load_data+load_data2);
    
    wire [SIZE-1:0] carry, carry_sub;
    wire [SIZE-1:0] ans, ans_sub;
    
    FA_gen U2 (
            .A_(load_data),
            .B_(load_data2),
            .carry_(carry),
            .ans_(ans)
            );
            
   FA_gen U3(
            .A_(~load_data),
            .B_(load_data2),
            .carry_(carry_sub),
            .ans_(ans_sub)
            );
    
    assign op_sub = ~ans_sub;
    assign op_add = ans;
    
    genvar i;
    for(i = 0; i<SIZE; i=i+1)
        begin

        //calculate add and subtract

        //xor(op_add[i],op_load[i],inpA[i]);
        
        //xor(op_sub[i],op_load[i],~inpA[i]);
        
        //subtract if 1, else add
        assign T4[i] = (sub & op_sub[i]);
        assign T5[i] = ((~sub) & op_add[i]);
        assign LED[i] = (T4[i] | T5[i]); //output of subtraction or addition
        
        end
    

endmodule
