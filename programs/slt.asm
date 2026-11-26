.data
msg_slt_ok:   .asciiz "slt  : PASS\n"
msg_slt_fail: .asciiz "slt  : FAIL\n"

.text
.globl main
main:
    addi $t0, $zero, 5
    addi $t1, $zero, 10
    slt  $t2, $t0, $t1
    addi $t3, $zero, 1
    beq  $t2, $t3, slt_parte1_ok
    j    slt_fail

slt_parte1_ok:
    addi $t0, $zero, 10
    addi $t1, $zero, 5
    slt  $t2, $t0, $t1
    addi $t3, $zero, 0
    beq  $t2, $t3, slt_pass
    j    slt_fail

slt_fail:
    addi $a0, $gp, 13
    j    print_slt

slt_pass:
    addi $a0, $gp, 0

print_slt:
    addi $v0, $zero, 4
    syscall

    addi $v0, $zero, 10
    syscall