    .section .text
    .globl _start
_start:
    li x5, 42          # x5 = secret
    la x6, array       # x6 = &array
    li x7, 0           # x7 = index
    li x8, 0           # x8 = junk

# Training loop to saturate predictor
train_loop:
    li x9, 10
    li x10, 0
train_loop_iter:
    li x11, 16
    blt x10, x11, train_body
    j train_end
train_body:
    slli x12, x10, 2
    add x13, x6, x12
    lw x14, 0(x13)
    add x8, x8, x14
    addi x10, x10, 1
    j train_loop_iter
train_end:

# Now trigger misprediction
    li x7, 100         # x7 = index = attacker-controlled
    li x9, 16
    blt x7, x9, leak   # mispredicted path?

safe:
    j done

leak:
    add x8, x8, x5     # use secret — this is the leak
    j done

done:
    # End simulation
    li a0, 0
    li a7, 93
    ecall

.section .data
array:
    .word 0:16
