org 100h

.data            

    input_buffer db 10 dup('$')  ; Buffer para almacenar la entrada del usuario
    buffer_end db '$'           ; Terminador para la cadena

    menu db 'Bienvenido a GeometryTec!$', 0Dh, 0Ah, '$'
    newline db 0Dh, 0Ah, '$'
    prompt db 'Indique cual figura desea calcular su area y perimetro:$',  0Dh, 0Ah, '$'
    option1 db '1. Para Cuadrado.$', 0Dh, 0Ah, '$'
    option2 db '2. Para Rectangulo.$', 0Dh, 0Ah, '$'
    option3 db '3. Para Triangulo Equilatero.$', 0Dh, 0Ah, '$'
    option4 db '4. Para Rombo.$', 0Dh, 0Ah, '$'
    option5 db '5. Para Pentagono.$', 0Dh, 0Ah, '$'
    option6 db '6. Para Hexagono.$', 0Dh, 0Ah, '$'
    option7 db '7. Para Circulo.$', 0Dh, 0Ah, '$'
    option8 db '8. Para Trapecio.$', 0Dh, 0Ah, '$'
    option9 db '9. Para Paralelogramo.$', 0Dh, 0Ah, '$'
    invalid db 'Opcion invalida. Por favor seleccione una opcion valida.$', 0Dh, 0Ah, '$'
    blank_char db ''  ; Car�cter espacio para usar en la funci�n de retroceso
    
    ; Mensajes para opciones seleccionadas
    square db 'Has seleccionado Cuadrado.$', 0Dh, 0Ah, '$'
    rectangle db 'Has seleccionado Rectangulo.$', 0Dh, 0Ah, '$'
    triangle db 'Has seleccionado Triangulo Equilatero.$', 0Dh, 0Ah, '$'
    rhombus db 'Has seleccionado Rombo.$', 0Dh, 0Ah, '$'
    pentagon db 'Has seleccionado Pentagono.$', 0Dh, 0Ah, '$'
    hexagon db 'Has seleccionado Hexagono.$', 0Dh, 0Ah, '$'
    circle db 'Has seleccionado Circulo.$', 0Dh, 0Ah, '$'
    trapezoid db 'Has seleccionado Trapecio.$', 0Dh, 0Ah, '$'
    parallelogram db 'Has seleccionado Paralelogramo.$', 0Dh, 0Ah, '$'
    
    ; Mensajes para la colecta de datos
    lado db 'Ingresa el valor del lado: $', 0Dh, 0Ah, '$'
     
    ;Mensajes de error
    mas_de_un_punto_decimal db 'Otro punto decinmal??? :v $', 0Dh, 0Ah, '$'
     
.code
main proc
    ; Inicializa el segmento de datos
    mov ax, @data
    mov ds, ax

    ; Mostrar mensaje de bienvenida
    mov ah, 09h
    lea dx, menu
    int 21h
    ; Mostrar salto de linea despues del mensaje de bienvenida
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Mostrar prompt
    mov ah, 09h
    lea dx, prompt
    int 21h

    ; Mostrar salto de linea antes de las opciones del menu
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Mostrar opciones del menu con saltos de linea
    mov ah, 09h
    lea dx, option1
    int 21h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, option2
    int 21h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, option3
    int 21h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, option4
    int 21h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, option5
    int 21h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, option6
    int 21h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, option7
    int 21h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, option8
    int 21h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, option9
    int 21h
    lea dx, newline
    int 21h

    ; Leer opcion del usuario
    mov ah, 01h       ; Funcion para leer un caracter del teclado
    int 21h
    mov bl, al        ; Guardar el caracter leido en BL

    ; Mostrar salto de linea despues de leer la opcion
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Manejo de opcion
    cmp bl, '1'
    je square_option
    cmp bl, '2'
    je rectangle_option
    cmp bl, '3'
    je triangle_option
    cmp bl, '4'
    je rhombus_option
    cmp bl, '5'
    je pentagon_option
    cmp bl, '6'
    je hexagon_option
    cmp bl, '7'
    je circle_option
    cmp bl, '8'
    je trapezoid_option
    cmp bl, '9'
    je parallelogram_option

    ; Opcion invalida
    mov ah, 09h
    lea dx, invalid
    int 21h
    ; Salto de linea
    mov ah, 09h
    lea dx, newline
    int 21h
    jmp end_program

square_option:
    mov ah, 09h
    lea dx, square
    int 21h
    jmp cuadrado

rectangle_option:
    mov ah, 09h
    lea dx, rectangle
    int 21h
    jmp end_program

triangle_option:
    mov ah, 09h
    lea dx, triangle
    int 21h
    jmp end_program

rhombus_option:
    mov ah, 09h
    lea dx, rhombus
    int 21h
    jmp end_program

pentagon_option:
    mov ah, 09h
    lea dx, pentagon
    int 21h
    jmp end_program

hexagon_option:
    mov ah, 09h
    lea dx, hexagon
    int 21h
    jmp end_program

circle_option:
    mov ah, 09h
    lea dx, circle
    int 21h
    jmp end_program

trapezoid_option:
    mov ah, 09h
    lea dx, trapezoid
    int 21h
    jmp end_program

parallelogram_option:
    mov ah, 09h
    lea dx, parallelogram
    int 21h
    jmp end_program

end_program:
    ; Termina el programa
    mov ah, 4Ch
    int 21h 
    

