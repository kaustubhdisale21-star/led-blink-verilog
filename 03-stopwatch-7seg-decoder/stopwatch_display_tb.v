module stopwatch_display_tb;
    reg clk;
    reg reset;
    wire [6:0] sec_ones_seg;
    wire [6:0] sec_tens_seg;
    wire [6:0] min_ones_seg;
    wire [6:0] min_tens_seg;
   stopwatch_display uut (
    .clk(clk),
    .reset(reset),
    .sec_ones_seg(sec_ones_seg),
    .sec_tens_seg(sec_tens_seg),
    .min_ones_seg(min_ones_seg),
    .min_tens_seg(min_tens_seg)
);
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        reset = 1;
        #20 reset = 0;
        #4000;
        $finish;
    end
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, stopwatch_display_tb);
    end
endmodule
