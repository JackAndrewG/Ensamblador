;arreglo mayor

%macro escribir 2
;imprimir en pantalla
    mov eax,4
    mov ebx,1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 1
;leer un valor con 2 espacios-bytes
    mov eax,3
    mov ebx,0
    mov ecx, %1
    mov edx, 2
    int 80h
%endmacro

section .data

msgInput db "ingrese un numero:", 10
msgInputLen equ $-msgInput

msgOut db "el mayor de estos numeros es: "
msgOutLen equ $-msgOut

arreglo db 0,0,0,0,0,0
arregloLen equ $-arreglo

section .bss

    numero resb 2

section .text

global _start:

_start:

    mov esi, arreglo
    mov edi, 0
    
    escribir msgInput, msgInputLen

ingresando:

    leer numero
    mov al, [numero]
    sub al, '0'
    mov [esi], al
    
    add esi, 1
    add edi, 1

    cmp edi, arregloLen
    jb ingresando;salta si es menor al comparar
;resetear valores
    mov esi, 0
	mov bl, 0		; se registra el mayor número

verificacion:
    mov al, [esi]
    cmp al, [esi+1]
    jb menor
    jg mayor

menor:
    cmp al, bl
    jb guardarMenor
    jmp indices
guardarMenor:
    mov bl, al
    jmp indices
mayor:
    cmp bh, al
    jb guardarMayor
    jmp indices
guardarMayor:
    mov bh, al
    jmp indices
    
indices:
    inc esi
    inc edi
    cmp edi, arregloLen
	jb verificacion
    jg imprimir

imprimir:

    add 
    , '0'
	mov [numero], esi

    escribir msgOut, msgOutLen
    escribir numero, 1

salir:
	mov eax, 1
	int 80h	