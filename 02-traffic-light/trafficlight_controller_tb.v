 //testbench
      module trafficlight_controller_tb;
      reg clk;
      reg reset;
      wire red,yellow,green;
      trafficlight_controller uut(.clk(clk),.reset(reset),.red(red),.yellow(yellow),.green(green));
      initial begin
        clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    reset=1;
    #20 reset=0;
    #200;
    $finish;
    end
    initial begin
      $dumpfile("dump.vcd");
    $dumpvars(0,trafficlight_controller_tb );
end
endmodule
  
