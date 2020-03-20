#Prograammer name: Swaraj Kumar
#Prograammer ID: 2019H1030014G
.data
str1:
  .asciiz "input number."
str2:
  .asciiz "Ans is : "
  .text
  .globl main
main:
  li $s0, 0 # result
loop:
  li $v0, 4 # 4 is code for printing
  la $a0, str1 # the
  syscall # this syscall print the string "input number"
  li $v0, 5 # 5 is the system call code for reading integer
  syscall # this syscall takes the integer input from user
  beqz $v0, end # if user enters 0 it will go to end label.
  add $s0, $s0, $v0 # adding the current number to sum
  j loop # jummping to loop label
end:
  li $v0, 4 # prints
  la $a0, str2 # the
  syscall # string
  li $v0, 1
  move $a0, $s0
  syscall