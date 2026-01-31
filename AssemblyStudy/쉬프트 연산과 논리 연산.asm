%include "io64.inc"

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ;write your code here
    
    mov eax, 0x12345678
    shl eax, 1 ; eax 값의 모든 bit값을 지정한 1bit씩 왼쪽으로 left 옮긴다.
    PRINT_HEX 4, eax ; 4 byte 16진수 eax를 출력. 값 예상 : 원래 값의 2배. bit 자릿수는 왼쪽으로 갈수록 x2. 
    
    NEWLINE
    
    shr eax, 6 ; eax 값의 모든 bit 값을 지정한 6bit씩 오른쪽으로 right 옮긴다.
    PRINT_HEX 4, eax ; 원래 값의 /8. bit 자릿수는 오른쪽으로 갈수록 /2
    NEWLINE
    
    
    xor rax, rax
    ret