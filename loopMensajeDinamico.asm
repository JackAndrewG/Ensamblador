%macro leer 2

  mov eax, 3
  mov ebx, 2
  mov ecx, %1
  mov edx, %2
  int 80h

%endmacro

%macro imprimir 2

  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 80h

%endmacro

section .data

    msj db 10, 'ingrese palabra :  '
    len equ $ - msj

    msj2 db 10, 'ingrese la cantidad de veces que desea mostrar el mensaje: '
    len2 equ $ - msj2

section .bss

    nota resb 5
    numero resb 1

section .text
        
    global _start

_start:

;---PALABRA A MOSTRAR---
    imprimir msj, len
    leer nota, 5; LEER NOTA DE NO MAS DE 5 CARACTERES (incluyendo enter)
    mov eax, [nota]

;---VECES A REPETIR PALABRA---
    imprimir msj2, len2
    leer numero, 1
    mov ecx, [numero]
    sub ecx, '0'

ciclo:        

    push ecx; GUARDAR EN PILA EL NUMERO DE VECES A REPETIR
    imprimir nota,5;IMPRIMIR MENSAJE
    pop ecx; COLOCAR EL VALOR DE PILA EN EL REGISTRO

    loop ciclo ; COMPARA EL REGISTRO CON 0 

;---SALIR DEL PROGRAMA---
    mov eax, 1
    int 80h