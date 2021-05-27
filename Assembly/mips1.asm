.data

	string: .space 200 #string com seu tamanho
	frase: .asciiz "Digite a frase: "
	caracteres: .asciiz "Número total de caracteres: "
	palavras: .asciiz "Número total de palavras: "
	repetidas: .asciiz "Número total de palavras repetidas: "
	newline:.asciiz "\n"
	
.text

main:
    # frase para informar o usuário
    li $v0, 4
    la $a0, frase
    syscall 
    
    #lendo a string dada pelo usuario
    li $v0, 8
    la $a0, string
    la $a1, 200
    syscall
    
    li $t3, 32 #coloca o espaco em t3
    li $s0,10 # '\n' em s0
    li $t4, 0 #t4 comeca em 0, usado para contar os caracteres
    li $t5, 0 #t4 comeca em 0, usado para contar as palavras
    
laco:

	lb $t1, 0($t0)		# valor decimal em $t0
	beq $t1, $s0, saida	# se for um enter pula pro fim
	addi $t4, $t4, 1 	# se nao o numero de caracteres ja é aumentado
	beq $t1, $t3, numPalavras	# se for um espaco pula para adicionar uma palavra

	addi $t0,$t0,1		#aumenta 1 a $t0 para que o endereço de memoria passe a apontar para os 8 bits seguintes
	j laco
	

numPalavras:
	addi $t5, $t5, 1
	addi $t0, $t0, 1
	j laco	
			
saida:
	li $v0, 4
   	la $a0, caracteres
    	syscall
    	li $v0, 1
    	la $a0, ($t4)
    	syscall
    	li $v0, 4
   	la $a0, palavras
    	syscall
    	li $v0, 1
    	la $a0, ($t5)
    	syscall
    
    