`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 11:30:25 PM
// Design Name: 
// Module Name: text_gen
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


module text_gen
   (
    input wire clk, 
    //input wire [1:0] ball,
    //input wire [3:0] dig0, dig1,
    input wire [31:0] data,
    input wire [9:0] pix_x, pix_y,
    input wire dec_done,
    output wire [3:0] text_on,
    output reg [2:0] text_rgb
   );

   // signal declaration
   wire [10:0] rom_addr;
   reg [6:0] char_addr, char_addr_s, char_addr_l,
             char_addr_r, char_addr_o;
   reg [3:0] row_addr;
   wire [3:0] row_addr_s, row_addr_l, row_addr_r, row_addr_o;
   reg [2:0] bit_addr;
   wire [2:0] bit_addr_s, bit_addr_l,bit_addr_r, bit_addr_o;
   wire [7:0] font_word;
   wire font_bit, score_on, logo_on, rule_on, over_on;
   wire [7:0] rule_rom_addr;

   // instantiate font ROM
   font_rom font_unit
      (.clk(clk), .addr(rom_addr), .data(font_word));

    

   //-------------------------------------------
   // score region
   //  - display two-digit score, ball on top left
   //  - scale to 16-by-32 font
   //  - line 1, 16 chars: "Score:DD Ball:D"
   //-------------------------------------------
   assign score_on = (pix_y[9:5]==0) && (pix_x[9:4]<16);
   assign row_addr_s = pix_y[4:1];
   assign bit_addr_s = pix_x[3:1];
   always @*
      case (pix_x[7:4])
         4'h0: char_addr_s = 7'h53; // S
         4'h1: char_addr_s = 7'h63; // c
         4'h2: char_addr_s = 7'h6f; // o
         4'h3: char_addr_s = 7'h72; // r
         4'h4: char_addr_s = 7'h65; // e
         4'h5: char_addr_s = 7'h3a; // :
          4'h6: char_addr_s = 7'h00; // digit 10
          4'h7: char_addr_s = 7'h00; // digit 1
          4'h8: char_addr_s = 7'h00; //
          4'h9: char_addr_s = 7'h00; //
          4'ha: char_addr_s = 7'h42; // B
          4'hb: char_addr_s = 7'h61; // a
          4'hc: char_addr_s = 7'h6c; // l
          4'hd: char_addr_s = 7'h6c; // l
          4'he: char_addr_s = 7'h3a; // :
          4'hf: char_addr_s = 7'h00;
      endcase
   //-------------------------------------------
   // logo region:
   //   - display logo "PONG" at top center
   //   - used as background
   //   - scale to 64-by-128 font
   //-------------------------------------------
   assign logo_on = (pix_y[9:7]==2) &&
                    (3<=pix_x[9:6]) && (pix_x[9:6]<=6);
   assign row_addr_l = pix_y[6:3];
   assign bit_addr_l = pix_x[5:3];
   always @*
      case (pix_x[8:6])
         3'o3: char_addr_l = 7'h50; // P
         3'o4: char_addr_l = 7'h4f; // O
         3'o5: char_addr_l = 7'h4e; // N
         default: char_addr_l = 7'h47; // G
      endcase
   //-------------------------------------------
   // rule region
   //   - display rule (4-by-16 tiles)on center
   //   - rule text:
   //      Rule:
   //        Use two buttons
   //        to move paddle
   //        up and down
   //-------------------------------------------
   assign rule_on = (pix_x[9:7]==2) && (pix_y[9:6]==2);
   assign row_addr_r = pix_y[3:0];
   assign bit_addr_r = pix_x[2:0];
   assign rule_rom_addr = {pix_y[5:4], pix_x[6:3]};
   always @*
      case (rule_rom_addr)
         6'h00:
         begin
         case(data[31:28])
            4'h0: char_addr_r = 7'h30;
            4'h1: char_addr_r = 7'h31;
            4'h2: char_addr_r = 7'h32;
            4'h3: char_addr_r = 7'h33;
            4'h4: char_addr_r = 7'h34;
            4'h5: char_addr_r = 7'h35;
            4'h6: char_addr_r = 7'h36;
            4'h7: char_addr_r = 7'h37;
            4'h8: char_addr_r = 7'h38;
            4'h9: char_addr_r = 7'h39;
            4'ha: char_addr_r = 7'h41;
            4'hb: char_addr_r = 7'h42;
            4'hc: char_addr_r = 7'h43;
            4'hd: char_addr_r = 7'h44;
            4'he: char_addr_r = 7'h45;
            4'hf: char_addr_r = 7'h46;
            default: char_addr_r = 7'hZZ;
         endcase
         end
         6'h01:
         begin
         case(data[27:24])
            4'h0: char_addr_r = 7'h30;
            4'h1: char_addr_r = 7'h31;
            4'h2: char_addr_r = 7'h32;
            4'h3: char_addr_r = 7'h33;
            4'h4: char_addr_r = 7'h34;
            4'h5: char_addr_r = 7'h35;
            4'h6: char_addr_r = 7'h36;
            4'h7: char_addr_r = 7'h37;
            4'h8: char_addr_r = 7'h38;
            4'h9: char_addr_r = 7'h39;
            4'ha: char_addr_r = 7'h41;
            4'hb: char_addr_r = 7'h42;
            4'hc: char_addr_r = 7'h43;
            4'hd: char_addr_r = 7'h44;
            4'he: char_addr_r = 7'h45;
            4'hf: char_addr_r = 7'h46;
            default: char_addr_r = 7'hZZ;
         endcase
         end
         6'h02:
         begin
         case(data[23:20])
            4'h0: char_addr_r = 7'h30;
            4'h1: char_addr_r = 7'h31;
            4'h2: char_addr_r = 7'h32;
            4'h3: char_addr_r = 7'h33;
            4'h4: char_addr_r = 7'h34;
            4'h5: char_addr_r = 7'h35;
            4'h6: char_addr_r = 7'h36;
            4'h7: char_addr_r = 7'h37;
            4'h8: char_addr_r = 7'h38;
            4'h9: char_addr_r = 7'h39;
            4'ha: char_addr_r = 7'h41;
            4'hb: char_addr_r = 7'h42;
            4'hc: char_addr_r = 7'h43;
            4'hd: char_addr_r = 7'h44;
            4'he: char_addr_r = 7'h45;
            4'hf: char_addr_r = 7'h46;
            default: char_addr_r = 7'hZZ;
         endcase
         end
         6'h03:
         begin
         case(data[19:16])
            4'h0: char_addr_r = 7'h30;
            4'h1: char_addr_r = 7'h31;
            4'h2: char_addr_r = 7'h32;
            4'h3: char_addr_r = 7'h33;
            4'h4: char_addr_r = 7'h34;
            4'h5: char_addr_r = 7'h35;
            4'h6: char_addr_r = 7'h36;
            4'h7: char_addr_r = 7'h37;
            4'h8: char_addr_r = 7'h38;
            4'h9: char_addr_r = 7'h39;
            4'ha: char_addr_r = 7'h41;
            4'hb: char_addr_r = 7'h42;
            4'hc: char_addr_r = 7'h43;
            4'hd: char_addr_r = 7'h44;
            4'he: char_addr_r = 7'h45;
            4'hf: char_addr_r = 7'h46;
            default: char_addr_r = 7'hZZ;
         endcase
         end
         6'h04:
         begin
         case(data[15:12])
            4'h0: char_addr_r = 7'h30;
            4'h1: char_addr_r = 7'h31;
            4'h2: char_addr_r = 7'h32;
            4'h3: char_addr_r = 7'h33;
            4'h4: char_addr_r = 7'h34;
            4'h5: char_addr_r = 7'h35;
            4'h6: char_addr_r = 7'h36;
            4'h7: char_addr_r = 7'h37;
            4'h8: char_addr_r = 7'h38;
            4'h9: char_addr_r = 7'h39;
            4'ha: char_addr_r = 7'h41;
            4'hb: char_addr_r = 7'h42;
            4'hc: char_addr_r = 7'h43;
            4'hd: char_addr_r = 7'h44;
            4'he: char_addr_r = 7'h45;
            4'hf: char_addr_r = 7'h46;
            default: char_addr_r = 7'hZZ;
         endcase
         end
         6'h05:
         begin
         case(data[11:8])
            4'h0: char_addr_r = 7'h30;
            4'h1: char_addr_r = 7'h31;
            4'h2: char_addr_r = 7'h32;
            4'h3: char_addr_r = 7'h33;
            4'h4: char_addr_r = 7'h34;
            4'h5: char_addr_r = 7'h35;
            4'h6: char_addr_r = 7'h36;
            4'h7: char_addr_r = 7'h37;
            4'h8: char_addr_r = 7'h38;
            4'h9: char_addr_r = 7'h39;
            4'ha: char_addr_r = 7'h41;
            4'hb: char_addr_r = 7'h42;
            4'hc: char_addr_r = 7'h43;
            4'hd: char_addr_r = 7'h44;
            4'he: char_addr_r = 7'h45;
            4'hf: char_addr_r = 7'h46;
            default: char_addr_r = 7'hZZ;
         endcase
         end
         6'h06:
         begin
         case(data[7:4])
            4'h0: char_addr_r = 7'h30;
            4'h1: char_addr_r = 7'h31;
            4'h2: char_addr_r = 7'h32;
            4'h3: char_addr_r = 7'h33;
            4'h4: char_addr_r = 7'h34;
            4'h5: char_addr_r = 7'h35;
            4'h6: char_addr_r = 7'h36;
            4'h7: char_addr_r = 7'h37;
            4'h8: char_addr_r = 7'h38;
            4'h9: char_addr_r = 7'h39;
            4'ha: char_addr_r = 7'h41;
            4'hb: char_addr_r = 7'h42;
            4'hc: char_addr_r = 7'h43;
            4'hd: char_addr_r = 7'h44;
            4'he: char_addr_r = 7'h45;
            4'hf: char_addr_r = 7'h46;
            default: char_addr_r = 7'hZZ;
         endcase
         end
         6'h07:
         begin
         case(data[3:0])
            4'h0: char_addr_r = 7'h30;
            4'h1: char_addr_r = 7'h31;
            4'h2: char_addr_r = 7'h32;
            4'h3: char_addr_r = 7'h33;
            4'h4: char_addr_r = 7'h34;
            4'h5: char_addr_r = 7'h35;
            4'h6: char_addr_r = 7'h36;
            4'h7: char_addr_r = 7'h37;
            4'h8: char_addr_r = 7'h38;
            4'h9: char_addr_r = 7'h39;
            4'ha: char_addr_r = 7'h41;
            4'hb: char_addr_r = 7'h42;
            4'hc: char_addr_r = 7'h43;
            4'hd: char_addr_r = 7'h44;
            4'he: char_addr_r = 7'h45;
            4'hf: char_addr_r = 7'h46;
            default: char_addr_r = 7'hZZ;
         endcase
         end
         default: char_addr_r = 7'hZZ;
      endcase
   //-------------------------------------------
   // game over region
   //  - display "Game Over" at center
   //  - scale to 32-by-64 fonts
   //-----------------------------------------
   assign over_on = (pix_y[9:6]==3) &&
                    (5<=pix_x[9:5]) && (pix_x[9:5]<=13);
   assign row_addr_o = pix_y[5:2];
   assign bit_addr_o = pix_x[4:2];
   always @*
      case(pix_x[8:5])
         4'h5: char_addr_o = 7'h47; // G
         4'h6: char_addr_o = 7'h61; // a
         4'h7: char_addr_o = 7'h6d; // m
         4'h8: char_addr_o = 7'h65; // e
         4'h9: char_addr_o = 7'h00; //
         4'ha: char_addr_o = 7'h4f; // O
         4'hb: char_addr_o = 7'h76; // v
         4'hc: char_addr_o = 7'h65; // e
         default: char_addr_o = 7'h72; // r
      endcase
   //-------------------------------------------
   // mux for font ROM addresses and rgb
   //-------------------------------------------
   always @*
   begin
      text_rgb = 3'b110;  // background, yellow
      if (score_on)
         begin
            char_addr = char_addr_s;
            row_addr = row_addr_s;
            bit_addr = bit_addr_s;
            if (font_bit)
               text_rgb = 3'b001;
         end
      else if (rule_on)
         begin
            char_addr = char_addr_r;
            row_addr = row_addr_r;
            bit_addr = bit_addr_r;
            if (font_bit)
               text_rgb = 3'b001;
         end
      else if (logo_on)
         begin
            char_addr = char_addr_l;
            row_addr = row_addr_l;
            bit_addr = bit_addr_l;
            if (font_bit)
               text_rgb = 3'b011;
         end
      else // game over
         begin
            char_addr = char_addr_o;
            row_addr = row_addr_o;
            bit_addr = bit_addr_o;
            if (font_bit)
               text_rgb = 3'b001;
         end
   end

   assign text_on = {score_on, logo_on, rule_on&dec_done, over_on};
   //assign text_on = {1'b1, 1'b1, rule_on&dec_done, 1'b1};
   //-------------------------------------------
   // font rom interface
   //-------------------------------------------
   assign rom_addr = {char_addr, row_addr};
   assign font_bit = font_word[~bit_addr];

endmodule
