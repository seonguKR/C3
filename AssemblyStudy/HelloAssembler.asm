%include "io64.inc"

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    
    mov eax, 0x12345
    mov rbx, 0x1234567
    mov ch, 0xff
    mov rdx, rbx
    
    mov al, 0x00
    xor rax, rax
    ret
    
section .data
    msg db 'hello assembler', 0x00