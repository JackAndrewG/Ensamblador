;nasm 2.10.09

section .data
 mensaje db "El resultado es: ", 10 ; 10 nueva línea
 mensajeLen equ $-mensaje
 
 mN1 db "ingrese numero: "; 10 nueva línea
 mn1Len equ $-mN1
 
 mN2 db "ingrese numero: "; 10 nueva línea
 mn2Len equ $-mN2

section.bss
  n2 resb 1
  suma resb 1
  n1 resb 1
 
  

section .text

  global _start
_start:
  
  ; ingreso del primer número
    mov eax,4
    mov ebx,1
    mov ecx, mN1
    mov edx, mn1Len
    int 80h
  
    mov eax,3
    mov ebx,0
    mov ecx,n1
    mov edx,2
    int 80h
    
  ;ingreso del segundo número
    mov eax,4
    mov ebx,1
    mov ecx, mN2
    mov edx, mn2Len
    int 80h
  
    mov eax,3
    mov ebx,0
    mov ecx, n2
    mov edx,2
    int 80h
    
  ;suma de numeros
    mov ax,[n1]
    mov bx,[n2]
    sub ax,'0'
    sub bx,'0'
    add ax,bx
    add ax,'0'; transformar de numero a cadena se suma 0 ASCCI
    
    mov [suma], eax
    
 ;mensaje de resultado 
    mov eax,4
    mov ebx,1
    mov ecx, mensaje
    mov edx, mensajeLen
    int 80h
    
    mov eax,4
    mov ebx,1
    mov ecx, suma
    mov edx,1
    int 80h
    
    mov eax,1
    int 80h