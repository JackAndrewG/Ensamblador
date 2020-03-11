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

    msg db 10,'ingrese palabra: '
    msgLen equ $- msg

    msgN db 10,'ingrese numero de veces a repetir: '
    msgNLen equ $- msgN

section .bss

    sentence resb 9
    time_number resb 1

section .text

global _start:

_start:

;leer mensaje:
    print msg, msgLen
    read sentence, 9
;leer numero de veces a repetir mensaje:
    print msgN, msgNLen
    read time_number, 1
    mov ecx, [time_number]
    sub ecx, '0'

cicle:
;guardar valor en pila para evitar perdida durante la impresion en pantalla
    push ecx
    print sentence, 9
    pop ecx

    loop cicle

    mov eax, 1
    int 80h