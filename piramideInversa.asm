%macro imprimir 2

  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 80h 

%endmacro

section .data

  asterisco db '*'
  newL db 10,''
  space db ' '

section .bss

    numerito resb 1

section .text

global _start: 

_start:



  mov ecx, 9
  mov ebx, ecx

proceso:
    push ecx
    push ecx
    push ecx
    jmp linea
    pop ecx
    jmp salto
    push ecx
    jmp invisible
    
    ;pop ecx
    ; add ecx, '0'
    ; mov [numerito], ecx
    ; imprimir numerito,1
    ; dec ecx
    ; loop proceso
    jmp salir
linea:
    
    push ecx
    call imprimirAsterisco
    pop ecx
    loop linea

salto: 
    call nuevaLinea

invisible:
    call espacio

    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call nuevaLinea

    ; call espacio
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call nuevaLinea

    ; call espacio
    ; call espacio
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call imprimirAsterisco
    ; call nuevaLinea

    jmp salir

espacio:

  mov eax, 4
  mov ebx, 1
  mov ecx, space
  mov edx, 1
  int 80h 
  
  ret

nuevaLinea:

  mov eax, 4
  mov ebx, 1
  mov ecx, newL
  mov edx, 1
  int 80h 
  
  ret

imprimirAsterisco:

  mov eax, 4
  mov ebx, 1
  mov ecx, asterisco
  mov edx, 1
  int 80h 
  
  ret

salir:

  mov eax, 1
  int 80h