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

    msgInput1 db 10,'ingrese primer numero:'
    msgInput1Len equ $-msgInput1
    msgInput2 db 10,'ingrese segundo numero:'
    msgInput2Len equ $-msgInput2

    msg_negative db 'es negativo',10
    msg_negativeLen equ $-msg_negative
    msg_positive db 'es positivo',10
    msg_positiveLen equ $-msg_positive

section .bss

    n1 resb 2
    n2 resb 2

section .text

global _start

_start:

    print msgInput1, msgInput1Len
    read n1
    print msgInput2, msgInput2Len
    read n2
    
    mov al, [n1]; mov el valor que posee n1 a ax
    mov bl, [n2]; mov el valor que posee n2 a bx
    
    sub al, '0'; convertir de caracter a valor numerico
    sub bl, '0'; convertir de caracter a valor numerico

    sub al,bl ; produce un cambio de banderas
    js negativo; salta si existe signo, es decir, si el valor es negativo
    jmp positivo

positivo:

    print msg_positive, msg_positiveLen
    jmp salir

negativo:

    print msg_negative, msg_negativeLen
    jmp salir

salir: 
    mov eax, 1 
    int 80h
