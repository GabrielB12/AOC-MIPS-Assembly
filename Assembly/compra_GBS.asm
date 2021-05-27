.data 
	nome: .asciiz "Digite o nome do produto: "
	lenome1: .space 30
	lenome2: .space 30
	lenome3: .space 30
	lenome4: .space 30
	lenome5: .space 30
	preco: .asciiz "Insira o valor unitario deste produto: "
	finalPreco: .asciiz "Valor Unitario: "
	finalProduto: .asciiz "Valor total do produto: "
	finalFinal: .asciiz "Valor total do pedido: "
	quantidade: .asciiz "Insira a quantidade desejada deste produto: "
	pergunta: .asciiz "Deseja comprar algo a mais? Se sim, digite 1. Caso contrário, digite 0. Resposta: "
	#maximo de 5 produtos por compra
	pularLinha:.asciiz "\n"
	teste: .asciiz
	zero: .float 0.0
	xis: .asciiz "x"
	espaco: .asciiz " "
	
.text 

		li $t4, 1 # "t4" ira guardar o numero de pedididos feitos, comeca com 1 pois é o valor minimo para os pedidos

leituraNome1:
		# frase para informar o usuário da leitura do nome do produto
    		li $v0, 4
   		la $a0, nome
   		syscall
   		
   		#le o nome do produto
   		li $v0, 8
   		la $a0, lenome1
   		la $a1, 30
   		syscall
   		
leituraValor1:
		# frase para informar o usuário da leitura do preco do produto
   		li $v0, 4
   		la $a0, preco
   		syscall
   		
   		#le o preco do produto
   		li $v0, 6
   		syscall 
   		lwc1 $f1, zero
   		add.s $f30, $f1, $f0 # "f30" armazena o valor unitario da compra
   		#j imprimeTotal1

leituraQuantidade1:
		# frase para informar o usuário da leitura da quantidade do produto
   		li $v0, 4
   		la $a0, quantidade
   		syscall
   		
   		
   		li $v0, 5
   		syscall
   		move $s1, $v0 # "s1" armazena a quantidade

		move $s6, $s1 #guarda para a multiplicacao
multiplicacao1:
		mtc1 $s6, $f6 #coloca s6 em f6
		cvt.s.w $f6, $f6 #converte o inteiro da quantidade em float
		mul.s $f31, $f30, $f6
   		

moverSegundo:
		# frase para informar o usuário se existem mais produtos a serem comprados
   		li $v0, 4
   		la $a0, pergunta
   		syscall	
   		
   		li $v0, 5
   		syscall
   		beq $v0, $zero, fim1
   		j leituraNome2

   				
leituraNome2:
		addi $t4, $t4, 1 #soma 1 ao numero de pedidos  
		# frase para informar o usuário da leitura do nome do produto
    		li $v0, 4
   		la $a0, nome
   		syscall
   		
   		#le o nome do produto
   		li $v0, 8
   		la $a0, lenome2
   		la $a1, 30
   		syscall
   		
leituraValor2:
		# frase para informar o usuário da leitura do preco do produto
   		li $v0, 4
   		la $a0, preco
   		syscall
   		
   		#le o preco do produto
   		li $v0, 6
   		syscall 
   		lwc1 $f1, zero 
   		add.s $f29, $f1, $f0 # "f29" armazenara o valor total da compra deste produto
   		lwc1 $f1, zero
   		add.s $f28, $f1, $f0 # "f28" armazena o valor unitario da compra
   		#j imprimeTotal1

leituraQuantidade2:
		# frase para informar o usuário da leitura da quantidade do produto
   		li $v0, 4
   		la $a0, quantidade
   		syscall
   		
   		li $v0, 5
   		syscall
   		move $s2, $v0 # "s2" armazena a quantidade
   		
   		move $s7, $s2 #guarda para a multiplicacao
   		
multiplicacao2:
		mtc1 $s7, $f6 #coloca s7 em f6
		cvt.s.w $f6, $f6 #converte o inteiro da quantidade em float
		mul.s $f29, $f28, $f6

moverTerceiro:
		# frase para informar o usuário se existem mais produtos a serem comprados
   		li $v0, 4
   		la $a0, pergunta
   		syscall	
   		
   		li $v0, 5
   		syscall
   		beq $v0, $zero, fim1
   		j leituraNome3
		
leituraNome3:
		addi $t4, $t4, 1 #soma 1 ao numero de pedidos
		# frase para informar o usuário da leitura do nome do produto
    		li $v0, 4
   		la $a0, nome
   		syscall
   		
   		#le o nome do produto
   		li $v0, 8
   		la $a0, lenome3
   		la $a1, 30
   		syscall

