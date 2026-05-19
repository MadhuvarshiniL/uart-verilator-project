module tb_uart_tx;

logic clk;
logic rst_n;

logic tx_start;
logic [7:0] tx_data;

logic tx;
logic busy;

uart_tx dut(
    .clk(clk),
    .rst_n(rst_n),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx(tx),
    .busy(busy)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("uart_wave.vcd");
    $dumpvars(0, tb_uart_tx);

    clk = 0;
    rst_n = 0;

    tx_start = 0;
    tx_data = 8'h00;

    #20;

    rst_n = 1;

    #20;

    tx_data = 8'hA5;
    tx_start = 1;

    #10;
    tx_start = 0;

    #500;

    $finish;

end

always @(posedge clk) begin
    $display("TIME=%0t TX=%b BUSY=%b", $time, tx, busy);
end

endmodule
