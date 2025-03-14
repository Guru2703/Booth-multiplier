`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2025 23:47:04
// Design Name: 
// Module Name: radix4_encoder
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


module radix4_encoder(
inp,out
    );
input wire [2:0] inp ; 
output wire [2:0] out ;
assign out[0] = ~inp[1]*inp[0]|inp[1]*~inp[0] ; 
assign out[1] = (~inp[2]*inp[1]*inp[0])|(inp[2]*~inp[1]*~inp[0]) ; 
assign out[2]= inp[2]*(~inp[1]|~inp[0]) ; 
endmodule
