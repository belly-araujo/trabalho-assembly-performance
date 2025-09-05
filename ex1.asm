.data 
valores: .word 4, 3, 9, 5, 2, 1     
tam: .word 6                       
espaco: .asciiz " "
quebra: .asciiz "\n"

.text
.globl main 

main:
  
    la $t0, valores      
    lw $t1, tam          

    addi $t2, $zero, 0       
outer_loop:
    bge $t2, $t1, fim_sort   
    addi $t3, $zero, 0       
    add $t4, $t1, $zero      
    addi $t4, $t4, -1        

inner_loop:
    bge $t3, $t4, proximo_i  

    mul $t5, $t3, 4          
    			     
    add $t6, $t0, $t5        
    lw $t7, 0($t6)           
    lw $t8, 4($t6)           

    # comparar
    ble $t7, $t8, nao_troca  

    # se o primerio for maior que o segundo, a gente troca os dois de lugar
    sw $t8, 0($t6)
    sw $t7, 4($t6)

nao_troca:
    addi $t3, $t3, 1        
    j inner_loop		

proximo_i:
    addi $t2, $t2, 1         
    j outer_loop	

fim_sort:
    # imprimir array ordenado
    li $t2, 0                

print_loop:
    bge $t2, $t1, fim        # se i >= tamanho, fim
    mul $t5, $t2, 4
    add $t6, $t0, $t5
    lw $a0, 0($t6)		
    li $v0, 1
    syscall		

    # imprimir espaço
    li $v0, 4
    la $a0, espaco
    syscall

    addi $t2, $t2, 1		
    j print_loop

fim:
    # imprimir quebra de linha
    li $v0, 4
    la $a0, quebra
    syscall

    li $v0, 10   # Encerrar o programa
    syscall
