`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 11:00:01 PM
// Design Name: 
// Module Name: mod_exp
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



`define UPDATE 2'd1
`define HOLD 2'd2
/* to calculate *** a^b mod n *** we use right to left binary exponentiation (by .BRUCE SCHIENER)
*/
module mod_exp #(parameter WIDTH = 32)(
    input [WIDTH*2-1:0] base,//base here represents (a) 
	input [WIDTH*2-1:0] modulo,//modulo here is modulus (n)
	input [WIDTH*2-1:0] exponent,//exponent here is the power of base (b)
	input clk,//system clk
	input reset,//resets module
	input done,
	output finish,//sends finish signal on completion
    output [WIDTH*2-1:0] result
    );
    
    //parameter WIDTH = 32;
        
    reg [WIDTH*2-1:0] base_reg,modulo_reg,exponent_reg,result_reg;
    reg [1:0] state;
    
    wire [WIDTH*2-1:0] result_mul_base = result_reg * base_reg;
    wire [WIDTH*2-1:0] result_next;
    wire [WIDTH*2-1:0] base_squared = base_reg * base_reg;
    wire [WIDTH*2-1:0] base_next;
    wire [WIDTH*2-1:0] exponent_next = exponent_reg >> 1;
    
    wire [WIDTH*2-1:0] q1, q2;
    
    assign finish = (state == `HOLD) ? 1'b1:1'b0;
    assign result = result_reg;
    
    mod #(.WIDTH(WIDTH*2)) base_squared_mod(base_squared,modulo_reg,base_next,q1);                   //  implementation of 
    //defparam base_squared_mod.WIDTH = WIDTH*2;                                  //  right to left 
                                                                                //  binary exponentiation  
    mod #(.WIDTH(WIDTH*2)) result_mul_base_mod (result_mul_base,modulo_reg,result_next,q2);          //  by.
    //defparam result_mul_base_mod.WIDTH = WIDTH*2;                               //  BRUCE SCHIEMER
    
   
    always @(posedge clk) begin
        if(reset || !done) begin                                                         //initialisation of values
            base_reg <= base;
            modulo_reg <= modulo;
            exponent_reg <= exponent;                
            result_reg <= 32'd1;
            state <= `UPDATE;
        end
        else case(state)
            `UPDATE: begin
                if (exponent_reg != 64'd0) begin
                    if (exponent_reg[0])
                        result_reg <= result_next;
                    base_reg <= base_next;
                    exponent_reg <= exponent_next;
                    state <= `UPDATE;
                end
                else state <= `HOLD;
            end
            
           `HOLD: begin
                end
       endcase
    end
endmodule
