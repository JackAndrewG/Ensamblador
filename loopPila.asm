;aplicacion asm que permite generar un mensaje cuantas veces se requiera

%macro read 2

    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, %2
    int 80h

%endmacro 

%macro print 2

    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
    
%endmacro 

section .data

    sign db '*'
    signLen equ $- sign
    newL db 10,''

section .bss

    time_number resb 2

section .text

global _start:

_start:

    mov ecx, 9
    ;add ecx, '0'
    mov [time_number], ecx
cicle:
;guardar valor en pila para evitar perdida durante la impresion en pantalla

    push ecx
    print sign, signLen
    pop ecx

    loop cicle
    
    print newL,1
    mov ecx, [time_number]
    ;sub ecx, '0'
    dec ecx
    ;add ecx, '0'
    mov [time_number], ecx
    ;sub ecx, '0'
    cmp ecx, 0
    jz salir
    jmp cicle
salir:
    mov eax, 1
    int 80h