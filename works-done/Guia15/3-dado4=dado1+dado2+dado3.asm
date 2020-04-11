; area de codigo iniciara' a partir do endereco 2000H
# ORG 2000H
# BEGIN 2000H

LDA 2501 ; carrega o primeiro dado no acumulador
MOV H, A ; transfere o dado para o registrador H
LDA 2502 ; carrega o segundo dado no acumulador
ADD H ; adiciona o segundo dado com o primeiro
MOV H, A ; guarda o resultado no registrador H
LDA 2503 ; carrega o terceiro dado no acumulador
ADD H ; soma com o resultado guardado no registrador H
DAA ; converte o resultado binario para a representacao decimal-binaria
STA 2504 ; guarda o resultado no endereco 2504
HLT ; termina a execucao

; area de dados iniciara' a partir do endereco 2501H
# ORG 2501H

; declara 3 bytes, com o primeiro comecando no endereco 2501H, e ja' inicia os valores nesses enderecos com 17, 13 e 11 (Decimais Codificados em Binario)
# DB 17H, 13H, 11H