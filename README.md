# MIPS-like Processor Implementation

This repository contains Verilog modules for a MIPS-like processor. The modules include components like a Program Counter (PC), Arithmetic Logic Units (ALU), Data Memory, Registers, and more. These modules are designed to work together to simulate the behavior of a simple processor.

## Verilog Modules Overview

- **ALU**: Arithmetic Logic Unit with support for addition, subtraction, and other operations.
- **Control**: Control unit for managing instruction decoding and control signals.
- **Data Memory**: Memory module for storing and retrieving data.
- **Instruction Memory**: Memory module for storing instructions.
- **MUX and Shift**: Modules for multiplexing and shifting operations.
- **Register Bank**: Module for managing registers.
- **PC (Program Counter)**: Module for managing program execution flow.
- **Full Adder (FA)**: Full adder implementation.

## Testbench (test.v)

The `test` module provides a testbench environment, instantiating the processor components. It includes an oscillator for clock generation, a program counter, and various control signals for testing the processor's functionality.

### Author
Shima Baniadamdizaj
Email: baniadam.shima@gmail.com
