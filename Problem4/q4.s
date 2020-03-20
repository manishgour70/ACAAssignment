#Prograammer name: Swaraj Kumar
#Prograammer ID: 2019H1030014G
.data
str1:
  .asciiz "Enter three numbers :"
str2:
  .asciiz "Ans = "
  .text
  .globl main
main:
  li $v0, 4 # 4 is code for printing strings
  la $a0, str1 # this loads address of str1 in $a0
  syscall # this syscall print the string "Enter three numbers :"
  li $v0, 5 # 5 is the system call code for reading integer
  syscall # this syscall takes the integer input from user i.e. input 1
  move $t0, $v0  # $v0 contains input 1 which is moved to $t0
  li $v0, 5 # now we again read the 2nd integer and store it to $v0
  syscall # for storing 2nd integer
  move $t1, $v0 # moving 2nd integer from $v0 to $t1
  li $v0, 5 # now we again read the 2nd integer and store it to $v0
  syscall # for storing 3rd integer
  move $t2, $v0 #storing 3rd integer to t2
  slt $t3, $t0, $t1 # $t3 = 1 iff $t0 < $t1 setting t3 to 1 if t0 is less than t1
  beqz $t3, second # this means $t0 >= $t1 and go to second label
  # if we are here, then $t0 < $t1, so we need to check if $t0 < $t2
  slt $t3, $t0, $t2
  beqz $t3, third # this means $t0 >= $t2. So, $t2 <= $t0 < $t1 and go to third label.
  # if we are here, then $t0 < $t2 and $t0 < $t1, so we sum $t1 and $t2
  add $s0, $t1, $t2 # add t1 and t2 and store to s0
  j end # go to end label
third:
  # if we are here,$t2 <= $t0 < $t1
  add $s0, $t0, $t1 # add t0 and t1 and store it to s0
  j end  # go to end label
second:
  # if we are here, we know that $t1 <= $t0, so we check if $t1 < $t2
  slt $t3, $t1, $t2 #setting t3 to 1 if t1 is less than t2
  beqz $t3, fourth # branch if $t1 >= $t2
  # if we are here we have $t1 < $t2 and $t1 <= $t0, so we sum $t0 and $t2
  add $s0, $t0, $t2 # add t0 and t2 and store it to s0
  j end # go to end label
fourth:
  # if we are here, $t1 <= $t0 and $t2 <= t1, so $t2 <= $t1 <= $t0
  add $s0, $t0, $t1 # add t0 and t1 and store it to s0
end:
  li $v0, 4 # printing the string "ans"
  la $a0, str2 # loading address of str2 in a0
  syscall # call to print the string "ans"
  li $v0, 1 # 1 is the code to print integers
  move $a0, $s0
  syscall