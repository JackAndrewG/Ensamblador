section .data

    numero1 db '3277'
    numero2 db '2566'
    
    respuesta db '    '
section .bss

section .text

    global _start

_start:
    
    mov esi, 3
    mov ecx, 4
    clc; desactiva el carry bit de estado de la bandera carry

procesoResta:    
    mov al, [numero1 + esi]; cadena + su posicion
    mov ah, [numero2 + esi]
    sbb al, ah; ó también adc al, [numero2 + esi]
    aas; detecta si la resta es mayor que 9 y automaticamente suma 6 -> 0b0110
    pushf; guarda en pila los estados de las banderas
    or al, 30h
    popf; obtener los estados de las banderas desde pila
    mov [respuesta + esi], al
    dec esi

    loop procesoResta

    mov eax, 4
    mov ebx, 1
    mov ecx, respuesta
    mov edx, 4
    int 80h
    
    mov eax, 1
    int 80h