module baud_gen #(
    parameter DIV = 4
)(
    input  logic clk,
    input  logic rst_n,
    output logic baud_tick
);

logic [31:0] count;

always_ff @(posedge clk or negedge rst_n) begin

    if (!rst_n) begin
        count <= 0;
        baud_tick <= 0;
    end
    else begin

        if (count == DIV-1) begin
            count <= 0;
            baud_tick <= 1;
        end
        else begin
            count <= count + 1;
            baud_tick <= 0;
        end

    end

end

endmodule
