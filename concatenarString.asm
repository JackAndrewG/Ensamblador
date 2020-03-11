%macro display 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2
int 80h
%endmacro

%macro accept 2
mov eax,3
mov ebx,1
mov ecx,%1
mov edx,%2
int 80h
%endmacro

section .data

msg1 db 10,"ingrese nombre:"
msg1_len equ $-msg1

msg2 db 10,'ingrese apellido:'
msg2_len equ $-msg2

result db 'result =',10
result_len equ $-result

section .bss

input1 resb 20
input2 resb 5
answer resb 2

section .text

global _start     
    _start:
    display msg1,msg1_len
    accept input2,20
    display msg2,msg2_len
    accept input2,10

    ;****************
    mov edx,10    ;check termination of string
    mov ecx,0
    l1:cmp [input1+ecx],edx
    je join
    inc ecx
    jmp l1

    mov eax,0
    mov edx,0
    join:cmp al,10
    je exit
    mov eax,[input2+edx]
    mov [input1+ecx],eax
    inc edx
    inc ecx
    jmp join

exit:
    display result,result_len
    display input1,10
    mov eax,1
    int 80h