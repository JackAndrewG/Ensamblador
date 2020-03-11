; PROGRAMA ENSAMBLADOR QUE PERMITE INGRESAR UN CARACTER E IDENTIFICAR SI SE TRATA DE:
;CONSONANTE
;VOCAL
;CARACTER ESPECIAL

; REALIZADO POR: JACKSON GUZMAN
; FECHA: 20-02-2020
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

    input db 10,'Ingrese un caracter: '
    inputLen equ $-input

    esnumero db 'Es numero',10
    esnumeroLen equ $-esnumero

    esconsonante db 'Es consonante',10
    esconsonanteLen equ $-esconsonante

    vocal db 'Es vocal',10
    vocalLen equ $-vocal

section .bss

    caracter resb 2

section .text

global _start:

_start:

    escribir input, inputLen
    leer caracter
    mov ah, [caracter]; dejar tal cual para codigo en asciii

inicializarNumero:
    sub ah, 48
    ;jmp esNumero    
    mov ecx, 10 ;asignar el primer numero ascii para numeros
    mov al, 9
    ;mov eax, '9'
numero:
    cmp ah, al
    je esNumero
    dec al
    loop numero

    ; mov ax, [caracter]; dejar tal cual para codigo en asciii
    ; cmp ax, '97'
    ; je VOCAL
    ; cmp ax, '101'
    ; je VOCAL
    ; cmp ax, '105'
    ; je VOCAL
    ; cmp ax, '111'
    ; je VOCAL
    ; cmp ax, '117'
    ; je VOCAL

consonante:
    escribir esconsonante, esconsonanteLen
    jmp salir

VOCAL:
    escribir vocal, vocalLen
    jmp salir

esNumero:
    ;add ax,'0'
    ;mov [caracter], ah
    escribir esnumero,esnumeroLen

salir:
    mov eax, 1
    int 80h