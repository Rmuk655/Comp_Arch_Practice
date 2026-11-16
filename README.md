# RISC-V Assembly and Computer Architecture Practice

RISC-V assembly programs and architecture exercises: array processing, GCD, series approximation,
memory-mapped LED control and software floating-point arithmetic. The programs are written for the
[Ripes](https://github.com/mortbopet/Ripes) RISC-V simulator and use the 64-bit base ISA (`ld`, `.dword`).

## Contents

| Topic | Location | Notes |
|---|---|---|
| Signed 64-bit arithmetic on a pair of values | `Lab Assignments/Assignment 1/` | Sign extraction by shifts and zero handling in assembly, plus the problem statement (`.docx`) |
| GCD over an array of pairs | `Lab Assignments/Assignment 2/` | GCD over pairs stored in the data segment, with zero inputs handled separately |
| Taylor series approximation | `Lab Assignments/Assignment 3/` | Problem statement for a numerical series computation |
| LED / hardware interaction | `Lab Assignments/Assignment 4/` | LED blinking through a memory-mapped store with delay loops whose counts are loaded from memory (`Lab5_…s`, written as a pair), plus the problem statement |
| Floating-point arithmetic | `Practice Assignments/Lab 6 Optional/` | Floating-point operations on IEEE-754 pairs with configurable exponent and mantissa widths (`main.s`) |
| Hardware design practice | `Practice Assignments/Lab 3 Hardware Optional/` | Statement for building an FPU in hardware |
| End-semester lab practice | `End sem Lab practice/` | `GCD Practice.s` and a matrix-multiplication program |
| Homework 5 code | `Homeworks/Homework 5/Code 1/`, `Code 2/`, `Code 3/` | `Code1.s`, `Code2.s`, `Code3.s` |
| Past problem sets | `Practice Assignments/HW 1 2022 Practice/`, `HW 2 2024 Practice/` | Instruction-level and memory-behaviour reasoning problems |
| Ripes test programs | `Test files/` | Small `.s` programs (e.g. `Add10Sub5.s`, `2024 Lab 1.s`) and the saved problem pages (`.html`). `2024 Lab 2.s` is an unfinished early draft of the GCD lab and does not terminate; the working solution is in `Lab Assignments/Assignment 2/` |
| Floating-point precision demo | `Practice Assignments/Random codes/Code1.c` | Shows rounding error in `float` arithmetic (`x + x - x`, `x * x / x` with `x = 0.1f`) printed to 20 digits |

## Running

Open any `.s` file in Ripes (desktop app or the [web version](https://ripes.me/)), assemble it, and step or
run. Registers and memory update as the program executes; the processor model can be switched between
single-cycle and pipelined to see hazards.

Headless runs also work with the Ripes CLI, which reports cycles, retired instructions and registers:

```bash
Ripes --mode cli --src "Lab Assignments/Assignment 2/CS24BTECH11036.s" -t asm --proc RV64_SS --cycles --iret --regs
```

For the C scratch code:

```bash
gcc "Practice Assignments/Random codes/Code1.c" -o code1 && ./code1   # prints y = 0.10000000149011611938, z = 0.10000000894069671631
```

## License

MIT, see [LICENSE](LICENSE).
