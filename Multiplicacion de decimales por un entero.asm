.MODEL small
.STACK 100h

.DATA
    n1_ent_alta DW 0       ; Parte entera del numero 1 (Parte alta)
    n1_ent_baja DW 7777    ; Parte entera del numero 1 (Parte baja)
    n1_dec_alta DW 0       ; Parte decimal del numero 1 (Parte alta)
    n1_dec_baja DW 77      ; Parte decimal del numero 1 (Parte baja)
    
    n2_ent_alta DW 0       ; Parte entera del numero 2 (Parte alta)
    n2_ent_baja DW 6666    ; Parte entera del numero 2 (Parte baja)
    n2_dec_alta DW 0       ; Parte decimal del numero 2 (Parte alta)
    n2_dec_baja DW 66      ; Parte decimal del numero 2 (Parte baja)   
    
    
    ;Variables para almacenar la multiplicacion del n1 por el entero de n2
    resultado_1_ent_alta DW ?       ; Parte entera del numero resultante (Parte alta)
    resultado_1_ent_baja DW ?    ; Parte entera del numero resultante (Parte baja)
    resultado_1_dec_alta DW ?       ; Parte decimal del numero resultante (Parte alta)
    resultado_1_dec_baja DW ?      ; Parte decimal del numero resultante (Parte baja)
    
    ;Variables para almacenar la multiplicacion del n1 por el decimal de n2
    resultado_2_ent_alta DW ?       ; Parte entera del numero resultante (Parte alta)
    resultado_2_ent_baja DW ?    ; Parte entera del numero resultante (Parte baja)
    resultado_2_dec_alta DW ?       ; Parte decimal del numero resultante (Parte alta)
    resultado_2_dec_baja DW ?      ; Parte decimal del numero resultante (Parte baja)
    
    ;Resultado combinado 
    resultado_f_ent_alta DW ?       ; Parte entera del numero resultante (Parte alta)
    resultado_f_ent_baja DW ?    ; Parte entera del numero resultante (Parte baja)
    resultado_f_dec_alta DW ?       ; Parte decimal del numero resultante (Parte alta)
    resultado_f_dec_baja DW ?      ; Parte decimal del numero resultante (Parte baja)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ;Parte 1 de la multiplicacion (n1 por el entero de n2)

    ; Multiplicar la parte entera por el factor
    MOV AX, n1_ent_baja                 ; Cargar la parte entera en AX
    MOV BX, n2_ent_baja                 ; Cargar el factor en BX
    MUL BX                              ; Multiplicar AX (intPart) por BX (factor)
    MOV resultado_1_ent_baja, AX        ; Guardar el resultado en 'intResult'
    MOV resultado_1_ent_alta, DX

    ; Multiplicar la parte decimal por el factor
    MOV AX, n1_dec_baja                 ; Cargar la parte decimal en AX
    MOV BX, n2_ent_baja                 ; Cargar el factor en BX
    MUL BX                              ; Multiplicar AX (fracPart) por BX (factor)
    ; AX ahora tiene el cociente (parte decimal ajustada) y DX tiene el resto (acarreo)

    ; Ajustar la parte decimal y manejar el acarreo
    MOV BX, 100                         ; Divisor para ajustar la parte decimal
    DIV BX                              ; Dividir AX (fracResult) por 100
    MOV resultado_1_dec_baja, DX        ; Guardar la parte decimal ajustada en fracResult
    MOV BX, AX                          ; Guardar el resto (acarreo) en BX

    ; Combinar los resultados ajustados
    MOV AX, resultado_1_ent_baja        ; Cargar el resultado de la parte entera
    ADD AX, BX                          ; Sumar el acarreo (parte decimal ajustada) al resultado de la parte entera
    MOV resultado_1_ent_baja, AX        ; Guardar el resultado combinado en 'combinedResult'  
    
    ;Prueba para verificar si la parte alta se guardo bien
    MOV DX, resultado_1_ent_alta
    
    
    ;Parte 2 de la multiplicacion (n1 por el decimal aumentado de n2)
    
    
    MOV AX, n1_ent_baja                 ; Cargar la parte entera en AX
    MOV BX, n2_dec_baja                 ; Cargar el factor en BX
    MUL BX                              ; Multiplicar AX (intPart) por BX (factor)
    MOV resultado_2_ent_baja, AX        ; Guardar el resultado en 'intResult'
    MOV resultado_2_ent_alta, DX

    ; Multiplicar la parte decimal por el factor
    MOV AX, n1_dec_baja                 ; Cargar la parte decimal en AX
    MOV BX, n2_dec_baja                 ; Cargar el factor en BX
    MUL BX                              ; Multiplicar AX (fracPart) por BX (factor)
    ; AX ahora tiene el cociente (parte decimal ajustada) y DX tiene el resto (acarreo)

    ; Ajustar la parte decimal y manejar el acarreo
    MOV BX, 100                         ; Divisor para ajustar la parte decimal
    DIV BX                              ; Dividir AX (fracResult) por 100
    MOV resultado_2_dec_baja, DX        ; Guardar la parte decimal ajustada en fracResult
    MOV BX, AX                          ; Guardar el resto (acarreo) en BX

    ; Combinar los resultados ajustados
    MOV AX, resultado_2_ent_baja        ; Cargar el resultado de la parte entera
    ADD AX, BX                          ; Sumar el acarreo (parte decimal ajustada) al resultado de la parte entera
    MOV resultado_2_ent_baja, AX        ; Guardar el resultado combinado en 'combinedResult'  
    
    ;Prueba para verificar si la parte alta se guardo bien
    MOV DX, resultado_2_ent_alta
     
     
    ;Parte 3 de la multiplicacion (sumar la parte entera del paso anterior a la parte decimal del paso 1)
    
    MOV AX, resultado_1_dec_baja        ;Carga la parte entera del paso 1 en AX
    ADD AX, resultado_2_ent_baja        ;Suma la parte entera obtenida en el paso 2 al entero
    
    MOV BX, 100                         ;Mueve 100 a BX para realizar la division
    DIV BX                              ;Divide el resultado entre 100
    
    ;En AX se guarda el acarreo que se debe sumar a la parte entera
    ;En DX se guarda la parte decimal resultante del numero
    
    ADD resultado_f_ent_baja, AX        ;Suma el acarreo al numero final
    ADD resultado_f_dec_baja, DX        ;Suma el resto al numero final
    
    MOV AX, resultado_1_ent_baja        ;Mueve la parte baja entera del primer resultado a AX
    MOV DX, resultado_1_ent_alta        ;Mueve la parte alta entera del primer resultado a DX
    
    ADD resultado_f_ent_baja, AX        ;Suma el acarreo a la parte baja del numero final
    ADD resultado_f_ent_alta, DX        ;Suma la parte alta al numero final
    

    ;Muestra de prueba del resultado final
    
    MOV AX, resultado_f_ent_baja
    MOV DX, resultado_f_ent_alta
    MOV CX, resultado_f_dec_baja
    
    
    

    ; Terminar el programa
    MOV AX, 4C00h         ; Interrupci�n para terminar el programa
    INT 21h

MAIN ENDP
END MAIN