cuadrado:
    lea dx, newline
    int 21h
    lea dx, lado
    int 21h
     
    ; Inicializa el puntero del buffer y limpia el buffer
    lea di, input_buffer
    mov byte ptr [di], '$'
    mov cx, 0          ; Contador de caracteres
    call READ_LOOP

    ; Convertir el buffer de entrada a n�mero entero
    lea si, input_buffer
    call STR_TO_INT        
    ;Una vez aqui el numero leido estara divido en 2 partes, la parte alta en DX y la parte baja en AX
    

    ; Aqu� puedes usar el n�mero entero en el registro AX (o en otro registro si lo prefieres)
        
    
    ; Terminar el programa
    jmp end_program

     
READ_LOOP:
    mov ah, 01h          ; Funci�n de lectura de un car�cter
    int 21h              ; Leer car�cter del teclado

    CMP AL, 0DH          ; Verificar si el car�cter es Enter (fin de entrada)
    JE DONE              ; Si es Enter, terminar lectura

    CMP AL, 08H          ; Verificar si el car�cter es Backspace
    JE BACKSPACE         ; Si es Backspace, borrar el �ltimo car�cter

    CMP AL, '.'          ; Verificar si el car�cter es un punto decimal
    JE DECIMAL_POINT     ; Si es punto decimal, cambiar a modo decimal

    ; Convertir car�cter ASCII a n�mero (0-9)
    SUB AL, '0'
    CMP AL, 9
    JA INVALID_CHAR      ; Verificar si el car�cter es un d�gito v�lido

    ; Guardar car�cter en buffer
    MOV [DI], AL
    INC DI
    INC CX
    JMP READ_LOOP        ; Continuar leyendo caracteres

DECIMAL_POINT:
    ; Solo se permite un punto decimal
    CMP BL, 1
    JE INVALID_CHAR      ; Si ya hay un punto decimal, es inv�lido

    MOV BL, 1            ; Indicar que hemos encontrado el punto decimal
    MOV [DI], AL         ; Guardar el punto decimal en el buffer
    INC DI
    INC CX
    JMP READ_LOOP        ; Continuar leyendo caracteres

BACKSPACE:
    CMP CX, 0            ; Verificar si hay algo para borrar
    JE READ_LOOP         ; Si no hay nada, continuar
    
    DEC DI               ; Mover el puntero de vuelta en el buffer
    DEC CX               ; Disminuir el contador de caracteres
    
    ; Mover cursor hacia atr�s y sobrescribir el car�cter con un espacio
    MOV AH, 02H          ; Funci�n para mover el cursor
    MOV DL, 08H          ; Mover el cursor una posici�n hacia la izquierda
    INT 21H              ; Ejecutar
    
    MOV AH, 09H          ; Funci�n para mostrar caracteres
    LEA DX, blank_char   ; Direcci�n del car�cter espacio
    INT 21H              ; Mostrar el espacio en blanco

    ; Mover el cursor hacia atr�s de nuevo para que quede en la posici�n correcta
    MOV AH, 02H          ; Funci�n para mover el cursor
    MOV DL, 08H          ; Mover el cursor una posici�n hacia la izquierda
    INT 21H              ; Ejecutar

    ; Verificar si el car�cter a borrar es un punto decimal
    MOV AL, [DI]         ; Cargar el car�cter que se va a borrar
    CMP AL, '.'          
    JNE READ_LOOP        ; Si no es un punto decimal, continuar
    
    MOV BL, 0            ; Restablecer el modo a parte entera

    JMP READ_LOOP        ; Continuar leyendo caracteres
    
    
INVALID_CHAR:
    ; Eliminar el �ltimo car�cter ingresado (simular backspace)
    JMP BACKSPACE        ; Llamar a la rutina de retroceso (Backspace)

    ; Continuar leyendo caracteres
    JMP READ_LOOP

DONE:
    ; Agregar terminador null al final del buffer
    MOV BYTE PTR [DI], '$'

    ; Mostrar nueva l�nea
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H
    ret

STR_TO_INT:
    xor ax, ax            ; Limpiar AX para usarlo como el n�mero entero
    mov cx, 10            ; Base 10 para la conversi�n
convert_loop:
    mov bl, [si]          ; Cargar el siguiente car�cter
    cmp bl, '$'           ; Verificar el final de la cadena
    je done_conversion    ; Si es el final, terminar
    cmp bl, '.'
    je decimal_founded

    ; Multiplicar AX por 10 (base decimal)
    add ax, bx            ; Guardar el valor actual de AX en DX
    inc si                ; Mover al siguiente car�cter
    mov bl, [si]          ; Cargar el siguiente car�cter (En el caso de que sea el ultimo)
    cmp bl, '$'           ; Verificar el final de la cadena
    je done_conversion    ; Si es el final, terminar
    
    ;ARREGLAR ESTA PARTE, LA MULTIPLICACION
    ;DEBE HACERSE EN PARTE ALTA Y BAJA Y LUEGO
    ;GUARDAR EL ACUMULADO
    
    mov cx, 10            ; Cargar el multiplicador en CX
    mul cx                ; Multiplicar AX por CX, resultado en AX
    jmp convert_loop      ; Continuar con el siguiente car�cter

done_conversion:
    ret


decimal_founded:
    mov cx, 100            ; Cargar el multiplicador en CX
    mul cx                ; Multiplicar AX por CX, resultado en AX
    inc si
    jmp convert_loop      ; Continuar con el siguiente car�cter

    
 
main endp
end main