.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int arrays
# Arguments:
#   a0 (int*) is the pointer to the start of arr0
#   a1 (int*) is the pointer to the start of arr1
#   a2 (int)  is the number of elements to use
#   a3 (int)  is the stride of arr0
#   a4 (int)  is the stride of arr1
# Returns:
#   a0 (int)  is the dot product of arr0 and arr1
# Exceptions:
#   - If the number of elements to use is less than 1,
#     this function terminates the program with error code 36
#   - If the stride of either array is less than 1,
#     this function terminates the program with error code 37
# =======================================================
dot:

    # Prologue
    # i=0
    li t0 0
    # res
    li t4 0
    # step byte number
    slli a3 a3 2
    slli a4 a4 2
    bge x0 a2 err1
    bge x0 a3 err2
    bge x0 a4 err2
loop_start:
    bge t0 a2 loop_end
    lw t1 0(a0)
    lw t2 0(a1)
    #calculate
    mul t1 t1 t2
    add t4 t4 t1
    add a0 a0 a3 
    add a1 a1 a4  
    addi t0 t0 1
    j loop_start
loop_end:
    # Epilogue
    mv a0 t4
    jr ra
    
err1:
    li a0 36
    j exit
err2:
    li a0 37
    j exit
exit:
    ecall