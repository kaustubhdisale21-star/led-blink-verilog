module seven_seg_decoder_tb;

    reg [3:0] digit;
    wire [6:0] segments;
    integer i;

    seven_seg_decoder uut (.digit(digit), .segments(segments));

    initial begin
        for (i = 0; i < 10; i = i + 1) begin
            digit = i;
            #10 $display("digit=%d segments=%b", digit, segments);
        end

        digit = 4'd12;   // not a valid digit, to test the default case
        #10 $display("digit=%d segments=%b", digit, segments);

        $finish;
    end

endmodule