leituraValor3:
		# frase para informar o usuário da leitura do preco do produto
   		li $v0, 4
   		la $a0, preco
   		syscall
   		
   		#le o preco do produto
   		li $v0, 6
   		syscall 
   		lwc1 $f1, zero 
   		add.s $f27, $f1, $f0 # "f27" armazenara o valor total da compra deste produto
   		lwc1 $f1, zero
   		add.s $f26, $f1, $f0 # "f26" armazena o valor unitario da compra
   		#j imprimeTotal1

leituraQuantidade3:
		# frase para informar o usuário da leitura da quantidade do produto
   		li $v0, 4
   		la $a0, quantidade
   		syscall
   		
   		li $v0, 5
   		syscall
   		move $s3, $v0 # "s3" armazena a quantidade
   		
   		move $t8, $s3 #guarda para a multiplicacao

multiplicacao3:
		mtc1 $t8, $f6 #coloca t8 em f6
		cvt.s.w $f6, $f6 #converte o inteiro da quantidade em float
		mul.s $f27, $f26, $f6
   		   		   		
moverQuarto:
		# frase para informar o usuário se existem mais produtos a serem comprados
   		li $v0, 4
   		la $a0, pergunta
   		syscall	
   		
   		li $v0, 5
   		syscall
   		beq $v0, $zero, fim1
   		j leituraNome4


leituraNome4:
		addi $t4, $t4, 1 #soma 1 ao numero de pedidos
		# frase para informar o usuário da leitura do nome do produto
    		li $v0, 4
   		la $a0, nome
   		syscall
   		
   		#le o nome do produto
   		li $v0, 8
   		la $a0, lenome4
   		la $a1, 30
   		syscall

leituraValor4:
		# frase para informar o usuário da leitura do preco do produto
   		li $v0, 4
   		la $a0, preco
   		syscall
   		
   		#le o preco do produto
   		li $v0, 6
   		syscall 
   		lwc1 $f1, zero 
   		add.s $f25, $f1, $f0 # "f25" armazenara o valor total da compra deste produto
   		lwc1 $f1, zero
   		add.s $f24, $f1, $f0 # "f24" armazena o valor unitario da compra
   		#j imprimeTotal1

leituraQuantidade4:
		# frase para informar o usuário da leitura da quantidade do produto
   		li $v0, 4
   		la $a0, quantidade
   		syscall
   		
   		li $v0, 5
   		syscall
   		move $s4, $v0 # "s4" armazena a quantidade
   		
   		move $t9, $s4 #guarda para a multiplicacao

multiplicacao4:
		mtc1 $t9, $f6 #coloca t9 em f6
		cvt.s.w $f6, $f6 #converte o inteiro da quantidade em float
		mul.s $f25, $f24, $f6
   		   		   		
moverQuinto:
		# frase para informar o usuário se existem mais produtos a serem comprados
   		li $v0, 4
   		la $a0, pergunta
   		syscall	
   		
   		li $v0, 5
   		syscall
   		beq $v0, $zero, fim1
   		j leituraNome5

leituraNome5:
		addi $t4, $t4, 1 #soma 1 ao numero de pedidos
		# frase para informar o usuário da leitura do nome do produto
    		li $v0, 4
   		la $a0, nome
   		syscall
   		
   		#le o nome do produto
   		li $v0, 8
   		la $a0, lenome5
   		la $a1, 30
   		syscall

leituraValor5:
		# frase para informar o usuário da leitura do preco do produto
   		li $v0, 4
   		la $a0, preco
   		syscall
   		
   		#le o preco do produto
   		li $v0, 6
   		syscall 
   		lwc1 $f1, zero 
   		add.s $f23, $f1, $f0 # "f23" armazenara o valor total da compra deste produto
   		lwc1 $f1, zero
   		add.s $f22, $f1, $f0 # "f22" armazena o valor unitario da compra
   		#j imprimeTotal1
	
leituraQuantidade5:
		# frase para informar o usuário da leitura da quantidade do produto
   		li $v0, 4
   		la $a0, quantidade
   		syscall
   		
   		li $v0, 5
   		syscall
   		move $s5, $v0 # "s5" armazena a quantidade
   		
   		move $k0, $s5 #guarda para a multiplicacao
   		
multiplicacao5:
		mtc1 $k0, $f6 #coloca k0 em f6
		cvt.s.w $f6, $f6 #converte o inteiro da quantidade em float
		mul.s $f23, $f22, $f6
   		
fim1:
	
		#imprime a quantidade do primeiro produto
		li $v0, 1 
		move $a0, $s1
		syscall	
		li $v0, 4
   		la $a0, xis
   		syscall
   		li $v0, 4
   		la $a0, espaco
   		syscall
   		
   		#imprime o nome do primerio produto
   		li $v0, 4
   		la $a0, lenome1
   		syscall
   		
   		#imprime o valor unitario do primeiro produto
		li $v0, 4
   		la $a0, finalPreco
   		syscall	
   		add.s $f12, $f30, $f1
		li $v0, 2
   		syscall	
   		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
   		
   		#imprime o valor total do produto
   		li $v0, 4
   		la $a0, finalProduto
   		syscall
   		add.s $f12, $f31, $f1
		li $v0, 2
   		syscall
   		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
   		
   		subi $t4, $t4, 1 #subtrai 1 do numero de pedidos
   		beq $t4, $zero, fimTotal #se for 0 ja imprime o total das compras
   		j fim2

