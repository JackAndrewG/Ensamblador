%macro escribir 2
;imprimir en pantalla
    mov eax,1
    mov edi,1
    mov esi, %1
    mov edx, %2
    syscall
%endmacro

%macro leer 1
;leer un valor con 2 espacios-bytes
    mov eax,0
    mov edi,0
    mov esi, %1
    mov edx, 2
    syscall
%endmacro

section .data

 opcion db "Escriba opción: " ; 10 nueva línea
 opcionLen equ $-opcion
 
 mN1 db "ingrese numero: "; 10 nueva línea
 mn1Len equ $-mN1
 
 mN2 db "ingrese numero: "; 10 nueva línea
 mn2Len equ $-mN2
 
 mensaje db "El resultado es: " ; 10 nueva línea
 mensajeLen equ $-mensaje
 
 mensaje2 db "El residuo es: ",10 ; 10 nueva línea
 mensajeLen2 equ $-mensaje2
 

section .bss
  option resb 2
  n1 resb 2
  n2 resb 2
  resultado resb 2
  residuo resb 2

section .text

  global _start
_start:
  
    escribir mN1, mn1Len  
    leer n1
    escribir mN2, mn2Len
    leer n2
    
    escribir opcion, opcionLen
    leer option
    
    mov ah, [option]
    sub ah, '0'
    
    
    cmp ah, 1
    je sumar
    cmp ah, 2
    je restar
    cmp ah, 3
    je multiplicar
    cmp ah, 4
    je dividir
    
sumar:
  ;suma del numeros
    mov ax,[n1]
    mov di,[n2]
    sub ax,'0'
    sub di,'0'
    add ax,di
    add ax,'0'; transformar de numero a cadena se suma 0 ASCCI
    
    mov [resultado], ax
    jmp operar
    
restar:
  ;suma del numeros
    mov ax,[n1]
    mov di,[n2]
    sub ax,'0'
    sub di,'0'
    sub ax,di
    add al,'0'; transformar de numero a cadena se suma 0 ASCCI
    
    mov [resultado], ax
    jmp operar
    
multiplicar:
  ;suma del numeros
    mov al,[n1]
    mov di,[n2]
    sub al,'0'
    sub dl,'0'
    mul dl
    add al,'0'; transformar de numero a cadena se suma 0 ASCCI
    
    mov [resultado], al
    jmp operar
    
dividir:
  ;suma del numeros
    mov al,[n1]
    mov dl,[n2]
    ;sub al,'0'
    ;sub bl,'0'
    div dl
    add al, '0'; transformar de numero a cadena se suma 0 ASCCI
    add ah, '0'
    mov [resultado], al
    mov [residuo], ah
    escribir mensaje2, mensajeLen2
    escribir residuo, 1
    
    jmp operar
    
 operar:
 ;mensaje de resultado 
    escribir mensaje, mensajeLen
    escribir resultado, 1
    mov ax,60
    mov di,0
    syscall