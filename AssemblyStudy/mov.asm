section .text
global main
main:
    ;write your code here
    xor rax, rax
    
    mov rax, 0x1122334455667788
    mov al, 0x99 ; 0x1122334455667799
    
    mov rax, 0xfffffffffffffffff
    mov eax, 0x11223344 ; 0x0000000011223344 32bit는 상위 비트 클리어를 한다. 이유는?
    
    mov rax, 0xfffffffffffffffff
    mov ax, 0x1234 ; 0xffffffffffff1234 16bit는 상위 비트 클리어를 하지 않는다. 이유는? 
    
    mov rax, 0x0
    mov al, 0xab ; 0x00000000000000ab
    mov ah, 0xcd ; 0x000000000000cdab
    
    mov rax, 0xaaaaaaaaaaaaaaa
    mov eax, 0x11223344 ; 0x0000000011223344
    mov ah, 0x99 ; 0x0000000011229944
    mov al, 0x88 ; 0x0000000011229988
    
    mov rax, 0x123456789abcdef
    mov eax, eax ; 0x
    ret