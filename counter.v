`timescale 1ns / 1ps

module counter(input clock,
               input rst,
               output [3:0]q_counter);
    
    wire d3,d2,d1,d0;
    wire q3,q2,q1,q0;
    wire a1,a2,a3,a4,a5,a6,a7,a8,a9,a10;
    
    assign q_counter = {q3,q2,q1,q0};
              
    DFF dff3(.clk(clock),.d(d3),.reset(rst),.q(q3));
    DFF dff2(.clk(clock),.d(d2),.reset(rst),.q(q2));
    DFF dff1(.clk(clock),.d(d1),.reset(rst),.q(q1));
    DFF dff0(.clk(clock),.d(d0),.reset(rst),.q(q0)); 
    
    
    and(a1,~q3,q2,q1,q0);
    and(a2,q3,~q2);
    and(a3,q3,~q1);
    and(a4,q3,~q0);
    and(a5,q0,~q2,q1); 
    and(a6,q2,~q1);
    and(a7,q2,~q0);
    and(a8,q0,~q1);
    and(a9,q1,~q0);  
    or(d3,a1,a2,a3,a4);
    or(d2,a5,a6,a7);
    or(d1,a8,a9);
//    xor(a10,q3,q0);
    not(d0,q0);
         
endmodule
