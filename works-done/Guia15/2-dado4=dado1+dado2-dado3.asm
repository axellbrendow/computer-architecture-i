; area de codigo iniciara' a partir do endereco 2000H
# ORG 2000H
# BEGIN 2000H

LHLD 2505 ; acessa o endereco 2505 na memoria, le um byte e guarda no registrador L, faz o mesmo processo com o registrador H no proximo byte
MOV A, L ; coloca no acumulador o conteudo do registrador L
CMA ; complementa o acumulador
MOV L, A ; coloca no registrador L o conteudo do acumulador
MOV A, H ; coloca no acumulador o conteudo do registrador H
CMA ; complementa o acumulador
MOV H, A ; coloca no registrador H o conteudo do acumulador
INX H ; incrimenta o valor guardado nos registradores H e L
XCHG ; troca os conteudos dos registradores H e L com os conteudos dos registradores D e E
LHLD 2501 ; acessa o endereco 2501 na memoria, le um byte e guarda no registrador L, faz o mesmo processo com o registrador H no proximo byte
DAD D ; pega os conteudos dos registradores D e E e soma com o conteudo dos registradores H e L, guardando o resultado em H e L
XCHG ; troca os conteudos dos registradores H e L com os conteudos dos registradores D e E
LHLD 2503 ; acessa o endereco 2503 na memoria, le um byte e guarda no registrador L, faz o mesmo processo com o registrador H no proximo byte
DAD D ; pega os conteudos dos registradores D e E e soma com o conteudo dos registradores H e L, guardando o resultado em H e L
SHLD 2507 ; guarda, a partir do endereco 2507, os conteudos dos registradores H e L na memoria
HLT ; termina a execucao

; area de dados iniciara' a partir do endereco 2501H
# ORG 2501H

; declara 6 bytes (3 palavras), com a primeira comecando no endereco 2501H, e ja' inicia os valores nesses enderecos com 10, 5 e 2 em "big endian"
# DB 0AH, 00H, 05H, 00H, 02H, 00H