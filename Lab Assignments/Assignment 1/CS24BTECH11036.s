.data
    .dword 90
    .dword -4

.text
main:
    lui x6, 0x10000
    ld x7, 0(x6)
    ld x8, 8(x6)
    beq x7, x0, zero
    beq x8, x0, zero
    srli x10, x7, 63
    srli x11, x8, 63
    sub x3, x3, x3
    sub x4, x4, x4
    sub x9, x9, x9
    sub x12, x12, x12
    sub x13, x13, x13
    sub x14, x14, x14
    addi x3, x3, 1
    bne x0, x3, sign
set:  
    add x4, x4, x8
    add x9, x9, x7
    bne x4, x3, loop
sign:
    bne x10, x0, sign1
    bne x11, x0, sign2
    bne x0, x3, set
sign1:
    add x12, x7, x7
    sub x7, x7, x12
    addi x14, x14, 1
    sub x10, x10, x10
    bne x0, x3, sign
sign2:
    add x13, x8, x8
    sub x8, x8, x13
    addi x14, x14, 1
    sub x11, x11, x11
    bne x0, x3, sign
zero:
    sub x9, x9, x9
    bne x0, x3, result
loop:
    add x9, x9, x7
    addi x4, x4, -1
    bne x4, x3, loop
check:
    bne x14, x0, check1
    bne x0, x3, result
check1:
    bne x14, x3, result
    sub x16, x16, x16
    add x16, x9, x9
    sub x9, x9, x16
result:
    sd x9, 50(x6)