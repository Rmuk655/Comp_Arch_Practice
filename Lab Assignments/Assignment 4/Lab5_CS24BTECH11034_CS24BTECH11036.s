#Team members:
    #CS24BTECH11036 - Krishnan Ramanarayanan
    #CS24BTECH11034 - Kodavati Sri Sai Mahi Praneeth
.data
L1: .word 10 #100000 	#delay count to be loaded from memory for on
L2: .word 10 #100000   #delay count to be loaded from memory for off
L3: .word 1            #number of times to blink
.text
#YOUR CODE FOLLOWS HERE. The address of the data segment is available in x3
main:
    li x4, 0x0
    
    la x3, L3
    lw x10, 0(x3)
    addi x11, x10, 0
#Part 1
on_1:
    #Turn the LED on.
    li x5, 1
    sw x5, 0(x4)
    #Get the loop counter value from memory
    la x3, L1
    lw x8, 0(x3)
delay_1:
    addi x8, x8, -1
    bne x8, x0, delay_1
off_1:
    #Turn the LED off.
    li x5, 0
    sw x5, 0(x4)
#Part 2
on_2:
    #Turn the LED on.
    li x5, 1
    sw x5, 0(x4)
    la x3, L1
    lw x8, 0(x3)
delay_on_2:
    addi x8, x8, -1
    bne x8, x0, delay_on_2
off_2:
    #Turn the LED off.
    li x5, 0
    sw x5, 0(x4)
    la x3, L1
    lw x8, 0(x3)
delay_off_2:
    addi x8, x8, -1
    bne x8, x0, delay_off_2
blink_2:
    addi x11, x11, -1
    bne x11, x0, on_2
    addi x11, x10, 0
#Part 3
on_3:
    #Turn the LED on.
    li x5, 1
    sw x5, 0(x4)
    la x3, L1
    lw x8, 0(x3)
delay_on_3:
    addi x8, x8, -1
    bne x8, x0, delay_on_3
off_3:
    #Turn the LED off.
    li x5, 0
    sw x5, 0(x4)
    la x3, L2
    lw x9, 0(x3)
delay_off_3:
    addi x9, x9, -1
    bne x9, x0, delay_off_3
blink_3:
    addi x11, x11, -1
    bne x11, x0, on_3
    addi x11, x10, 0
exit:
    add x0, x0, x0