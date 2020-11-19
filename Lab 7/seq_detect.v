`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2020 10:07:27 PM
// Design Name: 
// Module Name: seq_detect
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


module seq_detect(
    input clk, 
    input rst, 
    input in,  
    output out
    );
    
    
    
    parameter IDLE = 0, S1 = 1, S10 = 2, S101 = 3;
    
    reg[1:0] cur_state;
    reg[1:0] next_state;
    
    assign out = (cur_state == S101 ? 1:0);
    
    always @ (posedge clk or posedge rst)
    begin
      if(rst)
        cur_state <= IDLE;
      else
        cur_state <= next_state;
    end
    
    always @ (cur_state or in)
    begin
      case(cur_state)
        IDLE : 
        begin
          if(in) next_state = S1;
          else next_state = IDLE;
        end
        
        S1 :
        begin
          if(in) next_state = S1;
          else next_state = S10;
        end
        
        S10:
        begin
          if(in) next_state = S101;
          else next_state = IDLE;
        end
        
        S101:
        begin
          if(in) next_state = S1;
          else next_state = IDLE;
        end
      endcase  
    end
    
    
endmodule
