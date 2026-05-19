module uart_tx (

    input  logic       clk,
    input  logic       rst_n,
    input  logic       tx_start,
    input  logic [7:0] tx_data,

    output logic       tx,
    output logic       busy

);

logic baud_tick;

baud_gen baud_inst(
    .clk(clk),
    .rst_n(rst_n),
    .baud_tick(baud_tick)
);

typedef enum logic [1:0] {
    IDLE,
    START,
    DATA,
    STOP
} state_t;

state_t state;

logic [2:0] bit_index;

always_ff @(posedge clk or negedge rst_n) begin

    if (!rst_n) begin

        state <= IDLE;
        tx <= 1'b1;
        busy <= 0;
        bit_index <= 0;

    end
    else begin

        case(state)

            IDLE: begin

                tx <= 1'b1;
                busy <= 0;

                if (tx_start) begin
                    state <= START;
                    busy <= 1;
                end

            end

            START: begin

                if (baud_tick) begin
                    tx <= 1'b0;
                    state <= DATA;
                    bit_index <= 0;
                end

            end

            DATA: begin

                if (baud_tick) begin

                    tx <= tx_data[bit_index];

                    if (bit_index == 7)
                        state <= STOP;
                    else
                        bit_index <= bit_index + 1;

                end

            end

            STOP: begin

                if (baud_tick) begin
                    tx <= 1'b1;
                    state <= IDLE;
                    busy <= 0;
                end

            end

        endcase

    end

end

endmodule
