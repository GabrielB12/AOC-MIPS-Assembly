.data #area p/ dados na memoria principal

	horas: .asciiz "Digite as horas: "    #mensagens p/ o usuário
	minutos: .asciiz "Digite os minutos: "
	segundos: .asciiz "Digite os segundos: "
	erroHoras: .asciiz "Valor inválido para as horas. Esperado número entre 0 e 23."
	erroMinutos: .asciiz "Valor inválido para os minutos. Esperado número entre 0 e 23."
	erroSegundos: .asciiz "Valor inválido para os segundos. Esperado número entre 0 e 23."
	pontos: .byte ':'

.text #area de instrucoes do programa

.globl inicioHoras

inicioHoras:
li $v0, 4 #instrucao para impressao de string
la $a0, horas
syscall #comando que imprime oq esta no registrador a0
jal leNum

li $t1, 24 #limite superior
li $t2, -1 #limite inferior
slt $t0, $v0, $t1 #checa se o numero digitado é menor que 23
beq $t0, $zero, errHrs
slt $t0, $t2, $v0 #mesma coisa do de cima, porem para o limite inferior
beq $t0, $zero, errHrs

la $t7, 0($v0)
move $s5, $v0 #armazena o valor de vo em s5
j inicioMinutos
j fim


inicioMinutos:
li $v0, 4 #instrucao para impressao de string
la $a0, minutos
syscall #comando que imprime oq esta no registrador a0
jal leNum

li $t1, 61 #limite superior
li $t2, -1 #limite inferior
slt $t0, $v0, $t1 #checa se o numero digitado é menor que 23
beq $t0, $zero, errMin #se for continua, se nao entra no loop
slt $t0, $t2, $v0 #mesma coisa do de cima, porem para o limite inferior
beq $t0, $zero, errMin

la $t7, 0($v0)
move $s6, $v0 #armazena o valor de vo em s6
j inicioSegundos
j fim

inicioSegundos:
li $v0, 4 #instrucao para impressao de string
la $a0, segundos
syscall #comando que imprime oq esta no registrador a0
jal leNum

li $t1, 61 #limite superior
li $t2, -1 #limite inferior
slt $t0, $v0, $t1 #checa se o numero digitado é menor que 23
beq $t0, $zero, errSeg #se for continua, se nao entra no loop
slt $t0, $t2, $v0 #mesma coisa do de cima, porem para o limite inferior
beq $t0, $zero, errSeg

la $t7, 0($v0)
move $s7, $v0 #armazena o valor de vo em s7
j fim

errHrs: #funcao que imprime menssagem de erro e usa o "jump" para fazer o laco
li $v0, 4
la $a0, erroHoras
syscall 
j inicioHoras

errMin: #funcao que imprime menssagem de erro e usa o "jump" para fazer o laco
li $v0, 4
la $a0, erroMinutos
syscall 
j inicioMinutos

errSeg: #funcao que imprime menssagem de erro e usa o "jump" para fazer o laco
li $v0, 4
la $a0, erroSegundos
syscall 
j inicioSegundos

leNum: #le o numero digitado pelo usuario
li $v0, 5
syscall 
jr $ra

imprime:
li $v0, 1
la $a0, ($t7)
syscall		
jr $ra

fim: #imprime os valores das horas, que foram armazenados em 3 registradores, com os dois pontos entre eles
li $v0, 1
la $a0, ($s5)
syscall 
li $v0, 4 #para caracteres
la $a0, pontos
syscall 
li $v0, 1
la $a0, ($s6)
syscall 
li $v0, 4 #para caracteres
la $a0, pontos
syscall 
li $v0, 1
la $a0, ($s7)
syscall 
	
