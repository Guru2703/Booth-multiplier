`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2025 23:56:22
// Design Name: 
// Module Name: extend
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


module extend(
input [7:0] M, output [15:0] eM,eM_bar,eM2,eM2_bar  
    );
    assign eM = M[7]?{8'b11111111,M}:{8'b0,M} ; 
    assign eM_bar = -eM; 
    assign eM2 = eM<<1 ; 
    assign eM2_bar= -eM2 ; 
endmodule
