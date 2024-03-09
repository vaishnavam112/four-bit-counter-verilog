`timescale 1ns / 1ps

module tb_down_counter(); 
  reg clk, rstn;                    
  wire [3:0] out; 
  integer fd;             
  
  down_counter  c0 ( .clk (clk),  
                 .rstn (rstn),  
                 .out (out));  
  
 always #5 clk = ~clk;  
  initial begin
    fd = $fopen("my_file.txt", "w");    
    clk <= 0;  
    rstn <= 0;
     
    #20   rstn <= 1;  
    #80   rstn <= 0;  
    #50   rstn <= 1;  
   
   $fwrite(fd,);
   #10 $fdisplay(fd, "Value displayed with $fmonitor");  
   $fmonitor(fd,"time=%0t clk=%0b rstn=%0b out=%0b ",$time,clk,rstn,out); 
    
    
    $fclose("fd");
    
    #150 $finish;  
  end  
endmodule  
  
