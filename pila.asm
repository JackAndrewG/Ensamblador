%macro read 1

    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, 2
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

    msg db 10, 'el numero es: '
    msgLen equ $-msg

section .bss

    n resb 2

section .text

global _start:

_start:

    read n
    mov [n], eax
    sub eax, '0'

compare:

    cmp eax, 0
    jz exit
    jmp cicle

cicle:

    dec eax
    push eax
    print eax, 1
    pop eax
    jmp compare

exit:
    mov eax,1
    int 80h