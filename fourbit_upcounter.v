`timescale 1ns / 1ps

module fourbit_upcounter(
    input clk,      
    input rstn,               
    output reg[3:0] out
    );      
  
  always @ (posedge clk, negedge rstn) begin  
    if (! rstn)  
      out <= 0;  
    else  
      out <= out + 1;  
  end  
endmodule  
   
