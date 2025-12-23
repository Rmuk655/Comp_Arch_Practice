#starts at 0x10000000
.data
#fp_exponent_bits - number of exponent bits. It should be 11 for double precision number
#fp_mantissa_bits - number of mantissa bits. It should be 52 for double precision number
.dword 11, 52
#starts at 0x10000010
#count_of_floating_pairs - tells the number of floating point pairs to be operated upon.
#.dword count_of_floating_pairs, input11, input12, input21, input22, input31, input32, ...
.dword 1
.dword 0x3fd2c00000000000, 0x40a22676f31205e7
#.dword 2
#.dword 0x409fa0cf5c28f5c3, 0x4193aa8fc4f0a3d7
#.dword 0x40e699d2003eea21, 0x420e674bcb5a1877
.text
#The following line initializes register x3 with 0x10000000 
#so that you can use x3 for referencing various memory locations.
lui x3, 0x10000
addi x4, x3, 512 #x4 stores the address in memory where the outputs are stored.
ld x8, 0(x3) #x8 stores the number of exponent bits taken from input.
ld x9, 8(x3) #x9 stores the number of mantissa bits taken from input.
add x10, x9, x8 #x10 stores the number of bits used in the floating point representation.
addi x5, x0, 63
sub x6, x5, x10
blt x6, x0, error #If x0 = 0 > 63 - x10 = 63 - (x8 + x9) then we report an error.
addi x2, x0, 1
sll x30, x2, x10 #x30 = 10....(x10 0s).
addi x8, x8, -1
sll x29, x2, x8 #x29 = 10...(x8 - 1 0s).
addi x8, x8, 1
addi x29, x29, -1 #x29 stores the value of the base.
add x31, x29, x29
addi x31, x31, 1 #x31 stores all 1s for exponent bits.
sll x28, x2, x9 
addi x28, x28, -1 #x28 stores 1 at all mantissa bits.
addi x3, x3, 16 #We start reading from the next set of inputs.
loop_p1:
    ld x11, 0(x3)
    ld x12, 8(x3)
    ld x13, 16(x3)
    
    and x14, x12, x30 #x14 stores sign bit of number 1.
    and x15, x12, x28 #x15 stores mantissa bits of number 1.
    sub x16, x12, x14
    sub x16, x12, x15
    srl x16, x16, x9
    sub x16, x16, x29 #x16 stores the value of exponent of number 1.
    
    and x17, x13, x30 #x17 stores sign bit of number 2.
    and x18, x13, x28 #x18 stores mantissa bits of number 2.
    sub x19, x13, x17
    sub x19, x13, x18
    srl x19, x19, x9
    sub x19, x19, x29 #x19 stores the value of the exponent of number 2.
    
    beq x16, x31, Nan_Inf_1
    beq x19, x31, Nan_Inf_2
    jal x0, fp64add
Nan_Inf_1:
    beq x15, x0, inf_1
    sd x12, 0(x4)
    sd x12, 8(x4)
    addi x3, x3, 24
    addi x11, x11, -1
    bne x11, x0, loop_p1
inf_1:
    
Nan_Inf_2:
    beq x18, x0, inf_2
    sd x13, 0(x4)
    sd x13, 8(x4)
    addi x3, x3, 24
    addi x11, x11, -1
    bne x11, x0, loop_p1
inf_2:
    
#x25 stores result of add.
#x26 stores result of mul.
fp64add:
    sll x21, x2, x9
    add x21, x21, x15
    beq x14, x0, no_sign_1
    sign_1:
        sub x21, x0, x21 #If the first number has sign bit 1, make it negative.
    no_sign_1:
        sll x22, x2, x9
        add x22, x22, x18
        beq x17, x0, no_sign_2
    sign_2:
        sub x22, x0, x22 #If the first number has sign bit 2, make it negative.
    no_sign_2:
        blt x16, x19, case_3
        sub x20, x16, x19
        bge x20, x8, case_2
    case_1:
        sub x20, x20, x8
        sll x21, x21, x8
        sub x20, x8, x20
        sll x22, x22, x20
        add x23, x21, x22
        jal x0, result
    case_2:
        sub x20, x20, x8
        sll x21, x21, x8
        sub x20, x20, x8
        srl x22, x22, x20
        add x23, x21, x22
        jal x0, result
    case_3:
        sub x20, x19, x16
        bge x20, x8, case_4
        sll x22, x22, x8
        sub x20, x8, x20
        sll x21, x21, x20
        add x23, x21, x22
        jal x0, result
    case_4:
        sll x22, x22, x8
        sub x20, x20, x8
        srl x21, x21, x20
        add x23, x21, x22
    result:
        
fp64mul:
    dmult:
loop_back:
    addi x3, x3, 24
    addi x11, x11, -1
    beq x11, x0, exit
looping:
    jal x0, loop_p1
error:
    jal x0, exit
exit:
    sub x0, x0, x0
#The final result should be in memory starting from address 0x10000200
#The first dword location at 0x10000200 contains sum of input11, input12
#The second dword location at 0x10000200 contains product of input11, input12
#The third dword location from 0x10000200 contains sum of input21, input22,
#The fourth dword location from 0x10000200 contains product of input21, input22, and so on.