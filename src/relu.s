.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
#   a0 (int*) is the pointer to the array
#   a1 (int)  is the # of elements in the array
# Returns:
#   None
# Exceptions:
#   - If the length of the array is less than 1,
#     this function terminates the program with error code 36
# ==============================================================================
relu:
    # Prologue
    ebreak
    mv t0 a0
    li t2 1
    blt a1 t2 err
loop_start:
    # if t2 equal a1 then break loop
    blt a1 t2 loop_end
    lw t1 0(t0)
    bge t1 x0 loop_continue
    # change negative value to 0 and restore to memory
    sw x0 0(t0)
loop_continue:
    addi t0 t0 4
    addi t2 t2 1
    j loop_start
loop_end:
    jr ra
    # Epilogue
err:
    li a0 36
    j exit
exit:
    ecall
