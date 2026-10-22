.data
#.dword count_of_gcd, input11, input12, input21, input22, input31, input32, …
#.dword 2, 20, 24, 21, 45
.dword 3, 12, 3, 125, 50, 32, 16
#.dword 1, 21, 15
.text
    #The following line initializes register x3 with 0x10000000 
    #so that you can use x3 for referencing various memory locations. 
    lui x3, 0x10000
    addi x4, x3, 512
    #your code starts here
    ld x8, 0(x3)
    addi x3, x3, 8
    bne x8, x0, numbers
gcd:
    beq x9, x0, zero
    beq x10, x0, zero
    beq x10, x9, eq
    bgt x9, x10, neg_1
    bgt x10, x9, neg_2
    neg_1:
        sub x9, x9, x10
        bgt x9, x10, neg_1
        bgt x10, x9, neg_2
        add x11, x9, x0
        beq x0, x0, main
    neg_2:
        sub x10, x10, x9
        bgt x10, x9, neg_2
        bgt x9, x10, neg_1
        add x11, x10, x0
        beq x0, x0, main
    eq:
        add x11, x9, x0
        beq x0, x0, main
    zero:
        add x11, x0, x0
    main:
        jalr x0, x1(0)
numbers:
    ld x9, 0(x3)
    ld x10, 8(x3)
    jal x1, gcd
    sd x11, 0(x4)
    addi x3, x3, 16
    addi x4, x4, 8
    addi x8, x8, -1
    bne x8, x0, numbers
exit:
    add x0, x0,x0
    #The final result should be in memory starting from address 0x10000200
    #The first dword location at 0x10000200 contains gcd of input11, input12
    #The second dword location from 0x10000200 contains gcd of input21, input22, and so on.