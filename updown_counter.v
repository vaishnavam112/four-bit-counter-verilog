`timescale 1ns / 1ps
module updown_counter(
    input clk, rstn, sel,
    output reg [3:0]out
    );
    always@(posedge clk)
    begin
        if(!rstn)
            out<=4'b0000;
            else if(sel==1)begin
                if(out==15)
                    out<=4'b0000;
                    else
                    out<=out+1;
             end else
             begin
             if(out==0)
                out<=15;
                else
             out<=out-1;
             end
    end
endmodule
