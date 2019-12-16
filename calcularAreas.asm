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

 opcion db "Escriba opción: " ; 10 nueva línea
 opcionLen equ $-opcion
 
 opciones db 10, "1 >Area Circulo", 10, "2 >Area Cuadrado", 10, "3 >Area Rectangulo", 10
 opcionesLen equ $-opciones

 radio db "ingrese radio: "; 10 nueva línea
 radioLen equ $-radio

 base db "ingrese base: "; 10 nueva línea
 baseLen equ $-base
 
 altura db "ingrese altura: "; 10 nueva línea
 alturaLen equ $-altura
 
 mensaje db "Su area es: " ; 10 nueva línea
 mensajeLen equ $-mensaje

section .bss

 option resb 2
 n1 resb 2
 n2 resb 2
 resultado resb 2

section .text
  global _start

_start:

  escribir opciones, opcionesLen
  escribir opcion, opcionLen
  leer option
  
  mov ah, [option]
  sub ah, '0'
  
  cmp ah, 1
   je circulo
  cmp ah, 2
   je cuadrado
  cmp ah, 3
   je rectangulo
   

circulo:

  escribir radio, radioLen
  leer n1
  
  ;obtener radio al cuadrado
  mov ax, [n1]
  sub ax, '0'
  mul ax
  ;valor constante de pi=3
  mov bx, 3
  ;area = pi*r^2
  mul bx
  add ax, '0'
  mov [resultado], ax
  
  jmp operar

cuadrado:
  escribir base, baseLen
  leer n1
  
  mov al, [n1]
  sub al, '0'
  mul al
  add al, '0'
  mov [resultado], al

  jmp operar

rectangulo:
  escribir base, baseLen
  leer n1
  escribir altura, alturaLen
  leer n2
  
  mov al, [n1]
  mov bl, [n2]
  sub al,'0'
  sub bl, '0'
  mul bl
  add al, '0'
  mov [resultado], al

  jmp operar

operar:
  escribir mensaje, mensajeLen
  escribir resultado, 1
  mov eax,1            ; The system call for exit (sys_exit)
  mov ebx,0            ; Exit with return code of 0 (no error)
  int 80h;