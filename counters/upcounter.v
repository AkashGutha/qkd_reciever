module upcounter(
    clk, reset, out
);

parameter DATA_WIDTH = 16;

input clk, reset;
output reg [DATA_WIDTH-1:0] out;

// reg [DATA_WIDTH-1:0] counter_register;

always @(posedge clk ) begin
    if (reset) begin
        out <= { (DATA_WIDTH){1'b0} };
    end else begin
        out <= out + 1;
    end
end

endmodule // upcounter