.data
msg_add_ok:   .asciiz "add  : PASS\n"
msg_add_fail: .asciiz "add  : FAIL\n"

.text
.globl main
main:
    addi $t0, $zero, 10
    addi $t1, $zero, 20
    add  $t2, $t0, $t1

    addi $t3, $zero, 30
    beq  $t2, $t3, add_pass
    addi $a0, $gp, 13
    j    print_add

add_pass:
    addi $a0, $gp, 0

print_add:
    addi $v0, $zero, 4
    syscall

    addi $v0, $zero, 10
    syscall