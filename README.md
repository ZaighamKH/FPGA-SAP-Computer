# FPGA-SAP-Computer
FPGA implementation of SAP (Simple as possible) Computer based on the book Digital Computer Electronics by Malvino and Brown.
This project is part of the process to learn FPGA design and Verilog.

This project was completed using Vivado by Xilinx.

# SAP 1 - Block Diagram

The goal is to implement the following design:


![image](https://github.com/ZaighamKH/FPGA-SAP-Computer/assets/119772901/6c9cb284-dd37-4577-8fa8-92c7bd4e24dc)


# SAP 1 - Simulation Results

The system was tested in vivado simulation. The following set of commands were given:
1. Load A with the value at address $D (3)
2. Add to it the value at address $E (4)
3. Subtract to it from the value at address $F (2)
4. Halt

The final value at A should be 5 (3+4-2 = 5), which can be seen in the simulation results

![Screenshot (10)](https://github.com/ZaighamKH/FPGA-SAP-Computer/assets/119772901/1fd55d26-4c96-4534-b358-d8c615c80874)
