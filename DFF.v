`timescale 1ns / 1ps

module DFF(input d,  //this is input to D-ff
           input clk,
           input reset, 
           output q);
    
    reg q_reg;
    
    assign q = q_reg;
    
    always @(posedge clk, posedge reset) //Active High Reset Flip flop
    begin
        if(reset)
        begin
            q_reg <= 1'b0;
        end
        else
        begin
            q_reg <= d;
        end   
    end
    
endmodule
