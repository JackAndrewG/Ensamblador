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
 mensaje db "El resultado es: " ; 10 nueva línea
 mensajeLen equ $-mensaje
 
 mensaje2 db 10, "El residuo es: " ; 10 nueva línea
 mensajeLen2 equ $-mensaje
 
 mN1 db "ingrese numero: "; 10 nueva línea
 mn1Len equ $-mN1
 
 mN2 db "ingrese numero: "; 10 nueva línea
 mn2Len equ $-mN2

section.bss
  n2 resb 1
  resultado resb 1
  residuo resb 1
  n1 resb 1

section .text

  global _start
_start:
  
    escribir mN1, mn1Len  
    leer n1
      
    escribir mN2, mn2Len
    leer n2
    
  ;suma del numeros
    mov al,[n1]
    mov bl,[n2]
    sub al,'0'
    sub bl,'0'
    div bl
    add al,'0'; transformar de numero a cadena se suma 0 ASCCI
    
    mov [resultado], al
    mov [residuo], bl
    
 ;mensaje de resultado 
    escribir mensaje, mensajeLen
    escribir resultado, 1
    escribir mensaje2, mensajeLen2
    escribir residuo, 1
    mov ax,1
    int 80h