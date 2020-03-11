
%macro escribir 2
;imprimir en pantalla
    mov eax,4
    mov ebx,1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 1
;leer un valor con 2 espacios-bytes
    mov eax,3
    mov ebx,0
    mov ecx, %1
    mov edx, 2
    int 80h
%endmacro

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
  
    escribir mN1, mn1Len  
    leer n1
      
    escribir mN2, mn2Len
    leer n2
    
  ;suma de numeros
    mov ax,[n1]
    mov bx,[n2]
    sub ax,'0'
    sub bx,'0'
    add ax,bx
    add ax,'0'; transformar de numero a cadena se suma 0 ASCCI
    
    mov [suma], eax
    
 ;mensaje de resultado 
    escribir mensaje, mensajeLen
    escribir suma, 1
    
    mov eax,1
    int 80h