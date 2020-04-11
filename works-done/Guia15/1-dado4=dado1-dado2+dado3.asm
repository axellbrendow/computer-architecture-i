; area de codigo iniciara' a partir do endereco 2000H
# ORG 2000H
# BEGIN 2000H

LXI H, 2501 ; coloca o ponteiro para os dados nos registradores H e L
MOV A, M ; busca os dados da memoria (M) e os coloca no acumulador
INX H ; incrimenta o ponteiro em uma unidade
SUB M ; busca os dados no endereco apontado e ja' faz a subtracao com o que esta no acumulador e guarda o resultado no proprio acumulador
INX H ; incrimenta o ponteiro em uma unidade
ADD M ; busca os dados no endereco apontado e ja' faz a adicao com o que esta no acumulador e guarda o resultado no proprio acumulador
INX H ; incrimenta o ponteiro em uma unidade
MOV M, A ; guarda o valor do acumulador no endereco apontado
HLT ; termina a execucao

; area de dados iniciara' a partir do endereco 2501H
# ORG 2501H

; declara 3 bytes, com o primeiro comecando no endereco 2501H, e ja' inicia os valores nesses enderecos com 10, 5 e 2
# DB 0AH, 05H, 02H