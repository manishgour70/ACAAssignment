#Prograammer name: Swaraj Kumar
#Prograammer ID: 2019H1030014G
.data
str:
  .asciiz "Please input number.\n"
str0:
  .asciiz "Zero "
str1:
  .asciiz "One "
str2:
  .asciiz "Two "
str3:
  .asciiz "Three "
str4:
  .asciiz "Four "
str5:
  .asciiz "Five "
str6:
  .asciiz "Six "
str7:
  .asciiz "Seven "
str8:
  .asciiz "Eight "
str9:
  .asciiz "Nine "
  .text
  .globl main
main:
  li $v0, 4 # code for printing string
  la $a0, str # the address of str is loaded in a0
  syscall # string printing call
  li $v0, 5 # code for getting integer input
  syscall # input taking call
  addi $s0, $v0, 0
  li $t0, 0
  li $t1, 1 # this t1 will be mulitiplied by 10 again in a loop taking values 10,100,1000...
rep1: # using this loop we will get the number of digits
  addi $t0, $t0, 1
  beqz $v0, d1
  li $t5, 10
  mulou $t1, $t1, $t5
  divu $v0, $v0, 10
  j rep1
d1:
  divu $t1, $t1, 10
  li $t2, 0
rep2:
  divu $t3, $s0, $t1 # get the next most significant digit
  li $t4, 0
  beq $t3, $t4, print0
  addi $t4, $t4, 1
  beq $t3, $t4, print1
  addi $t4, $t4, 1
  beq $t3, $t4, print2
  addi $t4, $t4, 1
  beq $t3, $t4, print3
  addi $t4, $t4, 1
  beq $t3, $t4, print4
  addi $t4, $t4, 1
  beq $t3, $t4, print5
  addi $t4, $t4, 1
  beq $t3, $t4, print6
  addi $t4, $t4, 1
  beq $t3, $t4, print7
  addi $t4, $t4, 1
  beq $t3, $t4, print8
  addi $t4, $t4, 1
  li $v0, 4 # prints  # if nothing is matched 9 is printed here
  la $a0, str9 # the
  syscall # string
  j p_digit
print0:
  li $v0, 4 # prints
  la $a0, str0 # the
  syscall # string
  j p_digit
print1:
  li $v0, 4 # prints
  la $a0, str1 # the
  syscall # string
  j p_digit
print2:
  li $v0, 4 # prints
  la $a0, str2 # the
  syscall # string
  j p_digit
print3:
  li $v0, 4 # prints
  la $a0, str3 # the
  syscall # string
  j p_digit
print4:
  li $v0, 4 # prints
  la $a0, str4 # the
  syscall # string
  j p_digit
print5:
  li $v0, 4 # prints
  la $a0, str5 # the
  syscall # string
  j p_digit
print6:
  li $v0, 4 # prints
  la $a0, str6 # the
  syscall # string
  j p_digit
print7:
  li $v0, 4 # prints
  la $a0, str7 # the
  syscall # string
  j p_digit
print8:
  li $v0, 4 # prints
  la $a0, str8 # the
  syscall # string
p_digit:
  addi $t2, $t2, 1
  mulou $t3, $t3, $t1
  subu $s0, $s0, $t3 # remove the most significant digit
  divu $t1, $t1, 10
  bne $t0, $t2, rep2