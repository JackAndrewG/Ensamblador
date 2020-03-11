;Autor: Jackson Guzmán 
;Restas sucesivas para simular la división 
;practica de reensamblaje para repaso de exámen

%macro ingresar 1;macros para hacer acciones repetitivas, toma una cantidad de valores que seran usados

  mov eax, 3
  mov ebx, 0
  mov ecx, %1
  mov edx, 2
  int 80h
  
%endmacro

%macro imprimir 2

  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 80h
  
%endmacro

section .data

  ingresarN1 db 'ingrese el dividendo:'
  ingresarN1Len equ $-ingresarN1; toma la cantidad exacta de todos los caracteres 
  
  ingresarN2 db 'ingrese el divisor:'
  ingresarN2Len equ $-ingresarN2; toma la cantidad exacta de todos los caracteres
  
  mostrarResiduo db 10,'el residuo es:'
  mostrarResiduoLen equ $-mostrarResiduo; toma la cantidad exacta de todos los caracteres
  
  mostrarCociente db 10,'el cociente es:'
  mostrarCocienteLen equ $-mostrarCociente; toma la cantidad exacta de todos los caracteres

section .bss
  
  n1 resb 2; reserva una cantidad especificada de bytes 
  n2 resb 2; reserva una cantidad especificada de bytes
  residuo resb 2; reserva una cantidad especificada de bytes
  cociente resb 2; reserva una cantidad especificada de bytes
  
section .text

global _start

_start:

  imprimir ingresarN1, ingresarN1Len; se envian los parametros al macro para imprimirse
  ingresar n1; se envian los parametros al macro para ingresarse en la constante
  
  imprimir ingresarN2, ingresarN2Len; se envian los parametros al macro para imprimirse
  ingresar n2; se envian los parametros al macro para ingresarse en la constante
  
  mov ah, [n1];se mueve el valor que posee la variable a un registro de PG para trabajar con este
  mov bl, [n2];se mueve el valor que posee la variable a un registro de PG para trabajar con este
  sub ah, '0';se resta 0 para pasar de caracter a valor numerico segun codigo ASCII
  sub bl, '0';se resta 0 para pasar de caracter a valor numerico segun codigo ASCII
  mov cx, 0;se inicializa el registro cx que hara de contador
  
comparar:

  cmp ah,bl; se compara ambos registros 
  je resultado; si los registros tras la comparacion son iguales salta a lo indicado de lo contrario continua su ejecucion
  jg restar; si el primer registro tras la comparacion es mayor salta a lo indicado de lo contrario continua su ejecucion
  
restar:
  
  inc cx; incrementa el valor del registro en una unidad
  sub ah,bl; resta el valor del segundo registro en el valor del primer registro
  jmp comparar; salta hacia la posicion de memoria comparar 

resultado:

  inc cx; incrementa el valor del registro en una unidad
  sub ah,bl; resta el valor del segundo registro en el valor del primer registro
  add cx,'0'; se suma 0 para pasar de valor numerico a caracter segun codigo ASCCI
  add ah,'0'; se suma 0 para pasar de valor numerico a caracter segun codigo ASCCI
  mov [cociente], cx; se mueve el valor del registro a la variable para almacenarlo y evitar su perdida
  mov [residuo], ah; se mueve el valor del registro a la variable para almacenarlo y evitar su perdida
  
  imprimir mostrarCociente, mostrarCocienteLen; se envian los parametros al macro para imprimirse
  imprimir cociente, 2; se envian los parametros al macro para imprimirse
  
  imprimir mostrarResiduo, mostrarResiduoLen; se envian los parametros al macro para imprimirse
  imprimir residuo, 2; se envian los parametros al macro para imprimirse
  
  
;-----salir del programa-----
  mov eax, 1; se mueve 1 al registro eax para salir del programa 
  int 80h; llamada de subrutina al SO
  