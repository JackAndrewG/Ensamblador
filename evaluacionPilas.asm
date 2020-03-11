; EVALUACION DE PILAS
; FECHA: 03/02/2020
; POR: JACKSON GUZMÁN

; algoritmo que permite:
; ingresar 5 numeros 
; ordenar de menor a mayor
; determinar el numero menor 
; determinar el numero mayor

%macro leer 1

  mov eax, 3
  mov ebx, 2
  mov ecx, %1
  mov edx, 2
  int 80h

%endmacro

%macro imprimir 2

  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 80h

%endmacro

section .data 

    msgInput db 10,'Ingrese numero: '
    msgInputLen equ $- msgInput

    msgMayor db 10,'El mayor es: '
    msgMayorLen equ $- msgMayor

    msgMenor db 10,'El menor es: '
    msgMenorLen equ $- msgMenor

section .bss

    n1 resb 1
    n2 resb 1
    n3 resb 1
    n4 resb 1
    n5 resb 1
    mayor resb 1
    menor resb 1
    ordenado resb 1

section .text

global _start

_start:

;asignar valores a variables
    imprimir msgInput, msgInputLen
    leer n1
    imprimir msgInput, msgInputLen
    leer n2
    imprimir msgInput, msgInputLen
    leer n3
    imprimir msgInput, msgInputLen
    leer n4
    imprimir msgInput, msgInputLen
    leer n5

;mover a registros las variables
    imprimir msgMayor, msgMayorLen

    mov ah, [n1]  
    sub ah,'0'
    mov al, [n2]  
    sub al,'0'
    mov bh, [n3]  
    sub bh,'0'
    mov bl, [n4]  
    sub bl,'0'
    mov ch, [n5]  
    sub ch,'0'

;--------------COMPRARACIONES MAYOR-------
comparar_primero_segundo:

    cmp ah,al; 1® > 2®  
    jg comparar_primero_tercero; si salta ah es mayor

    cmp al,bh; 2® > 3®
    jg comparar_segundo_cuarto;si salta al es mayor

    cmp bh, bl; 3® > 4®
    jg comparar_tercero_quinto;si salta bh es mayor

    cmp bl, ch; 4® > 5®
    jg cuarto;si salta bl es mayor
    jmp quinto; salta pq ch es mayor

comparar_segundo_cuarto:

    cmp al, bl; 2® > 4®
    jg comparar_segundo_quinto;si salta al es mayor

    cmp bl, ch; 4® > 5®
    jg cuarto;si salta bl es mayor
    jmp quinto; salta pq ch es mayor

comparar_segundo_quinto:

    cmp al, ch; 2® > 5®
    jg segundo
    jmp quinto

comparar_tercero_quinto:
    
    cmp bh,ch; 4® > 5®
    jg tercero
    jmp quinto

comparar_primero_tercero:

    cmp ah,bh; 1® > 3® 
    jg comparar_primero_cuarto; si salta ah es mayor
    
    cmp bh, bl; 3® > 4®
    jg comparar_tercero_quinto;si salta bh es mayor

    cmp bl, ch; 4® > 5®
    jg cuarto;si salta bl es mayor
    jmp quinto; salta pq ch es mayor    

comparar_primero_cuarto:

    cmp ah,bl; 1® > 4® 
    jg comparar_primero_quinto; si salta ah es mayor

    cmp bl, ch; 4® > 5®
    jg cuarto;si salta bl es mayor
    jmp quinto; salta pq ch es mayor    

comparar_primero_quinto:

    cmp ah,ch; 1® > 5®
    jg primero; si salta ah es mayor
    jmp quinto; salta pq ch es mayor    

;---------------MAYOR---------------
primero:

    add ah, '0'
    mov [mayor], ah
    imprimir mayor, 1
    jmp comparar_menor

segundo:

    add al, '0'
    mov [mayor], al
    imprimir mayor, 1
    jmp comparar_menor

tercero:

    add bh, '0'
    mov [mayor], bh
    imprimir mayor, 1
    jmp comparar_menor

cuarto:

    add bl, '0'
    mov [mayor], bl
    imprimir mayor, 1
    jmp comparar_menor

quinto:

    add ch, '0'
    mov [mayor], ch
    imprimir mayor, 1
    jmp comparar_menor

