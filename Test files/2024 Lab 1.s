.data
#The following line defines the 15 values present in the memory.
# We would use different values in our evaluation and
# hence you should try various combinations of these values in your testing.
.dword 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 523, 524, 525, 533, 512
#(dword stands for doubleword)

.text
    #The following line initializes register x3 with 0x10000000 
    #so that you can use x3 for referencing various memory locations. 
    lui x3, 0x10000
    #your code starts here    
    ld x4, 0(x0)
    ld x5, 8(x0)
    ld x6, 16(x0)
    ld x7, 24(x0)
    ld x8, 32(x0)
    ld x9, 40(x0)
    ld x11, 48(x0)
    ld x12, 56(x0)
    ld x13, 64(x0)
    ld x14, 72(x0)
    ld x15, 80(x0)
    ld x16, 88(x0)
    ld x17, 96(x0)
    ld x18, 104(x0)
    ld x19, 112(x0)
    add x10, x0, x4
    add x10, x10, x5
    add x10, x10, x6
    add x10, x10, x7
    add x10, x10, x8
    add x10, x10, x9
    add x10, x10, x11
    add x10, x10, x12
    add x10, x10, x13
    add x10, x10, x14
    sub x10, x10, x15
    sub x10, x10, x16
    sub x10, x10, x17
    sub x10, x10, x18
    sub x10, x10, x19
    #The final result should be in register x10