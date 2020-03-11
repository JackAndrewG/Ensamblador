;Author: Jackson Guzmán
;Universidad Nacional de Loja

%macro read 1

  mov eax, 3
  mov ebx, 0
  mov ecx, %1
  mov edx, 2
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

msgInput db 'Ingrese el primer número: '
msgInputLen equ $-msgInput

msgInput2 db 'Ingrese el segundo número: '
msgInput2Len equ $-msgInput2

msgQuotient db 10,'El cociente es: '
msgQuotientLen equ $-msgQuotient

msgResidue db 10,'El residuo es: '
msgResidueLen equ $-msgResidue


section .bss

  n1 resb 2
  n2 resb 2
  quotient resb 2
  residue resb 2
  
section .text

global _start

_start:

  print msgInput, msgInputLen
  read n1
  print msgInput2, msgInput2Len
  read n2

  mov ah, [n1]
  sub ah,'0'
  mov bl, [n2]
  sub bl,'0'
  mov cx,0

compare:
  
  cmp ah,bl
  je result
  jg subtract
  
subtract:

  inc cx
  sub ah,bl
  jmp compare
  
result:
  
  inc cx
  sub ah,bl
  add ah, '0'
  add cx, '0'
  mov [quotient], cx
  mov [residue], ah
  
  print msgQuotient, msgQuotientLen
  print quotient, 2
  print msgResidue, msgResidueLen
  print residue, 2
  jmp salir
  
salir:

  mov eax, 1
  int 80h