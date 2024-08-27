
; Rutina para convertir un número de 32 bits a cadena para mostrar
PARSE32 PROC
    PUSH BX
    PUSH CX
    PUSH SI
    MOV SI, 9
    MOV BX, 10
    MOV CX, 0

PARSE32_LOOP:
    PUSH AX
    MOV AX, DX
    XOR DX, DX
    DIV BX         ; Divide DX:AX por 10
    MOV DI, AX
    POP AX
    DIV BX         ; Divide AX por 10
    ADD DL, '0'    ; Convierte el residuo a carácter
    MOV [string1+SI], DL
    DEC SI
    INC CX
    MOV DX, DI     ; Pasa la parte alta de la división a DX
    CMP AX, 0
    JNZ PARSE32_LOOP ; Continua hasta que AX sea 0
    CMP DX, 0
    JNZ PARSE32_LOOP ; Continua hasta que DX sea 0

    MOV AL, ' '
FILL_SPACES:
    CMP SI, -1
    JE DONE_PARSING ; Si ya llenamos la cadena, terminamos
    MOV [string1+SI], AL
    DEC SI
    JMP FILL_SPACES

DONE_PARSING:
    POP SI
    POP CX
    POP BX
    RET
PARSE32 ENDP

; Rutina para mostrar la cadena generada
PRINTOUT PROC
    MOV AH, 09H
    INT 21H
    RET
PRINTOUT ENDP

END START ; Fin del programa, punto de entrada es START