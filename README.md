# RISC-V Assembly and Computer Architecture Practice

RISC-V assembly programs and architecture exercises: array processing, GCD, series approximation,
memory-mapped LED control and floating-point arithmetic in software. The programs are written for the
[Ripes](https://github.com/mortbopet/Ripes) RISC-V simulator and use the 64-bit base ISA (`ld`, `.dword`).

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## Contents

| Topic | Location | Notes |
|---|---|---|
| Basics: arithmetic, loops, memory | `Lab Assignments/Assignment 1/` | Assembly solution plus the problem statement (`.docx`) |
| GCD over an array of pairs | `Lab Assignments/Assignment 2/` | Euclid's algorithm in assembly, handling zero inputs; results written back to memory |
| Taylor series approximation | `Lab Assignments/Assignment 3/` | Problem statement for a numerical series computation |
| LED / hardware interaction | `Lab Assignments/Assignment 4/` | Memory-mapped I/O style program (`Lab5_…s`) and problem statement |
| Floating-point arithmetic | `Practice Assignments/Lab 6 Optional/` | Software FP arithmetic in assembly (`main.s`) |
| Hardware design practice | `Practice Assignments/Lab 3 Hardware Optional/` | Statement for building an FPU in hardware |
| Past problem sets | `Practice Assignments/HW 1 2022 Practice/`, `HW 2 2024 Practice/` | Instruction-level and memory-behaviour reasoning problems |
| Ripes test programs | `Test files/` | Small `.s` programs (e.g. `Add10Sub5.s`, `2024 Lab 1.s`) and saved HTML problem pages |
| C scratch code | `Practice Assignments/Random codes/Code1.c` | Small C program |

## Running

Open any `.s` file in Ripes (desktop app or the [web version](https://ripes.me/)), assemble it, and step or
run. Registers and memory update as the program executes; the processor model can be switched between
single-cycle and pipelined to see hazards.

For the C scratch code:

```bash
gcc "Practice Assignments/Random codes/Code1.c" -o code1 && ./code1
```

## License

MIT, see [LICENSE](LICENSE).
