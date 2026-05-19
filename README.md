# UART Transmitter Project

This project is a simple UART Transmitter designed using SystemVerilog and simulated using Verilator.

The project demonstrates:
- UART transmission
- FSM-based design
- Verilator simulation
- GTKWave waveform debugging
- Makefile automation
- Bender dependency management

---

# Project Structure

uart_project/
├── rtl/
│   ├── baud_gen.sv
│   └── uart_tx.sv
│
├── tb/
│   └── tb_uart_tx.sv
│
├── Makefile
├── Bender.yml
└── README.md

---

# Tools Used

- Verilator
- GTKWave
- Makefile
- Bender
- Git/GitHub

---

# How to Run

## Compile

```bash
make sim
