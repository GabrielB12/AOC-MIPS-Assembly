.data 
	frase: .asciiz "Digite a frase: "
	caracteres: .asciiz "Número total de caracteres: "
	palavras: .asciiz "Número total de palavras: "
	repetidas: .asciiz "Número total de palavras repetidas: "
	pularLinha:.asciiz "\n"
	teste: .asciiz 

.text 
	# frase para informar o usuário
    	li $v0, 4
   	la $a0, frase
   	syscall 
    	
    	#leirura da frase digitada
	la $a1, caracteres
	la $a2, palavras
	la $t0, teste
	li $v0, 8 		#parte necessaria para a leitura da string
	addi $a0, $t0, 0
	syscall

	li $t2, 32		#coloca em t3 o valor de ' '
	li $t5, 10		#coloca em t5 o valor de '\n'
	li $t3, 0		#inicia em 0 (o numero de caracteres)
	li $t4, 1		#inicia em 1, pois teremos sempre [palavras = espacos + 1]

laco:			
	lb $t1, 0($t0)			#coloca o valor no endereço t0
	beq $t1, $t5, saida		#se for '\n' o cactere da vez, vai pra saida 
	addi $t3, $t3, 1 		#se nao acabar adiciona 1 caractere
	beq $t1, $t2, numPalavras	#se o caractere for um espaco vai pra parte de adicionar 1 no numero de palavras
	addi $t0,$t0,1			#aumenta 1 no t0 para apontar pros proximos 8 bits
	j laco				#recomeça o laço


numPalavras:
	addi $t4, $t4,1		#aumenta o numero de palavras em 1 
	addi $t0, $t0,1		#para apontar pros proximos 8 bits
	j laco			#volta para o laço
			

saida:
	#impressao do numero de caracteres
	li $v0, 4 
   	la $a0, caracteres
    	syscall
	li $v0, 1
    	la $a0, ($t3)
    	syscall
    	la $v0, 4
    	la $a0, pularLinha #coloca um '\n'
   	syscall
    	
    	#impressao do numero de palavras
	li $v0, 4 
   	la $a0, palavras
    	syscall
	li $v0, 1
    	la $a0, ($t4)
    	syscall
    	
    	
    	
