.data
.dword 1, 2, 3
#.dword 3, 12, 3, 125, 50, 32, 16
#count_of_gcd, input11, input12, input21, input22, input31, input32, …
.text
    #The following line initializes register x3 with 0x10000000 
    #so that you can use x3 for referencing various memory locations. 
    lui x3, 0x10000
    #your code starts here
    lui x2, 0x10000
    addi x2, x2, 200
    addi x10, x0, 1
    sd x4, 0(x3)
    bne x4, x0, loop
loop:
    addi x3, x3, 8
    sd x5, 0(x3)
    addi x3, x3, 8
    sd x6, 0(x3)
    bne x5, x6, gcd
    addi x7, x5, 0
    sd x7, 0(x2)
    addi x4, x4, -1
    addi x2, x2, 8
    bne x4, x0, loop
gcd:
    bge x5, x6, loop2
    sub x6, x6, x5
    bne x6, x10, loop3
    sd x7, 0(x2)
    addi x4, x4, -1
    addi x2, x2, 8
    bne x4, x0, loop
loop2:
    sub x5, x5, x6
    bne x5, x10, loop3
    sd x7, 0(x2)
    addi x4, x4, -1
    addi x2, x2, 8
    bne x4, x0, loop
loop3:
    sd x7, 0(x2)
    addi x4, x4, -1
    addi x2, x2, 8
    bne x4, x0, loop
    #The final result should be in memory starting from address 0x10000200
    #The first dword location at 0x10000200 contains gcd of input11, input12
    #The second dword location from 0x10000200 contains gcd of input21, input22, and so on.
