;nasm 2.10.09
; CARACTERES QUE SE PUEDEN MODIFICAR
;byte 1
;word 2
;dword 4
;qword 8
;tbyte 10


section .data
 msj: db 'Hello Dcoder!',10 ; 'Hello Dcoder!' plus a linefeed character
 msjLen: equ $-msj ; Length of the 'Hello Dcoder!' string

section .text
  global _start

_start:
  mov eax,4 ; The system call for write (sys_write)
  mov ebx,1 ; File descriptor 1 - standard output
  mov ecx,msj ; Put the offset of hello in ecx
  mov edx,msjLen ; helloLen is a constant, so we don't need to say
   ; mov edx,[helloLen] to get it's actual value
  int 80h ; Call the kernel
  
  mov [msj], dword 'hola'; modifica el valor de la variable por otro contenido en la dirección especificada
  
  mov eax,4 ; The system call for write (sys_write)
  mov ebx,1 ; File descriptor 1 - standard output
  mov ecx,msj ; Put the offset of hello in ecx
  mov edx,msjLen ; helloLen is a constant, so we don't need to say
   ; mov edx,[helloLen] to get it's actual value
  int 80h ; Call the kernel
  
  mov [msj+8], dword 'hola'; modifica el valor de la variable por otro contenido en la dirección especificada

  mov eax,4 ; The system call for write (sys_write)
  mov ebx,1 ; File descriptor 1 - standard output
  mov ecx,msj ; Put the offset of hello in ecx
  mov edx,msjLen ; helloLen is a constant, so we don't need to say
   ; mov edx,[helloLen] to get it's actual value
  int 80h ; Call the kernel


  mov eax,1 ; The system call for exit (sys_exit)
  mov ebx,0 ; Exit with return code of 0 (no error)
  int 80h;