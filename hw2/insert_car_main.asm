.include "data.asm"
.include "hw2.asm"

.data
nl: .asciiz "\n"
insert_car_output: .asciiz  "insert_car output: "
test_vin: .asciiz "AAAAABBBBBBBBBBCC"
test_car: .word test_vin
.word make_A
.word model_D
.byte 255, 255
.byte 12, 0

.align 2
expected_all_cars:
.word test_vin
.word make_A
.word model_D
.byte 255, 255
.byte 12, 0

.word vin_00
.word make_A
.word model_A
.byte 110, 7
.byte 8
.byte 0

.word vin_01
.word make_D
.word model_B
.byte 115, 7
.byte 8
.byte 0

.word vin_02
.word make_A
.word model_C
.byte 225, 7
.byte 12
.byte 0

.word vin_03
.word make_E
.word model_D
.byte 175, 7
.byte 10
.byte 0

.word vin_04
.word make_A
.word model_E
.byte 122, 7
.byte 5
.byte 0

.word vin_05
.word make_C
.word model_F
.byte 150, 7
.byte 10
.byte 0

.text
.globl main

main:
la $a0, insert_car_output
li $v0, 4
syscall
la $a0, all_cars
li $a1, 6
la $a2, test_car 
li $a3, 6
jal insert_car
move $a0, $v0
li $v0, 1
syscall

beq $a0, -1, ending
la $a0, nl
li $v0, 4
syscall

li $t9, 7
la $s4, all_cars
loop_cars:
	lw $t0, ($s4)
	move $a0, $t0
	li $v0, 4
	syscall
	li $a0, ' '
	li $v0, 11
	syscall
	addi $s4, $s4, 4
	lw $t0, ($s4)
	move $a0, $t0
	li $v0, 4
	syscall
	li $a0, ' '
	li $v0, 11
	syscall
	addi $s4, $s4, 4
	lw $t0, ($s4)
	move $a0, $t0
	li $v0, 4
	syscall
	li $a0, ' '
	li $v0, 11
	syscall
	addi $s4, $s4, 4
	lb $t0, ($s4)
	move $a0, $t0
	li $v0, 1
	syscall
	li $a0, ' '
	li $v0, 11
	syscall
	addi $s4, $s4, 1
	lb $t0, ($s4)
	move $a0, $t0
	li $v0, 1
	syscall
	li $a0, ' '
	li $v0, 11
	syscall
	addi $s4, $s4, 1
	lb $t0, ($s4)
	move $a0, $t0
	li $v0, 1
	syscall
	li $a0, ' '
	li $v0, 11
	syscall
	addi $s4, $s4, 1
	lb $t0, ($s4)
	move $a0, $t0
	li $v0, 1
	syscall
	li $a0, ' '
	li $v0, 11
	syscall 
	
	la $a0, nl
	li $v0, 4
	syscall
	
	addi $s4, $s4, 1

	addi $t9, $t9, -1
	beqz $t9, ending 

	j loop_cars

ending:
	la $a0, nl
	li $v0, 4
	syscall
	li $v0, 10
	syscall


