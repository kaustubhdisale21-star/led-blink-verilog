module stopwatch_tb;

    reg clk;
    reg reset;
    wire [5:0] seconds;
    wire [5:0] minutes;

    stopwatch uut (.clk(clk), .reset(reset), .seconds(seconds), .minutes(minutes));

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
        $dumpvars(0, stopwatch_tb);
    end

endmodule

