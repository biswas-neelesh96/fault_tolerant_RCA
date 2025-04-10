`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2025 10:29:00
// Design Name: 
// Module Name: OCMSG
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

module OCMSG(input clk,clr, 
             input [3:0]sf,cf,
             input [2:0]lut_i, 
             output IS0,IS1,IS2,IS3,IS4,IS5, 
             output CS0,CS1,CS2,CS3,CS4,
             output SS0,SS1,SS2,SS3);
            
            wire [3:0]cx,sx,lut_o;
            
            lut lt (lut_i,lut_o);
            assign cx0= lut_o[0]^cf[0];
            assign sx0= lut_o[1]^sf[0];
            assign cx1= lut_o[2]^cf[1];
            assign sx1= lut_o[3]^sf[1];
            assign cx2= lut_o[0]^cf[2];
            assign sx2= lut_o[1]^sf[2];
            assign cx3= lut_o[2]^cf[3];
            assign sx3= lut_o[3]^sf[3];
            
            wire [7:0]r0,r1;
            wire CS11,CS12,CS13;
            
            assign r0[0]= cx0|r1[0];
            assign r0[1]= sx0|r1[1];
            assign r0[2]= cx1|r1[2];
            assign r0[3]= sx1|r1[3];
            assign r0[4]= cx2|r1[4];
            assign r0[5]= sx2|r1[5];
            assign r0[6]= cx3|r1[6];
            assign r0[7]= sx3|r1[7];
            register8bit rm0 (clk,clr,r0,r1);
           
            
            assign CS0=r1[1]|r1[0];
            assign CS1=r1[3]|r1[2];
            assign CS2=r1[5]|r1[4];
            assign CS3=r1[7]|r1[6];
            
            assign IS0=r1[1]|r1[0];
            assign IS1=r1[1]|r1[0];
            assign IS2=IS0|r1[3]|r1[2];
          
            assign IS3=IS0|r1[3]|r1[2];
            assign IS4=IS2|r1[5]|r1[4];
            assign IS5=IS2|r1[5]|r1[4];
            
            assign SS0=r1[1]|r1[0]; 
            assign SS1=IS0|r1[3]|r1[2];
            assign SS2=IS2|r1[5]|r1[4];
            assign SS3=SS2|r1[7]|r1[6];
            
            assign CS4= IS2&(CS3|CS2); 
endmodule
