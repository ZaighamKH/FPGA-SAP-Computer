# FPGA-SAP-Computer
FPGA implementation of SAP (Simple as possible) Computer based on the book Digital Computer Electronics by Malvino and Brown.
This project is part of the process to learn FPGA design and Verilog.

This project was completed using Vivado by Xilinx.

# SAP 1 - Block diagram

The goal is to implement the following design

![image](https://github.com/ZaighamKH/FPGA-SAP-Computer/assets/119772901/c86a2ede-959f-4d02-9e36-ce4e44908da6)

# SAP 1 - Simulation Results

The system was tested on simulation. The following set of commands were given:
1. Load A with the value at address $D (3)
2. Add to it the value at address $E (4)
3. Subtract to it from the value at adress $F (2)
4. Halt

Final value at A should be 5 (3+4-2 = 5) which can be seen in the simulation results

![Screenshot (10)](https://github.com/ZaighamKH/FPGA-SAP-Computer/assets/119772901/0ecd1dfe-bfd5-4e18-a5f9-d0f20c3dbdd5)

# Future Goals

Update SAP 1 to SAP 2 and eventually SAP 3 to further improve understanding of fpga design, hardware description language and computer architecture.
