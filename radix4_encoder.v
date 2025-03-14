`timescale 1ns / 1ps
module radix4_encoder(
inp,out
    );
input wire [2:0] inp ; 
output wire [2:0] out ;
assign out[0] = ~inp[1]*inp[0]|inp[1]*~inp[0] ; 
assign out[1] = (~inp[2]*inp[1]*inp[0])|(inp[2]*~inp[1]*~inp[0]) ; 
assign out[2]= inp[2]*(~inp[1]|~inp[0]) ; 
endmodule
