.data
arr:      .word 52, 50, 51, 49
msg_ok:   .asciiz "BURBUJA : PASS\n"
msg_fail: .asciiz "BURBUJA : FAIL\n"

.text
.globl main
main:
    addi $s0, $zero, 3

outer_loop:
    beq  $s0, $zero, verify
    add  $s1, $zero, $zero
    add  $t1, $gp, $zero

inner_loop:
    beq  $s1, $s0, next_outer
    lw   $t2, 0($t1)
    lw   $t3, 4($t1)
    slt  $t4, $t3, $t2
    beq  $t4, $zero, no_swap

    sw   $t3, 0($t1)
    sw   $t2, 4($t1)

no_swap:
    addi $t1, $t1, 4
    addi $s1, $s1, 1
    j    inner_loop

next_outer:
    addi $s0, $s0, -1
    j    outer_loop

verify:
    lw   $t0, 0($gp)
    addi $t5, $zero, 49
    bne  $t0, $t5, fail

    lw   $t0, 4($gp)
    addi $t5, $zero, 50
    bne  $t0, $t5, fail

    lw   $t0, 8($gp)
    addi $t5, $zero, 51
    bne  $t0, $t5, fail

    lw   $t0, 12($gp)
    addi $t5, $zero, 52
    bne  $t0, $t5, fail

    addi $a0, $gp, 16
    addi $v0, $zero, 4
    syscall
    addi $v0, $zero, 10
    syscall

fail:
    addi $a0, $gp, 32
    addi $v0, $zero, 4
    syscall
    addi $v0, $zero, 10
    syscall