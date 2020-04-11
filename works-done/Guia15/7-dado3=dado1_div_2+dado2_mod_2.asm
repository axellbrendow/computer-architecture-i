; area de codigo iniciara' a partir do endereco 2000H
# ORG 2000H
# BEGIN 2000H

LHLD 2501 ; acessa o endereco 2501 na memoria, le um byte e guarda no registrador L, faz o mesmo processo com o registrador H no proximo byte
CALL divide ; divide o dado do registrador H pelo dado do registrador L e guarda o quociente e o resto nos mesmos registradores
MOV D, H ; guarda o quociente no registrador D
LHLD 2503 ; acessa o endereco 2503 na memoria, le um byte e guarda no registrador L, faz o mesmo processo com o registrador H no proximo byte
CALL divide ; divide o dado do registrador H pelo dado do registrador L e guarda o quociente e o resto nos mesmos registradores
MOV A, D ; coloca o quociente da primeira divisao no acumulador
ADD L ; soma com o resto da divisao da ultima divisao
STA 2505 ; guarda o resultado do acumulador no endereco 2505
HLT ; termina a execucao

; divide function
; let dividend and divisor in H and L registers
; output (quotient and remainder) is in H and L registers
; register A is also used
divide: MOV A, H ; coloca o dividendo no acumulador
    MVI H, 00H ; coloca 00H no registrador H (guardara' o quociente)
    
    loop: SUB L ; subtrai o divisor do acumulador
        JC finalize ; pula para "finalize" se a operacao anterior pediu 1 emprestado no final (Jump Carry)
        INR H ; incrimenta o quociente
    JMP loop ; volta ao inicio do looping
    
    finalize: ADD L ; reincrimenta o acumulador (volta a guardar um valor positivo, que e' o resto da divisao)
    MOV L, A ; coloca o resto da divisao no registrador L
RET

; area de dados iniciara' a partir do endereco 2501H
# ORG 2501H

; divisor, dividendo, divisor, dividendo
# DB 02H, 05H, 02H, 09H