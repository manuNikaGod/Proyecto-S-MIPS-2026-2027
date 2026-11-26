.data
msg_bne_ok:   .asciiz "bne  : PASS\n"
msg_bne_fail: .asciiz "bne  : FAIL\n"

.text
.globl main
main:
    addi $t0, $zero, 7
    addi $t1, $zero, 8
    bne  $t0, $t1, bne_salta_ok
    j    bne_fail

bne_salta_ok:
    addi $t0, $zero, 3
    addi $t1, $zero, 3
    bne  $t0, $t1, bne_fail
    j    bne_pass

bne_fail:
    addi $a0, $gp, 13
    j    print_bne

bne_pass:
    addi $a0, $gp, 0

print_bne:
    addi $v0, $zero, 4
    syscall

    addi $v0, $zero, 10
    syscall