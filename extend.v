`timescale 1ns / 1ps
module extend(
input [7:0] M, output [15:0] eM,eM_bar,eM2,eM2_bar  
    );
    assign eM = M[7]?{8'b11111111,M}:{8'b0,M} ; 
    assign eM_bar = -eM; 
    assign eM2 = eM<<1 ; 
    assign eM2_bar= -eM2 ; 
endmodule
