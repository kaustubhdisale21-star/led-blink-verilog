module trafficlight_controller(
input wire clk,
input wire reset,
output reg red,
output reg yellow,
output reg green
);
reg [1:0] state; 
reg [4:0] counter;
 always @(posedge reset or posedge clk) begin
        if (reset) begin
           counter <=0; 
           state <=2'b00;
           end else begin     
            counter<=counter+1;
            if (counter==5)begin
              counter<=0;
          case (state)
        2'b00: state <= 2'b01;   
        2'b01: state <= 2'b10;   
        2'b10: state <= 2'b00; 
       default : state<=2'b00;
        endcase
        end
        end
        end
 always @(*) begin
    case (state)
        2'b00: begin
            red = 1;
            yellow = 0;
            green = 0;
        end
        2'b01: begin
    red = 0;
    yellow = 0;
    green = 1;
end
2'b10: begin
    red = 0;
    yellow = 1;
    green = 0;
end
default: begin
    red = 1;
    yellow = 0;
    green = 0;
end
      
    endcase
 end
    endmodule
