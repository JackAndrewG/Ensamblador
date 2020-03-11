section .data

section .bss

numero resb 1

section .text

global _start:

_start:

    mov eax, 5
    mov ebx, 4
    xchg eax, ebx

    add ebx, '0'
    mov [numero], ebx

    mov eax, 4
    mov ebx, 1
    mov ecx, numero
    mov edx, 1
    int 80h

    mov eax, 1
    mov ebx, 0 
    int 80h