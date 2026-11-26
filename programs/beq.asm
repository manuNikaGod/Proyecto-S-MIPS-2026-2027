.data
msg_beq_ok:   .asciiz "beq  : PASS\n"
msg_beq_fail: .asciiz "beq  : FAIL\n"

.text
.globl main
main:
    addi $t0, $zero, 5
    addi $t1, $zero, 5
    beq  $t0, $t1, beq_salta_ok
    j    beq_fail

beq_salta_ok:
    addi $t0, $zero, 1
    addi $t1, $zero, 2
    beq  $t0, $t1, beq_fail
    j    beq_pass

beq_fail:
    addi $a0, $gp, 13
    j    print_beq

beq_pass:
    addi $a0, $gp, 0

print_beq:
    addi $v0, $zero, 4
    syscall

    addi $v0, $zero, 10
    syscall