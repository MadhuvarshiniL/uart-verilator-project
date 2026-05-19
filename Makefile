SIM = verilator

TOP = tb_uart_tx

RTL = rtl/*.sv
TB  = tb/*.sv

sim:
	$(SIM) --trace --timing --binary \
	--top-module $(TOP) \
	$(RTL) $(TB)

run:
	./obj_dir/V$(TOP)

waves:
	gtkwave uart_wave.vcd

clean:
	rm -rf obj_dir *.vcd
