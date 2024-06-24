.globl argmax

.text
# =================================================================
# FUNCTION: Given a int array, return the index of the largest
#   element. If there are multiple, return the one
#   with the smallest index.
# Arguments:
#   a0 (int*) is the pointer to the start of the array
#   a1 (int)  is the # of elements in the array
# Returns:
#   a0 (int)  is the first index of the largest element
# Exceptions:
#   - If the length of the array is less than 1,
#     this function terminates the program with error code 36
# =================================================================
argmax:
    # Prologue
    # max= a[0] t0:max
    lw t0 0(a0)
    # index= 0
    li t1 0
    # i= 1
    li t2 1
    bge x0 a1 err
loop_start:
    bge t2 a1 loop_end
    #get a[i]
    addi a0 a0 4
    lw t3 0(a0)
    # compare
    bge t0 t3 loop_continue # if max>=a[i] jump to loop_continue
    mv t0 t3 
    mv t1 t2
loop_continue:
    addi t2 t2 1
    j loop_start
loop_end:
    # Epilogue
    mv a0 t1
    jr ra
err:
    li a0 36
    j exit
exit:
    ecall
    
