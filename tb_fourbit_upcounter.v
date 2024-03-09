`timescale 1ns / 1ps

module tb_fourbit_upcounter(); 
  reg clk, rstn;                    
  wire [3:0] out;
  //reg[8*45:1] str; 
  integer fd;             
  
  fourbit_upcounter  c0 ( .clk (clk),  
                 .rstn (rstn),  
                 .out (out));  
  
 always #5 clk = ~clk;  
  initial begin
    fd = $fopen("my_file.txt", "w");    
    clk <= 0;  
    rstn <= 0;
     //while(! $feof(fd)) begin 
      
    #20   rstn <= 1;  
    #80   rstn <= 0;  
    #50   rstn <= 1;  
   // $fgets(str, fd);
   $fwrite(fd,);
   #10 $fdisplay(fd, "Value displayed with $fmonitor");  
   $fmonitor(fd,"time=%0t clk=%0b rstn=%0b out=%0b ",$time,clk,rstn,out); 
    
    //$display("%0s", str);
    //end 
    $fclose("fd");
    
    #150 $finish;  
  end  
endmodule  