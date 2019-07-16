module reciever_encoding_module(
    input clk,
    input wire [3:0] ttl_pulses,
    output reg [1:0] out,
    output wire pulse_detected
);

reg pulse_detected_reg;

always @(posedge clk ) begin

    case (ttl_pulses)
        4'b0001: out <= 1;
        4'b0010: out <= 1;
        4'b0100: out <= 1;
        4'b1000: out <= 1;
        default: out <= 0; 
    endcase
    
    // out <= ttl_pulses[0] ? 0 : (
    //     ttl_pulses[1] ? 1: (ttl_pulses[2] ? 2 : 3)
    // );
    pulse_detected_reg <= |ttl_pulses;
end

assign pulse_detected = pulse_detected_reg ? 1 : 0;

endmodule // reciever_decoding_module