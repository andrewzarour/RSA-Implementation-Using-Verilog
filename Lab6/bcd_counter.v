`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 06:35:20 PM
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter(
                    input clk,
                    input rst,
                    input en_in, 
                    input upd,
                    input load,
                    input [3:0]replace,
                    output reg [3:0] op,
                    output wire en_out
                  );
            always@(posedge clk or posedge rst)
                begin 
                    if (rst)
                        begin
                            if (upd == 1'b1) 
                                op <= 4'd9;
                            else 
                                op <= 4'd0;
                        end  
                    else 
                      begin 
                        if (en_in == 1'b1 && load == 0)
                            begin 
                                if (upd== 1'b1)
                                    begin 
                                      if (op > 0) 
                                        op <= op - 1;
                                      else 
                                        op <= 4'd9; 
                                     end 
                                else
                                    begin 
                                      if(op <9)
                                        op <= op+ 1;
                                      else 
                                        op <= 4'd0;  
                                    end 
                                end
                         else if(load == 1)
                             begin
                               if(replace > 9)
                                 begin
                                   op <= 4'b1001;
                                 end
                               else
                                 op <= replace;
                             end
                            end
                        
                   end     
                
      assign en_out = (en_in)&((op[3] & op[0] & (~op[2]) & (~op[1]) & (~upd)) | ( (~op[3]) & (~op[0]) & (~op[2]) & (~op[1]) & (upd))) ;
         
                  
endmodule
