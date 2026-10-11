module stopwatch (
    input wire clk,
    input wire reset,
    output reg [5:0] seconds,
    output reg [5:0] minutes
);

    reg [4:0] clk_counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            clk_counter <= 5'b00000;
            seconds <= 6'b000000;
            minutes <= 6'b000000;
        end else begin
            clk_counter <= clk_counter + 1;
            if (clk_counter == 5) begin
                clk_counter <= 0;
                seconds <= seconds + 1;
                if (seconds == 59) begin
                    seconds <= 0;
                    minutes <= minutes + 1;
                end
            end
        end
    end

endmodule  
