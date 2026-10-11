module led_blink(
input wire clk, 
input wire reset, 
output reg led
);
reg [25:0] counter; 
 always @(posedge reset or posedge clk) begin             
         if (reset) begin
           counter <= 26'b0 ;
           led <=1'b0; 
        end 
        else begin
            counter <= counter +1;
            if (counter == 10) begin                                                                     
             led <=~led;                         
            counter <=26'b0;
            end
        end
end
endmodule

