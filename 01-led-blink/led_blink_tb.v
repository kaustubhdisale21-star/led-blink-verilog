//testbench
module led_blink_tb;

    reg clk;
    reg reset;
    wire led;
    led_blink uut (.clk(clk), .reset(reset), .led(led));
initial begin
    clk = 0;  
    forever #5 clk = ~clk;   
end
initial begin
    reset = 1;   
     #20 reset = 0;   
     #200;         
    $finish;
    end
    initial begin
$dumpfile("dump.vcd");
    $dumpvars(0, led_blink_tb);
end
endmodule
