;nasm 2.10.09

section .data
 msj: db 'muestra * 9 veces',10 ; 'Hello Dcoder!' plus a linefeed character
 msjLen: equ $-msj ; Length of the 'Hello Dcoder!' string
 asterisco times 9 db '*', 10
 asteriscoLen: equ $-asterisco
section .text
  global _start

_start:
  mov eax,4 ; The system call for write (sys_write)
  mov ebx,1 ; File descriptor 1 - standard output
  mov ecx,msj ; Put the offset of hello in ecx
  mov edx,msjLen ; helloLen is a constant, so we don't need to say
   ; mov edx,[helloLen] to get it's actual value
  int 80h ; Call the kernel
  
  mov eax,4 ; The system call for write (sys_write)
  mov ebx,1 ; File descriptor 1 - standard output
  mov ecx,asterisco ; Put the offset of hello in ecx
  mov edx,asteriscoLen ; helloLen is a constant, so we don't need to say
   ; mov edx,[helloLen] to get it's actual value
  int 80h ; Call the kernel

  mov eax,1 ; The system call for exit (sys_exit)
  mov ebx,0 ; Exit with return code of 0 (no error)
  int 80h;