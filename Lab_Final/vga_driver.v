`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2020 06:38:23 PM
// Design Name: 
// Module Name: vga_driver
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


module vga_driver #(
        parameter hpix = (800),
        parameter vlines = (512),
        parameter hbp = (128+16),
        parameter hfp = (128+16+640),
        parameter vbp = (29+2),
        parameter vfp = (2+29+480)
        )(
        input clk,
        input rst,
        input ed_done, 
        output reg hsync,
        output reg vsync,
        output wire [9:0] hc,
        output wire [9:0] vc,
        output reg vidon
        );
        
    reg vsenable;
    reg [9:0] hc_reg;
    reg [9:0] vc_reg;
    
    always@(posedge clk or posedge rst)
      begin: CHSS
        if(rst || !ed_done)
          begin
            hc_reg <= 9'd0;
            vsenable <= 1'b0;
          end
        else
          begin
            if(hc_reg == hpix-1)
              begin
                hc_reg <= 9'd0;
                vsenable <= 1'b1;
              end
            else
              begin
                hc_reg <= hc_reg +1;
                vsenable <= 1'b0;
              end
          end
      end
      
      //generating hsync pulse (low when hc_reg is 0-127) dimension coming from the timing of the analog side of the driver
      
      always@(posedge clk or posedge rst)
        begin: GHSS
          if(rst || !ed_done)
            begin
              hsync <= 9'd0;
            end
          else
            begin
              if(hc_reg < 128)
                hsync <= 9'd0;
              else
                hsync <= 1'b1;
            end
        end
        
        //counter for the vertical sync signal
        
      always@(posedge clk or posedge rst)
      begin: CVSS
        if(rst || !ed_done)
          begin
            vc_reg <= 9'd0;
            
          end
        else
          begin
            if(vsenable)
              begin
                if(vc_reg == vlines-1)
                  vc_reg <= 9'd0;
                else
                  vc_reg <= vc_reg+1;
              end
          end
      end
      
      //generating the vsync pulse
      // vertical sync pulse is low when vc is 0-1
      
      always@(posedge clk or posedge rst)
        begin: GSYNCV
          if(rst || !ed_done)
            vsync <= 1'b1;
          else
            begin
              if(vc_reg <2)
                vsync <= 1'b0;
              else
                vsync <= 1'b1;
            end
        end
      
      //enabling video out when it is within the process
      
      always@(posedge clk or posedge rst)
      begin: NEV
        if(rst || !ed_done)
          vidon <= 1'b0;
        else
          begin
          if ((hc_reg < hfp) && (hc_reg > hbp) && (vc_reg < vfp) && (vc_reg >vbp))
            vidon <= 1'b1;
          else
            vidon <= 1'b0;
          end
      end
      
      assign vc = vc_reg;
      assign hc = hc_reg;
      
endmodule
