%macro read 1

    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, 2

%endmacro

%macro print 2

    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2

%endmacro

section .data

    msg db 10,'el valor de cx es: '
    msgLen equ $-msg

section .bss

    n resb 2

section .text

global _start:

_start:

    read n
    mov cx, [n]
    sub cx, '00'

ciclo: 
    dec cx
    jnz imprimirMensaje
    cmp cx, 0
    jz salir

imprimirMensaje:
    push cx
    print msg, msgLen
    print cx, 2
    pop cx
    jmp ciclo

salir:
    mov eax, 1
    int 80h
