module stopwatch_display (
    input wire clk,
    input wire reset,
    output wire [6:0] sec_ones_seg,
    output wire [6:0] sec_tens_seg,
    output wire [6:0] min_ones_seg,
    output wire [6:0] min_tens_seg
);

    wire [5:0] seconds;
    wire [5:0] minutes;

    stopwatch sw (.clk(clk), .reset(reset), .seconds(seconds),.minutes(minutes));

    wire [3:0] sec_tens = seconds / 10;
    wire [3:0] sec_ones = seconds % 10;
    wire [3:0] min_tens=minutes / 10;
    wire [3:0] min_ones=minutes % 10;

    seven_seg_decoder d_sec_ones (.digit(sec_ones), .segments(sec_ones_seg));
    seven_seg_decoder d_sec_tens (.digit(sec_tens), .segments(sec_tens_seg));
    seven_seg_decoder d_min_ones (.digit(min_ones), .segments(min_ones_seg));
    seven_seg_decoder d_min_tens (.digit(min_tens), .segments(min_tens_seg));
endmodule
