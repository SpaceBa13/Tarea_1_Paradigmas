.model small
.stack 100h

.data            
    ;--------------------------------------VARIABLES PARA EL USO DEL PROGRAMA--------------------------------------
    
    
    ;Variables para el menu
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
    close   db '0. Para terminar programa.$', 0Dh, 0Ah, '$'
    invalid db 'Opcion invalida. Por favor seleccione una opcion valida.$', 0Dh, 0Ah, '$'
    blank_char db ''  ; Car�cter espacio para usar en la funci�n de retroceso
    continue_program db '1. Para Continuar.$', 0Dh, 0Ah, '$'
    close_program db '2. Para Salir.$', 0Dh, 0Ah, '$'
    
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
    finish  db 'Programa finalizado.$', 0Dh, 0Ah, '$'
    
    ; Mensajes para la colecta de datos
    lado db 'Ingresa el valor del lado: $', 0Dh, 0Ah, '$'
    lado1 db 'Ingresa el valor del lado 1: $', 0Dh, 0Ah, '$'
    lado2 db 'Ingresa el valor del lado 2: $', 0Dh, 0Ah, '$'
    Diago1 db 'Ingresa el valor del Diagonal 1: $', 0Dh, 0Ah, '$'
    Diago2 db 'Ingresa el valor del Diagonal 2: $', 0Dh, 0Ah, '$'
    altura db 'Ingresa el valor del altura: $', 0Dh, 0Ah, '$' 
    radio db 'Ingresa el valor del radio: $', 0Dh, 0Ah, '$'
    base db 'Ingresa el valor del lado 1 (base): $', 0Dh, 0Ah, '$'
    base_menor db 'Ingresa el valor de la base menor: $', 0Dh, 0Ah, '$'
    base_mayor db 'Ingresa el valor de la base mayor: $', 0Dh, 0Ah, '$'
    
    area db 'Area: $', 0Dh, 0Ah, '$'
    perimetro db 'Perimetro: $', 0Dh, 0Ah, '$'
     
    ;Mensajes de error
    mas_de_un_punto_decimal db 'Otro punto decinmal??? :v $', 0Dh, 0Ah, '$'
    
    ;--------------------------------------BUFFER--------------------------------------
    
    input_buffer db 10 dup('$')  ; Buffer para almacenar la entrada del usuario
    buffer_end db '$'           ; Terminador para la cadena
     
    
    ;Variables para la recoleccion de datos del buffer
    n_buffer_ent_alta DW ?            ; Parte entera del numero 1 (Parte alta)
    n_buffer_ent_baja DW ?            ; Parte entera del numero 1 (Parte baja)
    n_buffer_dec_alta DW ?            ; Parte decimal del numero 1 (Parte alta)
    n_buffer_dec_baja DW ?            ; Parte decimal del numero 1 (Parte baja 
    
    ;Variables para la multiplicacion
    n1_ent_alta DW ?            ; Parte entera del numero 1 (Parte alta)
    n1_ent_baja DW ?            ; Parte entera del numero 1 (Parte baja)
    n1_dec_alta DW ?            ; Parte decimal del numero 1 (Parte alta)
    n1_dec_baja DW ?            ; Parte decimal del numero 1 (Parte baja)
    
    n2_ent_alta DW ?            ; Parte entera del numero 2 (Parte alta)
    n2_ent_baja DW ?            ; Parte entera del numero 2 (Parte baja)
    n2_dec_alta DW ?            ; Parte decimal del numero 2 (Parte alta)
    n2_dec_baja DW ?            ; Parte decimal del numero 2 (Parte baja)
    
    ;Variables para almacenar la multiplicacion del n1 por el entero de n2
    resultado_1_ent_alta DW ?   ; Parte entera del numero resultante (Parte alta)
    resultado_1_ent_baja DW ?   ; Parte entera del numero resultante (Parte baja)
    resultado_1_dec_alta DW ?   ; Parte decimal del numero resultante (Parte alta)
    resultado_1_dec_baja DW ?   ; Parte decimal del numero resultante (Parte baja)
    
    ;Variables para almacenar la multiplicacion del n1 por el decimal de n2
    resultado_2_ent_alta DW ?   ; Parte entera del numero resultante (Parte alta)
    resultado_2_ent_baja DW ?   ; Parte entera del numero resultante (Parte baja)
    resultado_2_dec_alta DW ?   ; Parte decimal del numero resultante (Parte alta)
    resultado_2_dec_baja DW ?   ; Parte decimal del numero resultante (Parte baja)
    
    ;Resultado combinado de la multiplicacion 
    resultado_f_ent_alta DW ?   ; Parte entera del numero resultante (Parte alta)
    resultado_f_ent_baja DW ?   ; Parte entera del numero resultante (Parte baja)
    resultado_f_dec_alta DW ?   ; Parte decimal del numero resultante (Parte alta)
    resultado_f_dec_baja DW ?   ; Parte decimal del numero resultante (Parte baja)
    
    ;Variables para el almacenamiento del area y perimetro
    area_ent_alta DW ?            ; Parte entera del area (Parte alta)
    area_ent_baja DW ?            ; Parte entera del area  (Parte baja)
    area_dec_alta DW ?            ; Parte decimal del area  (Parte alta)
    area_dec_baja DW ?            ; Parte decimal del area  (Parte baja)
    
    perimetro_ent_alta DW ?            ; Parte entera del area (Parte alta)
    perimetro_ent_baja DW ?            ; Parte entera del area  (Parte baja)
    perimetro_dec_alta DW ?            ; Parte decimal del area  (Parte alta)
    perimetro_dec_baja DW ?            ; Parte decimal del area  (Parte baja)
    
    ;Variables para el almacenamiento de los numeros recolectados
    lado1_ent_alta DW ? 
    lado1_ent_baja DW ? 
    lado1_dec_alta DW ? 
    lado1_dec_baja DW ?  
    
    lado2_ent_alta DW ? 
    lado2_ent_baja DW ? 
    lado2_dec_alta DW ? 
    lado2_dec_baja DW ?
    
    base_mayor_ent_alta DW ? 
    base_mayor_ent_baja DW ? 
    base_mayor_dec_alta DW ? 
    base_mayor_dec_baja DW ?
    
    base_menor_ent_alta DW ? 
    base_menor_ent_baja DW ? 
    base_menor_dec_alta DW ? 
    base_menor_dec_baja DW ?
    diago1_ent_alta DW ? 
    diago1_ent_baja DW ? 
    diago1_dec_alta DW ? 
    diago1_dec_baja DW ?
    
    diago2_ent_alta DW ? 
    diago2_ent_baja DW ? 
    diago2_dec_alta DW ? 
    diago2_dec_baja DW ?
         
    altura_ent_alta DW ? 
    altura_ent_baja DW ? 
    altura_dec_alta DW ? 
    altura_dec_baja DW ?
    
    apotema_ent_alta DW ? 
    apotema_ent_baja DW ? 
    apotema_dec_alta DW ? 
    apotema_dec_baja DW ? 
 
    ;Variables para operaciones temporales (Trapecio)
    suma_1_ent_alta DW ? 
    suma_1_ent_baja DW ? 
    suma_1_dec_alta DW ? 
    suma_1_dec_baja DW ?
    
    suma_2_ent_alta DW ? 
    suma_2_ent_baja DW ? 
    suma_2_dec_alta DW ? 
    suma_2_dec_baja DW ?
    
    mul_1_ent_alta DW ? 
    mul_1_ent_baja DW ? 
    mul_1_dec_alta DW ? 
    mul_1_dec_baja DW ?
    
    ;--------------------------------------DOCUMENTACION GENERAL--------------------------------------
    
    ; Para la funcion MULTIPLICACION las variables estan almacenadas de esta forma: 
    ; AX, resultado_f_ent_baja
    ; DX, resultado_f_ent_alta
    ; CX, resultado_f_dec_baja
    
    ; Para la funcion STR_TO_INT los numeros obtenidos en el buffer estaran guardado de esta forma:
    ; n_buffer_ent_baja tendra la parte entera (solo baja debido a que el numero maximo es 9999.99)
    ; n_buffer_dec_baja tendra la parte decimal (solo baja debido a que el numero maximo es 9999.99)
    
    ; La funcion CARGA_DE_VALORES_DEL_AREA se utiliza cuando hay una multiplicacion y el resultado
    ; va directamente a los valores de area
    
    ; La funcion CARGA_DE_VALORES_DE_PERIMETRO se utiliza cuando hay una multiplicacion y el resultado
    ; va directamente a los valores de perimetro

    
       
.code
main proc
    ; Inicializa el segmento de datos
    mov ax, @data
    mov ds, ax

start:
    ;Limpia las variables resultado 
    
    MOV n_buffer_ent_alta, 0            ; Parte entera del numero 1 (Parte alta)
    MOV n_buffer_ent_baja, 0            ; Parte entera del numero 1 (Parte baja)
    MOV n_buffer_dec_alta, 0            ; Parte decimal del numero 1 (Parte alta)
    MOV n_buffer_dec_baja, 0            ; Parte decimal del numero 1 (Parte baja 
    
    ;Variables para la multiplicacion
    MOV n1_ent_alta, 0            ; Parte entera del numero 1 (Parte alta)
    MOV n1_ent_baja, 0            ; Parte entera del numero 1 (Parte baja)
    MOV n1_dec_alta, 0            ; Parte decimal del numero 1 (Parte alta)
    MOV n1_dec_baja, 0            ; Parte decimal del numero 1 (Parte baja)
    
    MOV n2_ent_alta, 0            ; Parte entera del numero 2 (Parte alta)
    MOV n2_ent_baja, 0            ; Parte entera del numero 2 (Parte baja)
    MOV n2_dec_alta, 0            ; Parte decimal del numero 2 (Parte alta)
    MOV n2_dec_baja, 0            ; Parte decimal del numero 2 (Parte baja)
    
    ;Variables para almacenar la multiplicacion del n1 por el entero de n2
    MOV resultado_1_ent_alta, 0   ; Parte entera del numero resultante (Parte alta)
    MOV resultado_1_ent_baja, 0   ; Parte entera del numero resultante (Parte baja)
    MOV resultado_1_dec_alta, 0   ; Parte decimal del numero resultante (Parte alta)
    MOV resultado_1_dec_baja, 0   ; Parte decimal del numero resultante (Parte baja)
    
    ;Variables para almacenar la multiplicacion del n1 por el decimal de n2
    MOV resultado_2_ent_alta, 0   ; Parte entera del numero resultante (Parte alta)
    MOV resultado_2_ent_baja, 0   ; Parte entera del numero resultante (Parte baja)
    MOV resultado_2_dec_alta, 0   ; Parte decimal del numero resultante (Parte alta)
    MOV resultado_2_dec_baja, 0   ; Parte decimal del numero resultante (Parte baja)
    
    ;Resultado combinado de la multiplicacion 
    MOV resultado_f_ent_alta, 0   ; Parte entera del numero resultante (Parte alta)
    MOV resultado_f_ent_baja, 0   ; Parte entera del numero resultante (Parte baja)
    MOV resultado_f_dec_alta, 0   ; Parte decimal del numero resultante (Parte alta)
    MOV resultado_f_dec_baja, 0   ; Parte decimal del numero resultante (Parte baja)
    
         ; Parte decimal del area  (Parte baja)
    
    ;Variables para el almacenamiento de los numeros recolectados
    MOV lado1_ent_alta, 0 
    MOV lado1_ent_baja, 0 
    MOV lado1_dec_alta, 0 
    MOV lado1_dec_baja, 0  
    
    MOV lado2_ent_alta, 0 
    MOV lado2_ent_baja, 0 
    MOV lado2_dec_alta, 0 
    MOV lado2_dec_baja, 0
    
    MOV base_mayor_ent_alta, 0 
    MOV base_mayor_ent_baja, 0 
    MOV base_mayor_dec_alta, 0 
    MOV base_mayor_dec_baja, 0
    
    MOV base_menor_ent_alta, 0 
    MOV base_menor_ent_baja, 0 
    MOV base_menor_dec_alta, 0 
    MOV base_menor_dec_baja, 0
    MOV diago1_ent_alta, 0 
    MOV diago1_ent_baja, 0 
    MOV diago1_dec_alta, 0 
    MOV diago1_dec_baja, 0
    
    MOV diago2_ent_alta, 0 
    MOV diago2_ent_baja, 0 
    MOV diago2_dec_alta, 0  
    MOV diago2_dec_baja, 0
         
    MOV altura_ent_alta, 0 
    MOV altura_ent_baja, 0 
    MOV altura_dec_alta, 0 
    MOV altura_dec_baja, 0
    
    MOV apotema_ent_alta, 0 
    MOV apotema_ent_baja, 0 
    MOV apotema_dec_alta, 0 
    MOV apotema_dec_baja, 0 
 
    ;Variables para operaciones temporales (Trapecio)
    MOV suma_1_ent_alta, 0 
    MOV suma_1_ent_baja, 0 
    MOV suma_1_dec_alta, 0 
    MOV suma_1_dec_baja, 0
    
    MOV suma_2_ent_alta, 0 
    MOV suma_2_ent_baja, 0 
    MOV suma_2_dec_alta, 0 
    MOV suma_2_dec_baja, 0
    
    MOV mul_1_ent_alta, 0 
    MOV mul_1_ent_baja, 0 
    MOV mul_1_dec_alta, 0   
    MOV mul_1_dec_baja, 0
        
    MOV area_ent_alta, 0
    MOV area_ent_baja, 0
    MOV area_dec_alta, 0
    MOV area_dec_baja, 0
    
    MOV perimetro_ent_alta, 0
    MOV perimetro_ent_baja, 0
    MOV perimetro_dec_alta, 0
    MOV perimetro_dec_baja, 0
    
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
    
    mov ah, 09h
    lea dx, close
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
    cmp bl, '9'
    je parallelogram_option
    cmp bl, '0'
    je end_program
    

    ; Opcion invalida
    mov ah, 09h
    lea dx, invalid
    int 21h
    ; Salto de linea
    mov ah, 09h
    lea dx, newline
    int 21h
    jmp start

square_option:
    mov ah, 09h
    lea dx, square
    int 21h
    jmp CUADRADO
                                        
rectangle_option:
    mov ah, 09h
    lea dx, rectangle
    int 21h
    jmp RECTANGULO
    
triangle_option:
    mov ah, 09h
    lea dx, triangle
    int 21h
    jmp TRIANGULO 
       
rhombus_option:
    mov ah, 09h
    lea dx, rhombus
    int 21h 
    jmp ROMBO
    
pentagon_option:
    mov ah, 09h
    lea dx, pentagon
    int 21h
    JMP PENTAGONO
    
hexagon_option:
    mov ah, 09h
    lea dx, hexagon
    int 21h
    jmp HEXAGONO
    
circle_option:
    mov ah, 09h
    lea dx, circle
    int 21h
    JMP CIRCULO
    
trapezoid_option:
    mov ah, 09h
    lea dx, trapezoid
    int 21h
    jmp TRAPECIO
    
parallelogram_option:
    mov ah, 09h
    lea dx, parallelogram
    int 21h
    JMP PARALELOGRAMO
    
end_program:
    ; Termina el programa
    mov ah, 09h
    lea dx, finish
    int 21h
    mov ah, 4Ch
    int 21h 


CUADRADO:
    lea dx, newline
    int 21h
    lea dx, lado
    int 21h 
    
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER
    
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
    
    ;Se mueven a n1 y n2 para realizar la multiplicacion (Area = L^2) por eso se almacenan el mismo
    MOV n1_ent_baja, AX
    MOV n2_ent_baJa, AX
    
    MOV n1_dec_baja, DX
    MOV n2_dec_baja, DX
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION
    CALL CARGA_DE_VALORES_DEL_AREA
    
    ; Se vuelve al numero del buffer
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
    
    ;Se mueven a n1 y n2 para realizar la multiplicacion (Perimetro = L*4)
    MOV n1_ent_baja, AX
    MOV n2_ent_baJa, 4
    
    MOV n1_dec_baja, DX
    MOV n2_dec_baja, 0
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION
    CALL CARGA_DE_VALORES_DE_PERIMETRO
    
    CALL PRINT_RESULT
    JMP MENU_CONTINUAR
    
RECTANGULO:
    lea dx, newline
    int 21h
    lea dx, lado
    int 21h
     
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER
    
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
                              
    MOV lado1_ent_baja, AX                          
    MOV lado1_dec_baja, DX 
     
    ;reinicia el buffer------------------------------------                        
    mov ah, 09h
    lea dx, lado2
    int 21h
         
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER
                                  
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
                              
    MOV lado2_ent_baja, AX                          
    MOV lado2_dec_baja, DX   
                                
    MOV n2_ent_baja, AX    
    MOV n2_dec_baja, DX 
      
    MOV AX, lado1_ent_baja                           
    MOV DX, lado1_dec_baja                          
                              
    ;Se mueven a n1 y n2 para realizar la multiplicacion (Area = L^2) por eso se almacenan el mismo
    MOV n1_ent_baja, AX    
    MOV n1_dec_baja, DX 
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION
    CALL CARGA_DE_VALORES_DEL_AREA   
    
    ; Se vuelve al numero del buffer
    MOV AX, lado1_ent_baja                           
    MOV DX, lado1_dec_baja 
    
    ;Se mueven a n1 y n2 para realizar la multiplicacion (Perimetro = L*4)
    MOV n1_ent_baja, AX 
    MOV n1_dec_baja, DX  
    
    MOV AX, lado2_ent_baja                           
    MOV DX, lado2_dec_baja     
    
    MOV n2_ent_baJa, AX
    MOV n2_dec_baja, DX
    
    ADD DX, n2_dec_baja  
    
    MOV BX, 100  
    MOV AX, DX  
    MOV DX, 0
    DIV BX 
    MOV n2_dec_baja, DX 
    
    MOV BX, n2_ent_baJa
     
    ADD BX, AX
    ADD BX, n2_ent_baJa
    MOV n2_ent_baJa, BX
         
    ;Segunda suma                          
    MOV DX, n1_dec_baja 
    ADD DX, n1_dec_baja
    MOV BX, 100  
    MOV AX, DX  
    MOV DX, 0
    DIV BX  
    MOV n1_dec_baja, DX
    MOV BX, n1_ent_baJa 
    ADD BX, AX     
    ADD BX, n1_ent_baJa 
    MOV n1_ent_baJa, BX
    ;Tercera Suma 
    MOV DX, n1_dec_baja
    ADD DX, n2_dec_baja
    MOV BX, 100
    MOV AX, DX
    MOV DX, 0
    DIV BX
    MOV perimetro_dec_baja, DX
    MOV BX, n1_ent_baJa
    ADD BX, AX
    ADD BX, n2_ent_baJa
    MOV perimetro_ent_baja, BX 
    
    CALL PRINT_RESULT   
    
    JMP MENU_CONTINUAR
    
    
TRIANGULO:
    lea dx, newline
    int 21h
    lea dx, lado
    int 21h
     
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER

    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
                              
    MOV lado1_ent_baja, AX                          
    MOV lado1_dec_baja, DX 
                          
    MOV n1_ent_baja, AX    
    MOV n1_dec_baja, DX 
                        
    ;Se mueven a n1 y n2 para realizar la multiplicacion (Area = L^2) por eso se almacenan el mismo
    MOV n2_ent_baja, 3    
    MOV n2_dec_baja, 0 
    
    CALL MULTIPLICACION
    CALL CARGA_DE_VALORES_DE_PERIMETRO    

    ;Se hace la multiplicacion

    MOV AX, lado1_ent_baja                           
    MOV DX, lado1_dec_baja  
    
    MOV n1_ent_baja, AX    
    MOV n1_dec_baja, DX
     
    MOV n2_ent_baja, 0    
    MOV n2_dec_baja, 87 
    
    CALL MULTIPLICACION
    MOV altura_ent_alta, DX 
    MOV altura_ent_baja, AX
    MOV altura_dec_baja, CX 

    
    MOV AX, altura_ent_baja                           
    MOV DX, altura_dec_baja
    MOV n1_ent_baja, AX    
    MOV n1_dec_baja, DX 

    MOV n2_ent_baja, 0    
    MOV n2_dec_baja, 50    
    
    CALL MULTIPLICACION   
    MOV n1_ent_alta, DX 
    MOV n1_ent_baja, AX
    MOV n1_dec_baja, CX  
    

    MOV n2_ent_baja, AX
    MOV n2_dec_baja, CX
    
    
    MOV AX, lado1_ent_baja                           
    MOV DX, lado1_dec_baja
    
    MOV n1_ent_baja, AX    
    MOV n1_dec_baja, DX 
        
    ;Se hace la multiplicacion
    CALL MULTIPLICACION
           
    CALL CARGA_DE_VALORES_DEL_AREA    
    CALL PRINT_RESULT     
    JMP MENU_CONTINUAR
    
    
ROMBO:
    lea dx, newline
    int 21h
    lea dx, lado
    int 21h
      
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER
    
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
                              
    MOV lado1_ent_baja, AX                          
    MOV lado1_dec_baja, DX 
     
    ;reinicia el buffer------------------------------------                        
    mov ah, 09h
    lea dx, Diago1
    int 21h     
 
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER
                 
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
                              
    MOV diago1_ent_baja, AX                          
    MOV diago1_dec_baja, DX     
    
    ;reinicia el buffer------------------------------------                        
    mov ah, 09h
    lea dx, Diago2
    int 21h     
 
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER
                               
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
                              
    MOV diago2_ent_baja, AX                          
    MOV diago2_dec_baja, DX 
    
    ; Se vuelve al numero del buffer
    MOV AX, lado1_ent_baja                           
    MOV DX, lado1_dec_baja 
    
    ;Se mueven a n1 y n2 para realizar la multiplicacion (Perimetro = L*4)
   
    MOV n1_ent_baja, AX   
    MOV n1_dec_baja, DX 
    
    MOV n2_ent_baJa, 4
    MOV n2_dec_baja, 0
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION
    CALL CARGA_DE_VALORES_DE_PERIMETRO
    
    MOV AX, diago1_ent_baja                           
    MOV DX, diago1_dec_baja                          
                              
    ;Se mueven a n1 y n2 para realizar la multiplicacion (Area = L^2) por eso se almacenan el mismo
    MOV n1_ent_baja, AX    
    MOV n1_dec_baja, DX 
    
    MOV n2_ent_baja, 0    
    MOV n2_dec_baja, 50     

    ;Se hace la multiplicacion
    CALL MULTIPLICACION
    MOV n1_ent_alta, DX 
    MOV n1_ent_baja, AX
    MOV n1_dec_baja, CX 
    
    MOV AX, diago2_ent_baja                           
    MOV DX, diago2_dec_baja        
      
    MOV n2_ent_baja, AX
    MOV n2_dec_baja, DX
    
    CALL MULTIPLICACION    
    CALL CARGA_DE_VALORES_DEL_AREA 
    
    CALL PRINT_RESULT

    JMP MENU_CONTINUAR
    
    

PENTAGONO:
    lea dx, newline
    int 21h
    lea dx, lado
    int 21h
     
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER
    
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
                              
    MOV lado1_ent_baja, AX                          
    MOV lado1_dec_baja, DX 
                           
    MOV n1_ent_baja, AX    
    MOV n1_dec_baja, DX 
                        
    ;Se mueven a n1 y n2 para realizar la multiplicacion (Area = L^2) por eso se almacenan el mismo
    MOV n2_ent_baja, 5    
    MOV n2_dec_baja, 0 
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION
    CALL CARGA_DE_VALORES_DE_PERIMETRO 

    MOV AX, lado1_ent_baja                           
    MOV DX, lado1_dec_baja  
    
    MOV n1_ent_baja, AX    
    MOV n1_dec_baja, DX
     
    MOV n2_ent_baja, 1    
    MOV n2_dec_baja, 45 
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION
    
    MOV apotema_ent_alta, DX 
    MOV apotema_ent_baja, AX
    MOV apotema_dec_baja, CX 

    
    MOV AX, apotema_ent_baja                           
    MOV DX, apotema_dec_baja
    MOV n1_ent_baja, AX    
    MOV n1_dec_baja, DX 


    MOV n2_ent_baja, 0    
    MOV n2_dec_baja, 50    
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION   
 
    MOV n1_ent_baja, AX
    MOV n1_dec_baja, CX  

    MOV AX, perimetro_ent_baja                           
    MOV DX, perimetro_dec_baja
    
    MOV n2_ent_baja, AX    
    MOV n2_dec_baja, DX 
        
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION
           
    CALL CARGA_DE_VALORES_DEL_AREA   
    CALL PRINT_RESULT     
    JMP MENU_CONTINUAR
    
    
HEXAGONO:
    lea dx, newline
    int 21h
    lea dx, lado
    int 21h
     
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER
    
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
                              
    MOV lado1_ent_baja, AX                          
    MOV lado1_dec_baja, DX 
                              
    MOV n1_ent_baja, AX    
    MOV n1_dec_baja, DX 
                        
    ;Se mueven a n1 y n2 para realizar la multiplicacion (Area = L^2) por eso se almacenan el mismo
    MOV n2_ent_baja, 6    
    MOV n2_dec_baja, 0 
    
    CALL MULTIPLICACION
    CALL CARGA_DE_VALORES_DE_PERIMETRO    

    ;Se hace la multiplicacion

    MOV AX, lado1_ent_baja                           
    MOV DX, lado1_dec_baja  
    
    MOV n1_ent_baja, AX    
    MOV n1_dec_baja, DX
     
    MOV n2_ent_baja, 0    
    MOV n2_dec_baja, 87 
    
    CALL MULTIPLICACION
    
    MOV apotema_ent_alta, DX 
    MOV apotema_ent_baja, AX
    MOV apotema_dec_baja, CX 

    MOV AX, apotema_ent_baja                           
    MOV DX, apotema_dec_baja
    MOV n1_ent_baja, AX    
    MOV n1_dec_baja, DX 

    MOV n2_ent_baja, 0    
    MOV n2_dec_baja, 50    
    
    CALL MULTIPLICACION   
    MOV n1_ent_alta, DX 
    MOV n1_ent_baja, AX
    MOV n1_dec_baja, CX  
    
    MOV n2_ent_baja, AX
    MOV n2_dec_baja, CX
    
    MOV AX, perimetro_ent_baja                           
    MOV DX, perimetro_dec_baja
    
    MOV n1_ent_baja, AX    
    MOV n1_dec_baja, DX 
        
    ;Se hace la multiplicacion
    CALL MULTIPLICACION
           
    CALL CARGA_DE_VALORES_DEL_AREA   
    CALL PRINT_RESULT     
    JMP MENU_CONTINUAR                                               

      
CIRCULO:
    lea dx, newline
    int 21h
    lea dx, radio
    int 21h
     
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER
    
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
    
    ;Se mueven a n1 y n2 para realizar la multiplicacion (Perimetro = 2pi*r)
    MOV n1_ent_baja, AX
    MOV n2_ent_baJa, 6   ;Entero de pi por 2
    
    MOV n1_dec_baja, DX
    MOV n2_dec_baja, 28  ;Decimal de pi por 2
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION
    CALL CARGA_DE_VALORES_DE_PERIMETRO
    
    ; Se vuelve al numero del buffer
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
    
    ;Se mueven a n1 y n2 para realizar la multiplicacion (Area = pi*r^2)
    ;En esta parte se realiza r^2 
    MOV lado1_ent_baja, AX                          
    MOV lado1_dec_baja, DX
    
    MOV n1_ent_baja, AX                          
    MOV n1_dec_baja, DX
    
    MOV n2_ent_baja, 0                          
    MOV n2_dec_baja, 02
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION
   
    MOV n1_ent_alta, DX 
    MOV n1_ent_baja, AX
    MOV n1_dec_baja, CX
    
    MOV n2_ent_baja, 157
    MOV n2_dec_baja, 0
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION  
    
    MOV n1_ent_alta, DX 
    MOV n1_ent_baja, AX
    MOV n1_dec_baja, CX
    
    MOV AX, lado1_ent_baja
    MOV DX, lado1_dec_baja  
    
    MOV n2_ent_baja, AX                          
    MOV n2_dec_baja, DX  
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION 
    
    CALL CARGA_DE_VALORES_DEL_AREA 
    CALL PRINT_RESULT
    JMP MENU_CONTINUAR
    
TRAPECIO:
    lea dx, newline
    int 21h
    lea dx, base_menor
    int 21h
     
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER

    ; Guarda los valores obtenidos en el buffer
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
    MOV base_menor_ent_baja, AX
    MOV base_menor_dec_baja, DX
    
    ;Ingreso de la base mayor
    mov ah, 09h
    lea dx, base_mayor
    int 21h
     
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER  

    ; Guarda los valores obtenidos en el buffer
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
    MOV base_mayor_ent_baja, AX
    MOV base_mayor_dec_baja, DX 
    
    mov ah, 09h
    lea dx, altura
    int 21h
    
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER

    ; Guarda los valores obtenidos en el buffer
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
    MOV altura_ent_baja, AX
    MOV altura_dec_baja, DX
    
    ;Ingreso del lado 1
    mov ah, 09h
    lea dx, lado1
    int 21h
     
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER

    ; Guarda los valores obtenidos en el buffer
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
    MOV lado1_ent_baja, AX
    MOV lado1_dec_baja, DX
    
    ;Ingreso del lado 2
    mov ah, 09h
    lea dx, lado2
    int 21h
     
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER

    ; Guarda los valores obtenidos en el buffer
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
    MOV lado2_ent_baja, AX
    MOV lado2_dec_baja, DX
    
    
    ;Se mueven los valores para poder operarlos
    
    ;Suma de las bases
    MOV DX, base_menor_dec_baja
    ADD DX, base_mayor_dec_baja
    MOV BX, 100
    MOV AX, DX
    MOV DX, 0
    DIV BX
    MOV suma_1_dec_baja, DX
    MOV BX, base_menor_ent_baja
    ADD BX, AX
    ADD BX, base_mayor_ent_baja
    MOV suma_1_ent_baja, BX
    
    ;Suma de las bases + lado1
    MOV DX, suma_1_dec_baja
    ADD DX, lado1_dec_baja
    MOV BX, 100
    MOV AX, DX
    MOV DX, 0
    DIV BX
    MOV suma_2_dec_baja, DX
    MOV BX, suma_1_ent_baja
    ADD BX, AX
    ADD BX, lado1_ent_baja
    MOV suma_2_ent_baja, BX
    
    ;Suma de las bases + lado2
    MOV DX, suma_2_dec_baja
    ADD DX, lado2_dec_baja
    MOV BX, 100
    MOV AX, DX
    MOV DX, 0
    DIV BX
    MOV perimetro_dec_baja, DX
    MOV BX, suma_2_ent_baja
    ADD BX, AX
    ADD BX, lado2_ent_baja
    MOV perimetro_ent_baja, BX
    
    
    ;Se mueven a n1 y n2 para realizar la multiplicacion 
    MOV AX, suma_1_ent_baja
    MOV DX, 0
    
    MOV n1_ent_baja, AX
    MOV n2_ent_baJa, DX
    
    MOV AX, suma_1_dec_baja
    MOV DX, 50
    
    MOV n1_dec_baja, AX
    MOV n2_dec_baJa, DX
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION
    
    MOV n1_ent_alta, DX 
    MOV n1_ent_baja, AX
    MOV n1_dec_baja, CX
    
    MOV AX, altura_ent_baja
    MOV DX, altura_dec_baja
    
    MOV n2_ent_baja, AX
    MOV n2_dec_baja, DX
    
    ;Se hace la multiplicacion
    CALL MULTIPLICACION
    
    CALL CARGA_DE_VALORES_DEL_AREA
    CALL PRINT_RESULT
    JMP MENU_CONTINUAR                                   
   


PARALELOGRAMO: 
    lea dx, newline
    int 21h
    lea dx, base
    int 21h
    
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER

    ; Guarda los valores obtenidos en el buffer
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
    MOV lado1_ent_baja, AX
    MOV lado1_dec_baja, DX
    
    ;Ingreso del lado 2
    mov ah, 09h
    lea dx, lado2
    int 21h
    
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER

    ; Guarda los valores obtenidos en el buffer
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
    MOV lado2_ent_baja, AX
    MOV lado2_dec_baja, DX 
    
    ;Ingreso de la altura
    mov ah, 09h
    lea dx, altura
    int 21h
    
    ;Inicia, lee y convierte lo almacenado en el buffer a entero 
    CALL LEER_CARACTERES_EN_EL_BUFFER

    ; Guarda los valores obtenidos en el buffer
    MOV AX, n_buffer_ent_baja
    MOV DX, n_buffer_dec_baja
    
    MOV altura_ent_baja, AX
    MOV altura_dec_baja, DX
    
    ;Se mueven los valores para poder operarlos
    
    
    ;Se mueven a n1 y n2 para realizar la multiplicacion (Perimetro = 2pi*r)
    MOV AX, lado1_ent_baja
    MOV DX, altura_ent_baja
    
    MOV n1_ent_baja, AX
    MOV n2_ent_baJa, DX
    
    MOV AX, lado1_dec_baja
    MOV DX, altura_dec_baja
    
    MOV n1_dec_baja, AX
    MOV n2_dec_baJa, DX
    
    CALL MULTIPLICACION
    CALL CARGA_DE_VALORES_DEL_AREA
    
    MOV AX, lado1_ent_baja
    MOV DX, lado2_ent_baja
    

    ;Carga el lado 1
    MOV AX, lado1_ent_baja                           
    MOV DX, lado1_dec_baja
    MOV n1_ent_baja, AX
    MOV n1_dec_baja, DX
    
    ;Carga el lado 2
    MOV AX, lado2_ent_baja                           
    MOV DX, lado2_dec_baja
    MOV n2_ent_baja, AX
    MOV n2_dec_baja, DX
    
    ;Suma los lados
    MOV DX, n1_dec_baja
    ADD DX, n2_dec_baja
    MOV BX, 100
    MOV AX, DX
    MOV DX, 0
    DIV BX
    MOV n1_dec_baja, DX
    MOV BX, n1_ent_baJa
    ADD BX, AX
    ADD BX, n2_ent_baJa
    MOV n1_ent_baja, BX
    
    MOV n2_ent_baJa, 2   ;Entero de pi por 2
    MOV n2_dec_baja, 00  ;Decimal de pi por 2
    
    CALL MULTIPLICACION
    CALL CARGA_DE_VALORES_DE_PERIMETRO
    CALL PRINT_RESULT
    JMP MENU_CONTINUAR
    

     
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
    mov cx, 10            ; Cargar el multiplicador en CX
    mul cx                ; Multiplicar AX por CX, resultado en AX
    inc si                ; Mover al siguiente car�cter
    jmp convert_loop      ; Continuar con el siguiente car�cter

done_conversion:
    MOV cx, 10            ; Cargar el multiplicador en CX
    DIV cx                ; Multiplicar AX por CX, resultado en AX
    MOV n_buffer_dec_baja, AX
    XOR AX, AX
    ret 


decimal_founded:
    MOV cx, 10            ; Cargar el multiplicador en CX
    DIV cx                ; Multiplicar AX por CX, resultado en AX
    INC si
    MOV n_buffer_ent_baja, AX
    XOR AX, AX
    jmp convert_loop      ; Continuar con el siguiente car�cter


MULTIPLICACION:
    ;Parte 0 Limpliar las variables de resultado
    MOV resultado_f_ent_alta, 0
    MOV resultado_f_ent_baja, 0
    MOV resultado_f_dec_alta, 0
    MOV resultado_f_dec_baja, 0
    
    MOV resultado_1_ent_alta, 0
    MOV resultado_1_ent_baja, 0
    MOV resultado_1_dec_alta, 0
    MOV resultado_1_dec_baja, 0
    
    
    MOV resultado_2_ent_alta, 0
    MOV resultado_2_ent_baja, 0
    MOV resultado_2_dec_alta, 0
    MOV resultado_2_dec_baja, 0
    
    ;Parte 1 de la multiplicacion (n1 por el entero de n2)

    ; Multiplicar la parte entera por el factor
    MOV AX, n1_ent_baja                 ; Cargar la parte entera en AX
    MOV BX, n2_ent_baja                 ; Cargar el factor en BX
    MUL BX                              ; Multiplicar AX (intPart) por BX (factor)
    MOV resultado_1_ent_baja, AX        ; Guardar el resultado en 'intResult'
    ADD resultado_1_ent_alta, DX
    
    ;Para la parte alta del numero
    MOV AX, n1_ent_alta
    MUL BX
    MOV BX, 10000
    MUL BX
    ;Se guardara la parte alta en DX que deberemos sumar con la parte alta anterior
    ;Mientras que la parte baja se guardara en AX y debemos sumarla con el anterior
    ADD resultado_1_ent_baja, AX
    ;Detecta si hubo un acarreo en la suma
    JC acarreo_detectado_1
    ;Si lo hay, suma 1 al registro DX
    ;Si no lo hay continua
    continuar_1:
    
    ADD resultado_1_ent_alta, DX

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
    
    ;Para la parte alta del numero
    MOV AX, n1_ent_alta
    MUL BX
    MOV BX, 10000
    MUL BX
    
    ;Se guardara la parte alta en DX que deberemos sumar con la parte alta anterior
    ;Mientras que la parte baja se guardara en AX y debemos sumarla con el anterior
    ADD resultado_2_ent_baja, AX
    
    ;Detecta si hubo un acarreo en la suma
    JC acarreo_detectado_2
    ;Si lo hay, suma 1 al registro DX
    ;Si no lo hay continua
    continuar_2:
    ADD resultado_2_ent_alta, DX
    
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
    
    RET

acarreo_detectado_1:
    ADD DX, 1
    JMP continuar_1

acarreo_detectado_2:
    ADD DX, 1
    JMP continuar_2
        
PRINT_RESULT:

    MOV AH, 09h
    LEA DX, perimetro
    INT 21h
    ; Imprimir la parte entera alta y baja
    MOV DX, perimetro_ent_alta   ; Parte alta de la parte entera
    MOV AX, perimetro_ent_baja   ; Parte baja de la parte entera
    CALL PRINT_DWORD             ; Llama al procedimiento para imprimir 32 bits
    
    ; Imprimir el punto decimal
    MOV AH, 02h
    MOV DL, '.'
    INT 21h
    
    
    ; Imprimir la parte decimal alta y baja
    MOV DX, perimetro_dec_alta   ; Parte alta de la parte decimal
    MOV AX, perimetro_dec_baja   ; Parte baja de la parte decimal
    CALL PRINT_DWORD             ; Llama al procedimiento para imprimir 32 bits
       
    ; Salto de l�nea
    MOV AH, 09h
    LEA DX, newline
    INT 21h 
   
    
    ; Salto de l�nea
    MOV AH, 09h
    LEA DX, newline
    INT 21h
    
    MOV AH, 09h
    LEA DX, area
    INT 21h 
   
    
    ; Imprimir el �rea de la misma forma
    MOV DX, area_ent_alta
    MOV AX, area_ent_baja
    CALL PRINT_DWORD
    
    ; Imprimir el punto decimal
    MOV AH, 02h
    MOV DL, '.'
    INT 21h
    
    ; Imprimir la parte decimal
    MOV DX, area_dec_alta
    MOV AX, area_dec_baja
    CALL PRINT_DWORD
    
    ; Salto de l�nea
    MOV AH, 09h
    LEA DX, newline
    INT 21h
   
    
    RET

PRINT_DWORD:
    ; Convierte un n�mero de 32 bits (DX:AX) a ASCII y lo imprime
    ; Se asume que DX tiene la parte alta y AX la parte baja

    PUSH DX            ; Guarda la parte alta en la pila
    PUSH AX            ; Guarda la parte baja en la pila

    MOV CX, 0          ; Inicializa el contador de d�gitos

DIVIDE_LOOP_32:
    MOV BX, 10
    XOR DX, DX         ; Limpiar DX para dividir
    DIV BX             ; Divide AX entre 10, cociente en AX, resto en DX
    ADD DL, '0'        ; Convertir el resto en car�cter ASCII
    PUSH DX            ; Guardar el d�gito en la pila

    INC CX             ; Incrementar contador de d�gitos
    CMP AX, 0
    JNE DIVIDE_LOOP_32 ; Si el cociente no es 0, continuar dividiendo

PRINT_DIGITS_32:
    POP DX             ; Obtener el d�gito de la pila
    MOV AH, 02h        ; Servicio para imprimir un car�cter
    INT 21h
    LOOP PRINT_DIGITS_32  ; Repetir hasta que se impriman todos los d�gitos
    
    POP AX             ; Recupera la parte baja original
    POP DX             ; Recupera la parte alta original
    RET  

LEER_CARACTERES_EN_EL_BUFFER:
    ; Inicializa el puntero del buffer y limpia el buffer
    lea di, input_buffer
    mov byte ptr [di], '$'
    mov cx, 0          ; Contador de caracteres
    ; Lee los caracteres del buffer
    call READ_LOOP
    ; Convertir el buffer de entrada a numero entero
    lea si, input_buffer
    call STR_TO_INT
    

CARGA_DE_VALORES_DEL_AREA:
   MOV area_ent_alta, DX 
   MOV area_ent_baja, AX
   MOV area_dec_baja, CX
   RET 

CARGA_DE_VALORES_DE_PERIMETRO:
   MOV perimetro_ent_alta, DX 
   MOV perimetro_ent_baja, AX
   MOV perimetro_dec_baja, CX 
   RET

MENU_CONTINUAR:
   ; Mostrar opciones del menu con saltos de linea
   mov ah, 09h
   lea dx, continue_program
   int 21h
   lea dx, newline
   int 21h

   mov ah, 09h
   lea dx, close_program
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
   je start
   cmp bl, '2'
   je end_program
          
        
main endp
end main