;-----------------------------
comparar_menor:
;mover a registros las variables

    imprimir msgMenor, msgMenorLen
    mov ah, [n1]  
    sub ah,'0'
    mov al, [n2]  
    sub al,'0'
    mov bh, [n3]  
    sub bh,'0'
    mov bl, [n4]  
    sub bl,'0'
    mov ch, [n5]  
    sub ch,'0'

;--------------COMPRARACIONES MENOR-------
comparar_primero_segundoM:

    cmp ah,al; 1® < 2®  
    jng comparar_primero_terceroM; si salta ah es menor

    cmp al,bh; 2® < 3®
    jng comparar_segundo_cuartoM;si salta al es menor

    cmp bh, bl; 3® < 4®
    jng comparar_tercero_quintoM;si salta bh es menor

    cmp bl, ch; 4® < 5®
    jng cuartoM;si salta bl es menor
    jmp quintoM; salta pq ch es menor

comparar_segundo_cuartoM:

    cmp al, bl; 2® < 4®
    jng comparar_segundo_quintoM;si salta al es menor

    cmp bl, ch; 4® < 5®
    jng cuartoM;si salta bl es menor
    jmp quintoM; salta pq ch es menor

comparar_segundo_quintoM:

    cmp al, ch; 2® < 5®
    jng segundoM
    jmp quintoM

comparar_tercero_quintoM:
    
    cmp bh,ch; 4® < 5®
    jng terceroM
    jmp quintoM

comparar_primero_terceroM:

    cmp ah,bh; 1® < 3® 
    jng comparar_primero_cuartoM; si salta ah es menor
    
    cmp bh, bl; 3® < 4®
    jng comparar_tercero_quintoM;si salta bh es menor

    cmp bl, ch; 4® < 5®
    jng cuartoM;si salta bl es menor
    jmp quintoM; salta pq ch es menor    

comparar_primero_cuartoM:

    cmp ah,bl; 1® < 4® 
    jng comparar_primero_quintoM; si salta ah es menor

    cmp bl, ch; 4® < 5®
    jng cuartoM;si salta bl es menor
    jmp quintoM; salta pq ch es menor    

comparar_primero_quintoM:

    cmp ah,ch; 1® < 5®
    jng primeroM; si salta ah es menor
    jmp quintoM; salta pq ch es menor    

; ;---------------MENOR---------------
primeroM:

    add ah, '0'
    mov [menor], ah
    imprimir menor, 1
    jmp salir

segundoM:

    add al, '0'
    mov [menor], al
    imprimir menor, 1
    jmp salir

terceroM:

    add bh, '0'
    mov [menor], bh
    imprimir menor, 1
    jmp salir

cuartoM:

    add bl, '0'
    mov [menor], bl
    imprimir menor, 1
    jmp salir

quintoM:

    add ch, '0'
    mov [menor], ch
    imprimir menor, 1
    jmp salir

; ;-----------------------------

salir:

    mov eax, 1
    int 80h


;------ORDENAR PILA-------
;mover a registros las variables

    mov ah, [n1]  
    sub ah,'0'
    mov al, [n2]  
    sub al,'0'
    mov bh, [n3]  
    sub bh,'0'
    mov bl, [n4]  
    sub bl,'0'
    mov ch, [n5]  
    sub ch,'0'
    mov dx,0

compararPrimeroSegundo:
    cmp ah, al
    jg reasignarPS
    jng reasignarSP

compararPrimeroTercero:
    cmp ah, bh
    jg reasignarPT
    jng reasignarTP

compararPrimeroCuarto:
    cmp ah, bl
    jg reasignarPC
    jng reasignarCP

compararPrimeroQuinto:
    cmp ah, ch
    jg reasignarPQ
    jng reasignarQP


reasignarPS:
    push al
    push ah
    ; xchg ah, bh
    jmp compararPrimeroTercero

reasignarSP:
    push ah
    push al
    xchg al, bh
    jmp ordenarPila


reasignarPT:
    push bh
    push ah
    ; xchg ah, bh
    jmp compararPrimeroTercero

reasignarTP:
    push ah
    push al
    xchg al, bh
    jmp ordenarPila    
