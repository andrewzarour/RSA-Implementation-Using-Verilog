`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 10:55:38 PM
// Design Name: 
// Module Name: control
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



module control #(parameter WIDTH = 32,
        parameter hpix_top = (800),
        parameter vlines_top = (512),
        parameter hbp_top = (128+16),
        parameter hfp_top = (128+16+640),
        parameter vbp_top = (29+2),
        parameter vfp_top = (2+29+480)
        )(
    //input [WIDTH-1:0] p,q, //Input Random Primes
    input clk,//system wide clock
    input reset,//resets inverter module
    input reset1,//resets modular exponentiation module
    
    input encrypt_decrypt,//1 for encryption and 0 for decryption
    //input RD,
    //input WR,
    //input [2:0] main,
    
    input uart_rxd,
//    output [7:0] led,
//    output [6:0] a_to_g,
//    output [7:0] AN,
//    output DP,
    
    //input [WIDTH-1:0] msg_in,//input either message or cipher
    //output [WIDTH-1:0] msg_out,//output either decrypted message or cipher
    //output mod_exp_finish,//finish signal indicator of mod exp module
    output hsync,
    output vsync,
    output reg [2:0] rgb
    );
    wire [WIDTH-1:0] msg_in = 32'h00000002;
    wire [WIDTH*2-1:0] msg_out;
    wire [WIDTH-1:0] p = 32'h00000002;
    wire [WIDTH-1:0] q = 32'h00000007;
    wire mod_exp_finish;
    
    //parameter WIDTH = 32;//defines size of input ports
    wire flag;
    wire inverter_finish;
    wire [WIDTH*2-1:0] e,d;
    wire [WIDTH*2-1:0] exponent = encrypt_decrypt?e:d;
    wire [WIDTH*2-1:0] modulo = p*q;
    wire mod_exp_reset  = 1'b0;
    
    reg [WIDTH*2-1:0] exp_reg,msg_reg;
    reg [WIDTH*2-1:0] mod_reg;
    
    always @(posedge clk)begin
         exp_reg <= exponent;
         mod_reg <= modulo;
         msg_reg <= msg_in;
    end
    wire clk_25Mhz;
    inverter i(p,q,clk,reset,inverter_finish,e,d);
    defparam i.WIDTH = WIDTH;
    mod_exp m(msg_reg,mod_reg,exp_reg,clk,reset1,1'b1,mod_exp_finish,msg_out);
    defparam m.WIDTH = WIDTH;
    
    wire [3:0] text_on;
    wire [2:0] text_rgb;
    
    wire [9:0] hc, vc;
    wire vidon;
    wire lock, VGA_CLK;
    
    text_gen LD (
                .clk(clk_25Mhz), //25
                .data(msg_out),
                .pix_x(hc),
                .pix_y(vc),
                .dec_done(1),
                .text_on(text_on),
                .text_rgb(text_rgb)
    );
    vga_driver
            #(
            .hpix(hpix_top),
            .vlines(vlines_top),
            .hbp(hbp_top),
            .hfp(hfp_top),
            .vbp(vbp_top),
            .vfp(vfp_top)
            )
            vga_driver_info
            (
            .clk(clk_25Mhz), //25
            .rst(reset),
            .ed_done(1'b1),
            .hsync(hsync),
            .vsync(vsync),
            .hc(hc),
            .vc(vc),
            .vidon(vidon)
    
            );
            
    clk_wiz_0 VGA_PIX_CLKGEN 
     (
        .clk_25Mhz(VGA_CLK),
        .reset(reset),
        .locked(lock),
        .clk_in1(clk)
     );
     
     assign clk_25Mhz = VGA_CLK & lock;
            
            
            
     always @*
      if (!vidon)
         rgb = 3'b000; // blank the edge/retrace
      else
         // display score, rule, or game over
         if (text_on[1])
            rgb = text_rgb;
         
         else
           rgb = 3'b000; // yellow background
    
    
    
//    impl_top UZ (
//            .clk(clk),
//            .sw_0(rst),
//            .uart_rxd(uart_rxd),
//            //.RD_EN(RD),
//            //.WR_EN(WR),
//            //.main_ptr(main),
//            .a_to_g(a_to_g),
//            .AN(AN),
//            .DP(DP),
//            .led(led),
//            .INP_FULL(msg_in),
//            .flag(flag)
//            );
    
    
    
endmodule
