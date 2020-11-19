`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2020 11:04:55 PM
// Design Name: 
// Module Name: seq_system
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


module seq_system(
                input clk,
                input clk_div,
                input rst, 
                input[3:0] INP,
                input WR_EN,
                input RD_EN,
                input [2:0]  main_ptr,
                output end_OP
    );
    reg [31:0] INP_FULL;
    //reg RD_EN;
    wire[3:0] buf_OP;
    wire buf_E, buf_F;
    wire [2:0] rd_ptr = main_ptr;
    reg flag;
    
    always @(posedge clk)
    begin
        flag <= (f0&f1&f2&f3&f4&f5&f6&f7);
    end

    reg f1 =0, f2=0, f3=0, f4=0, f5=0, f6=0, f7=0, f0 = 0;
    
    
    always @ (posedge clk)
    begin
    if(RD_EN == 1)
    begin
      case(main_ptr)
        0 : 
        begin
          INP_FULL[31:28] <= buf_OP[3:0];
          f0 <= 1;
        end
        
        1 :
        begin
          INP_FULL[27:24] <= buf_OP[3:0];
          f1 <= 1;
        end
        
        2 :
        begin
          INP_FULL[23:20] <= buf_OP[3:0];
          f2 <= 1;
        end
        
        3 :
        begin
          INP_FULL[19:16] <= buf_OP[3:0];
          f3 <= 1;
        end
        
        4 :
        begin
          INP_FULL[15:12] <= buf_OP[3:0];
          f4 <= 1;
        end
        
        5 :
        begin
          INP_FULL[11:8] <= buf_OP[3:0];
          f5 <= 1;
        end
        
        6 :
        begin
          INP_FULL[7:4] <= buf_OP[3:0];
          f6 <= 1;
        end
        
        7 :
        begin
          INP_FULL[3:0] <= buf_OP[3:0];
          f7 <= 1;
        end
      endcase  
    end
      
    end

    
    
    memory U1 (
                .clk(clk),
                .rst(rst),
                .wr(WR_EN),
                .rd(RD_EN),
                .addr_wr(main_ptr),
                .addr_rd(main_ptr),
                .data_in(INP),
                .data_out(buf_OP),
                .buf_empty(buf_E),
                .buf_full(buf_F)
    );
    
//    reg  in_seq;
//    integer i = 0;
//    always@(posedge clk)
//    begin
//      if(RD_EN==0)
//      begin
      
//        in_seq = INP_FULL >> i ;
//        i = i+1;
//      end
//    end
      wire in_seq;
      ser_32to1 SER(
                .clk(clk_div),
                .rd_en(flag),
                .dataIn(INP_FULL),
                .dataOut(in_seq)
            );
            

        
      seq_detect U2(
                .clk(clk_div),
                .rst(rst),
                .in(in_seq),
                .out(end_OP)
                
      );
                
    

    
    
endmodule
