%macro imprimir 2

  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 80h

%endmacro


section .data

  msg db 10,'hola'
  msglen equ $-msg

section .text

global _start:

_start: 

  mov ecx, 10

ciclo:

  push ecx
  imprimir msg, msglen
  pop ecx
  loop ciclo
  
  mov eax, 1
  int 80h