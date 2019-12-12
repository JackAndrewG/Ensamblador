section .data
    primerNombre db 'Jackson',10
    segundoNombre db 'Andrews',10
    primerApellido db 'Guzman',10
    segundoApellido db 'Tituana'

    primerNombreLen equ $-primerNombre
    segundoNombreLen equ $-segundoNombre
    primerApellidoLen equ $-primerApellido
    segundoApellidoLen equ $-segundoApellido

section .text
    global _start
_start:

    mov rax, 1
    mov rdi, 1
    mov rsi, primerNombre
    mov rdx, primerNombreLen
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, segundoNombre
    mov rdx, segundoNombreLen
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, primerApellido
    mov rdx, primerApellidoLen
    syscall


    mov rax, 1
    mov rdi, 1
    mov rsi, segundoApellido
    mov rdx, segundoApellidoLen
    syscall

    mov rax, 60
    mov rdi, 0
    syscall