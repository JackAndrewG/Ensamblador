%macro leer 1

  mov eax, 3
  mov ebx, 0
  mov ecx, %1
  mov edx, 1
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

  msg db 'Ingrese un numero: '
  msgLen equ $-msg

section .bss

  n resb 2

section .text

global _start

_start:

  imprimir msg, msgLen
  leer n
  mov ax, [n]
  sub ax,'0' ; transformado a numero
  jmp print
  
;-----------PROCESO---------------
  
print:
  
  push ax
  add ax,'0'; transformado a cadena
  mov [n], ax
  imprimir n,1
  pop ax
  dec ax

  cmp ax,0  
  jz salir
  jmp print

salir:
  
  mov eax, 1
  int 80h