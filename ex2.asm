.data
quebra: .asciiz "\n"  

.text
.globl main

main:
    li $t0, 2006        
    li $t1, 2005        
    add $t2, $t0, $t1   

    move $a0, $t2       
    			
    li $v0, 1	
    		
    syscall             

    li $v0, 4		
    la $a0, quebra
    syscall             

    li $v0, 10
    syscall            
