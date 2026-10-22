# Matrix Multiplication in RISC-V using x0-x31
# C = A * B
# A: m x n, B: n x p, C: m x p
# Row-major order, integer matrices

    .data
m:  .word 2
n:  .word 3
p:  .word 2

A:  .word 1,2,3,4,5,6
B:  .word 7,8,9,10,11,12
C:  .word 0,0,0,0   # 2x2 result

    .text
    .globl _start
_start:
    lw  x1, m      # x1 = m
    lw  x2, n      # x2 = n
    lw  x3, p      # x3 = p

    la  x4, A      # x4 = base address of A
    la  x5, B      # x5 = base address of B
    la  x6, C      # x6 = base address of C

    xor x7, x7, x7 # i = 0

row_loop:
    bge x7, x1, done
    xor x8, x8, x8 # j = 0

col_loop:
    bge x8, x3, next_row
    xor x9, x9, x9 # k = 0
    xor x10, x10, x10 # sum = 0

mul_loop:
    bge x9, x2, store_sum

    # A[i][k]
    mul x11, x7, x2       # i*n
    add x11, x11, x9      # i*n + k
    slli x11, x11, 2
    add x12, x4, x11
    lw  x13, 0(x12)

    # B[k][j]
    mul x14, x9, x3       # k*p
    add x14, x14, x8      # k*p + j
    slli x14, x14, 2
    add x15, x5, x14
    lw  x16, 0(x15)

    mul x17, x13, x16
    add x10, x10, x17

    addi x9, x9, 1
    j mul_loop

store_sum:
    # C[i][j]
    mul x11, x7, x3       # i*p
    add x11, x11, x8      # i*p + j
    slli x11, x11, 2
    add x12, x6, x11
    sw x10, 0(x12)

    addi x8, x8, 1
    j col_loop

next_row:
    addi x7, x7, 1
    j row_loop

done:
    # Exit
    li x17, 93
    li x10, 0
    ecall