fim2:
		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
		
		#imprime a quantidade do segundo produto
		li $v0, 1 
		move $a0, $s2
		syscall	
		li $v0, 4
   		la $a0, xis
   		syscall
   		li $v0, 4
   		la $a0, espaco
   		syscall
   		
   		#imprime o nome do segundo produto
   		li $v0, 4
   		la $a0, lenome2
   		syscall
   		
   		#imprime o valor unitario do segundo produto
		li $v0, 4
   		la $a0, finalPreco
   		syscall	
   		add.s $f12, $f28, $f1
		li $v0, 2
   		syscall	
   		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
   		
   		#imprime o valor total do segundo produto
   		li $v0, 4
   		la $a0, finalProduto
   		syscall
   		add.s $f12, $f29, $f1
		li $v0, 2
   		syscall
   		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
   		
   		subi $t4, $t4, 1 #subtrai 1 do numero de pedidos
   		beq $t4, $zero, fimTotal #se for 0 ja imprime o total das compras
   		j fim3
   		
fim3:
		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
   		
		#imprime a quantidade do terceiro produto
		li $v0, 1 
		move $a0, $s3
		syscall	
		li $v0, 4
   		la $a0, xis
   		syscall
   		li $v0, 4
   		la $a0, espaco
   		syscall
   		
   		#imprime o nome do terceiro produto
   		li $v0, 4
   		la $a0, lenome3
   		syscall
   		
   		#imprime o valor unitario do primeiro produto
		li $v0, 4
   		la $a0, finalPreco
   		syscall	
   		add.s $f12, $f26, $f1
		li $v0, 2
   		syscall	
   		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
   		
   		#imprime o valor total do produto
   		li $v0, 4
   		la $a0, finalProduto
   		syscall
   		add.s $f12, $f27, $f1
		li $v0, 2
   		syscall
   		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
   		
   		subi $t4, $t4, 1 #subtrai 1 do numero de pedidos
   		beq $t4, $zero, fimTotal #se for 0 ja imprime o total das compras
   		j fim4

fim4:
		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
		
		#imprime a quantidade do quarto produto
		li $v0, 1 
		move $a0, $s4
		syscall	
		li $v0, 4
   		la $a0, xis
   		syscall
   		li $v0, 4
   		la $a0, espaco
   		syscall
   		
   		#imprime o nome do quarto produto
   		li $v0, 4
   		la $a0, lenome4
   		syscall
   		
   		#imprime o valor unitario do quarto produto
		li $v0, 4
   		la $a0, finalPreco
   		syscall	
   		add.s $f12, $f24, $f1
		li $v0, 2
   		syscall	
   		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
   		
   		#imprime o valor total do produto
   		li $v0, 4
   		la $a0, finalProduto
   		syscall
   		add.s $f12, $f25, $f1
		li $v0, 2
   		syscall
   		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
   		
   		subi $t4, $t4, 1 #subtrai 1 do numero de pedidos
   		beq $t4, $zero, fimTotal #se for 0 ja imprime o total das compras
   		j fim5

fim5:	
		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
				
		#imprime a quantidade do quinto produto
		li $v0, 1 
		move $a0, $s5
		syscall	
		li $v0, 4
   		la $a0, xis
   		syscall
   		li $v0, 4
   		la $a0, espaco
   		syscall
   		
   		#imprime o nome do quinto produto
   		li $v0, 4
   		la $a0, lenome5
   		syscall
   		
   		#imprime o valor unitario do quinto produto
		li $v0, 4
   		la $a0, finalPreco
   		syscall	
   		add.s $f12, $f22, $f1
		li $v0, 2
   		syscall	
   		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
   		
   		#imprime o valor total do produto
   		li $v0, 4
   		la $a0, finalProduto
   		syscall
   		add.s $f12, $f23, $f1
		li $v0, 2
   		syscall
   		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
   		
   		subi $t4, $t4, 1 #subtrai 1 do numero de pedidos
   		beq $t4, $zero, fimTotal #se for 0 ja imprime o total das compras
   		j fimTotal	

fimTotal:
		la $v0, 4
    		la $a0, pularLinha #coloca um '\n'
   		syscall
		
		# frase para informar o usuário do total da compra
    		li $v0, 4
   		la $a0, finalFinal
   		syscall
		
		add.s $f31, $f31, $f29
		add.s $f31, $f31, $f27
		add.s $f31, $f31, $f25
		add.s $f31, $f31, $f23
		
		add.s $f12, $f31, $f1
		li $v0, 2
   		syscall
		
		
		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
