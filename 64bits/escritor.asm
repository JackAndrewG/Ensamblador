section .data
  message1 db "Ingrese su nombre: ",10
  message1Len equ $-message1
  message2 db "Su nombre es: "
  message2Len equ $-message2

section .bss
  nombre resb 5
  nombreLen equ $-nombre
section .text
  global _start

_start:

  mov rax,1 
  mov rdi,1
  mov rsi,message1 ; Put the offset of nombre in ecx
  mov rdx,message1Len ; tamaño de caracteres permitidos
  syscall
  

  mov rax,0 ; The system call for read (sys_read)
  mov rdi,0 ; File descriptor 2 - standard output
  mov rsi,nombre ; Put the offset of nombre in ecx
  mov rdx,nombreLen ; tamaño de caracteres permitidos
  syscall ; Call the kernel
  
  mov rax,1 
  mov rdi,1
  mov rsi,message2 ; Put the offset of nombre in ecx
  mov rdx,message2Len ; tamaño de caracteres permitidos
  syscall ; Call the kernel
    
  mov rax,1 
  mov rdi,1
  mov rsi,nombre ; Put the offset of nombre in ecx
  mov rdx,nombreLen ; tamaño de caracteres permitidos
  syscall ; Call the kernel
  

  mov rax,60 ; The system call for exit (sys_exit)
  mov rdi,0
  syscall
