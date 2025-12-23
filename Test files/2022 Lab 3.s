.data
.dword 2
.text
main:
    lui x3, 0x10000
    ld x4, 0(x3)
    addi x5, x0, 1
    beq x4, x0, answer0
    beq x4, x5, answer1
    bne x4, x5, mult
    addi x9, x0, 0
    addi x10, x0, 0
mult:
    addi x6, x0, 1
    addi x7, x4, 0
    addi x8, x7, -1
    add x10, x10, x4
    add x9, x9, x10
    bne x8, x6, Loop
    beq x8, x6, answer
Loop:
    add x9, x10, x9
    addi x8, x8, -1
    bne x8, x6, Loop
mult2:
    addi x4, x4, -1
    sub x10, x9, x4
    sub x9, x9, x9
    addi x11, x11, 1
    bne x4, x5, mult
answer0:
    sub x9, x9, x9
    addi x9, x9, 1
    sd x9, 16(x3)
    beq x9, x0, answer
answer1:
    sub x9, x9, x9
    addi x9, x9, 1
    sd x9, 16(x3)
answer:
    sd x9, 16(x3)