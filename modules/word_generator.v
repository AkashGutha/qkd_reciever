module word_generator(
    input clk,
    input read_enable,
    output reg [15:0] out
);

reg [15:0] word_reg;

always @(posedge clk ) begin
    if(read_enable) begin
        out <= word_reg;
        word_reg <= word_reg + 1;
    end

    if (word_reg == 9) begin
        word_reg <= 0;
    end
end

endmodule // word_generator