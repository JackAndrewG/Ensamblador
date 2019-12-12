;nasm 2.10.09

section .data
 n1: db 'Jackson',10 ; 'Hello Dcoder!' plus a linefeed character
 n1Len: equ $-n1 ; Length of the 'Hello Dcoder!' string
 
 n2: db 'Andrews',10 ; 'Hello Dcoder!' plus a linefeed character
 n2Len: equ $-n2 ; Length of the 'Hello Dcoder!' string


 n3: db 'Guzmán',10 ; 'Hello Dcoder!' plus a linefeed character
 n3Len: equ $-n3 ; Length of the 'Hello Dcoder!' string

 n4: db 'Jackson',10 ; 'Hello Dcoder!' plus a linefeed character
 n4Len: equ $-n4 ; Length of the 'Hello Dcoder!' string


section .text
  global _start

_start:
  mov eax,4 ; The system call for write (sys_write)
  mov ebx,1 ; File descriptor 1 - standard output
  mov ecx,n1 ; Put the offset of hello in ecx
  mov edx,n1Len ; helloLen is a constant, so we don't need to say
   ; mov edx,[helloLen] to get it's actual value
  int 80h ; Call the kernel
  
  mov ecx,n2 ; Put the offset of hello in ecx
  mov edx,n2Len ; helloLen is a constant, so we don't need to say
   ; mov edx,[helloLen] to get it's actual value
  int 80h ; Call the kernel
  
  mov ecx,n3 ; Put the offset of hello in ecx
  mov edx,n3Len ; helloLen is a constant, so we don't need to say
   ; mov edx,[helloLen] to get it's actual value
  int 80h ; Call the kernel
  
  mov ecx,n4 ; Put the offset of hello in ecx
  mov edx,n4Len ; helloLen is a constant, so we don't need to say
   ; mov edx,[helloLen] to get it's actual value
  int 80h ; Call the kernel

  mov eax,1 ; The system call for exit (sys_exit)
  mov ebx,0 ; Exit with return code of 0 (no error)
  int 80h;