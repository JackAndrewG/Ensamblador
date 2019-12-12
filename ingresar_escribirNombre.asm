;nasm 2.10.09

section .data

  message1 db "ingrese su nombre:", 10
  Lmessage1 equ $-message1
  message2 db "nombre ingresado: "
  Lmessage2 equ $-message2
  
section.bss

  nombre resb 5
  Lnombre equ $-nombre
  
section .text
  global _start

_start:
  
  
  mov eax, 4 ; operación de escritura
  mov ebx, 1 ; tipo estandar de salida
  mov ecx, message1
  mov edx, Lmessage1
  int 80h
  
  mov eax,3 ; The system call for read (sys_read)
  mov ebx,2 ; File descriptor 2 - standard output
  mov ecx,nombre ; Put the offset of nombre in ecx
  mov edx,5 ; tamaño de caracteres permitidos
  int 80h ; Call the kernel
 
  mov eax, 4 ; operación de escritura
  mov ebx, 1 ; tipo estandar de salida
  mov ecx, message2
  mov edx, Lmessage2
  int 80h
  
  mov eax, 4 ; operación de escritura
  mov ebx, 1 ; tipo estandar de salida
  mov ecx, nombre
  mov edx, Lnombre
  int 80h
  
  mov eax,1 ; The system call for exit (sys_exit)
  mov ebx,0 ; Exit with return code of 0 (no error)
  int 80h;