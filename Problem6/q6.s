#Prograammer name: Swaraj Kumar
#Prograammer ID: 2019H1030014G
.data
next_line:
  .asciiz "\n"
  .text
  .globl main
main:
  li $s0, 2 # 2 is the smallest prime
  li $s1, 20 # number of primes to be calculated
  li $s2, 0 # counts the number of found primes
rep1:
  addi $a0, $s0, 0 
  jal test_prime
  addi $s0, $s0, 1
  beqz $v0, rep1 # if ($v0 == 0) then $s0 is not prime!
  addi $s2, $s2, 1 # increase the count of prime because v0 is 1
  li $v0, 1
  addi $a0, $s0, -1 
  syscall # to print the prime number
  li $v0, 4
  la $a0, next_line
  syscall
  bne $s1, $s2, rep1
  li	$v0, 10 # 10 is the code to exit the program
	syscall

test_prime:
	li $t0, 2
test_loop:
  beq $t0, $a0, found_prime # if t0 == a0 then no divisors found between 2 to that number.
  div $a0, $t0
  mfhi $t1 # remainder of the division is stored in mfhi register
  addi $t0, $t0, 1 #incrementing the numbers everytime +1 to divide the testing number from 2 to that number
  bnez $t1, test_loop
  addi $v0, $zero, 0
  jr $ra
found_prime:
  addi $v0, $zero, 1
  jr $ra