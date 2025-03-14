`timescale 1ns / 1ps
module booth_multiplier(
input [7:0] m ,M ,output [15:0] result 
    );
    wire [2:0] x,y,z,w ; 
    radix4_encoder r1({m[1],m[0],1'b0},x) ;  
    radix4_encoder r2({m[3],m[2],m[1]},y) ;  
    radix4_encoder r3({m[5],m[4],m[3]},z );  
    radix4_encoder r4({m[7],m[6],m[5]},w) ;  
    wire [15:0] eM, eM_bar,eM2, eM2_bar ;
    extend ex(M,eM,eM_bar,eM2,eM2_bar) ;
    wire [15:0] v1,v2,v3,v4 ;
    assign v1 = x==0?0:(x[1]?(x[2]?eM2_bar:eM2):(x[2]?eM_bar:eM) ); 
    assign v2 = y==0?0:(y[1]?(y[2]?eM2_bar:eM2):(y[2]?eM_bar:eM) );
    assign v3 = z==0?0:(z[1]?(z[2]?eM2_bar:eM2):(z[2]?eM_bar:eM) );
    assign v4 = w==0?0:(w[1]?(w[2]?eM2_bar:eM2):(w[2]?eM_bar:eM) );
    assign result = v1+{v2[13:0],2'b0}+{v3[11:0],4'b0}+{v4[9:0],6'b0} ; 
endmodule
