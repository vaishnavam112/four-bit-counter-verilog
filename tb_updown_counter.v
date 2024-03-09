`timescale 1ns / 1ps
module tb_updown_counter();
    reg clk, rstn, sel;
    wire [3:0]out;
    integer fd;             
  
  updown_counter  c0 ( .clk (clk), .sel(sel), 
                 .rstn (rstn),  
                 .out (out));  
  
 always #5 clk = ~clk;  
  initial begin
    fd = $fopen("home/users/vaishnavi/documents/my_file.txt", "w");    
    clk <= 0;  
    rstn <= 0;
     
    #20   rstn <= 1;
    #10   sel  <= 1;
    #100  rstn <= 0;
    #1    rstn <= 1;
    #120  sel <= 1;
    #30   sel <= 0;  
    #100  rstn <= 0;  
    #10   sel <= 0;
    #80   sel <= 1; 
    #50   rstn <= 1;  
   
   $fwrite(fd,);
   #10 $fdisplay(fd, "Value displayed with $fmonitor");  
//   $fmonitor(fd,"time=%0t clk=%0b rstn=%0b out=%0b  sel=%0d",$time,clk,rstn,out, sel); 
    
    // used to display file in desktop but failed$fwrite(fd,"time=%0t clk=%0b rstn=%0b out=%0b  sel=%0d",$time,clk,rstn,out, sel);
    //$fclose("fd");
    
    #150 $finish;  
  end  
  
  initial begin
    //$fdisplay(fd,"Value displayed with the $fmonitorrrr");
    $fmonitor(fd,"time=%0t clk=%0b rstn=%0b out=%0b  sel=%0d",$time,clk,rstn,out, sel);
   // $fwrite(fd,"time=%0t clk=%0b rstn=%0b out=%0b  sel=%0d",$time,clk,rstn,out, sel);
  end
  //to display my_file on desktop
  always@(posedge clk)
  begin
    repeat(10) begin
    $fwrite(fd,"time=%0t clk=%0b rstn=%0b out=%0b  sel=%0d",$time,clk,rstn,out, sel);
    end
    $fclose("fd");
    
  
  end
endmodule  
  
   
