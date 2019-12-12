section .data
    
    message db "World",10
    messageLen equ $-message

section .text

global _start

_start:

    mov     eax, 1
    mov     edi, 1
    mov     esi, message
    mov     edx, messageLen
    syscall
    
    mov     eax, 60
    mov     ebx, 0
    syscall