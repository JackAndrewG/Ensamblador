%macro leer 1
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, 2
    int 80h
%endmacro

%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data

    input db 10,'Ingrese:'
    inputLen equ $-input
    msg db 'Encontrado!',10
    msgLen equ $-msg

    msg2 db 'No encontrado!',10
    msg2Len equ $-msg2

section .bss

n1 resb 1
n2 resb 1 
n3 resb 1
buscado resb 1

section .text

global _start:

_start:

    escribir input, inputLen
    leer n1
    escribir input, inputLen
    leer n2
    escribir input, inputLen
    leer n3
    escribir input, inputLen
    leer buscado

    mov ah, [n1]
    mov al, [n2]
    mov bh, [n3]
    mov bl, [buscado]
    mov cx, 1
    jmp principal

encontrado:
    escribir msg, msgLen
    jmp salir

noEncontrado:
    escribir msg2, msg2Len
    jmp salir

principal:
    cmp cx, 1
    je primero
    cmp cx, 2
    je segundo
    cmp cx, 3
    je tercero

    jmp noEncontrado

    primero:
    xchg dh, ah
    jmp buscar
    segundo:
    xchg dh, al
    jmp buscar
    tercero:
    xchg dh, bh
    jmp buscar

buscar:
    cmp bl, dh
    jz encontrado
    inc cx
    jmp principal

salir: 
    mov eax, 1
    int 80h

