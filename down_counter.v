`timescale 1ns / 1ps
module down_counter(
    input clk,      
    input rstn,               
    output reg[3:0] out
    );      
  
  always @ (posedge clk, negedge rstn) begin  
    if (!rstn)  
      out <= out-1;
    else
        out<=4'b0000;    
  end 
  
  //always @(negedge rstn)begin 
    //  out <= 4'b0000;  
  //end  
endmodule  

