; area de codigo iniciara' a partir do endereco 2000H
# ORG 2000H
# BEGIN 2000H

LHLD 2501 ; acessa o endereco 2501 na memoria, le um byte e guarda no registrador L, faz o mesmo processo com o registrador H no proximo byte
MOV A, H ; coloca o conteudo do registrador H no acumulador
SUB L ; subtrai o conteudo do registrador L no acumulador
ADD A ; soma o conteudo do acumulador com o conteudo do acumulador
STA 2503 ; guarda o resultado no endereco 2503
HLT ; termina a execucao

; area de dados iniciara' a partir do endereco 2501H
# ORG 2501H

; declara 2 bytes, com o primeiro comecando no endereco 2501H, e ja' inicia os valores nesses enderecos com 10 e 5
# DB 0AH, 05H