%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data 
    
    archivo db "codigo.txt", 0
    errorMsg db 'Error en la llamada a la subrutina!',10
    errorLen equ $-errorMsg

section .bss

    idArchivo resb 1
    textoArchivo resb 35

section .text

global _start:

_start:

    mov eax, 5; se convoca una subrutina al S.O 
    mov ebx, archivo ; ruta de archivo
    mov ecx, 0; MODOS DE ACCESO: Read-only = 0 ; Write-only = 1 ; RDWR = 2 ; create = 256 ; append = 2000h
    mov edx, 0; PERMISOS DE ACCESO
    int 80h

    test eax, eax ; comprobar que la subrutina sea correcta
    jz error

    mov dword [idArchivo], eax; asignar el valor de la subrutina a una variable
    ;**********************************LECTURA DE TEXTO DEL ARCHIVO ********************************************
    mov eax, 3
    mov ebx, [idArchivo] ; redifinimos el estandar con la direccion de la subrutina del archivo para vincularlo
    mov ecx, textoArchivo; variable que contendra el texto del archivo
    mov edx, 30; longitud de lectura
    int 80h
    ;***********************************************************************************************************
    escribir textoArchivo, 30
    ;**********************************CERRADO DEL ARCHIVO ********************************************
    mov eax, 6
    mov edx, [idArchivo]
    mov ecx, 0
    mov edx, 0
    int 80h
    ;**************************************************************************************************
    jmp salir

error:
    escribir errorMsg, errorLen

salir: 
    mov eax, 1
    mov ebx, 0
    int 80h