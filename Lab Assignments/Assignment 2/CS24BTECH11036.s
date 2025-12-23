.data
.dword 6, 12, 3, 125, 50, 32, 32, 0, 0, 19, 0, 0, 2
.text
main: 
    lui x3, 0x10000     
    addi x1, x3, 504
    addi x2, x0, 1
    ld x4, 0(x3)
    addi x3, x3, 8
    sub x5, x5, x5
loop:
    ld x10, 0(x3)
    ld x11, 8(x3)
    addi x1, x1, 8
    addi x3, x3, 16
    addi x4, x4, -1
    beq x10, x0, zero
    beq x11, x0, zero
    bne x10, x11, gcd
    add x5, x0, x10
    sd x5, 0(x1)
    beq x0, x0, cont_loop
gcd:
    bgt x10, x11, gcdg
    blt x10, x11, gcdl
gcdg:
    sub x10, x10, x11
    beq x10, x11, equal
    addi x5, x2, 0
    beq x10, x2, one
    beq x0, x0, gcd
gcdl:
    sub x11, x11, x10
    beq x10, x11, equal
    beq x11, x2, one 
    beq x0, x0, gcd
one:
    addi x5, x2, 0
    sd x5, 0(x1)
    bne x4, x0, loop
    beq x0, x0, cont_loop
equal:
    addi x5, x10, 0
    sd x5, 0(x1)
    bne x4, x0, loop
    beq x0, x0, cont_loop
zero:
    sub x5, x5, x5
    sd x5, 0(x1)
    bne x4, x0, loop
cont_loop:
    bne x4, x0, loop