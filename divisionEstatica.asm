%macro escribir 2
;imprimir en pantalla
    mov eax,4
    mov ebx,1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro


section .data
 mensaje db "El resultado es: " ; 10 nueva línea
 mensajeLen equ $-mensaje
 
 mensaje2 db 10, "El residuo es: " ; 10 nueva línea
 mensajeLen2 equ $-mensaje
 

section.bss

  resultado resb 1
  residuo resb 1

section .text

  global _start
_start:
    
  ;suma del numeros
    mov ax,9
    mov bl,2
    div bl
    ;add ax,'0'
    add al,'0'; transformar de numero a cadena se suma 0 ASCCI
    mov [resultado], al
    add ah,'0';
    mov [residuo], ah
    
 ;mensaje de resultado 
    escribir mensaje, mensajeLen
    escribir resultado, 1

    escribir mensaje2, mensajeLen2
    escribir residuo, 1
    mov ax,1
    int 80h