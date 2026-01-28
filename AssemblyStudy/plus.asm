%include "io64.inc"


section .text
global main
main:
    mov rbp, rsp; for correct debugging
    GET_DEC 1, al ; 1byte 레지스터 al을 10진수로 읽겠다
    GET_DEC 1, num ; 메모리 bss는 초기값 0으로 세팅.
    
    ;메모리끼리의 연산은 불가능
    
    ;레지스터 + 상수
    add al, 3
    PRINT_DEC 1, al ; 8
    NEWLINE
    
    ;레지스터 + 레지스터
    mov bl, 28
    add al, bl
    PRINT_DEC 1, al ; 36
    NEWLINE
    ;메모리 + 레지스터
    mov byte [num], 35
    add al, [num] ; 71
    PRINT_DEC 1, al
    NEWLINE
    
    ;메모리 + 상수
    ;add num, 100 ;num의 주소값에다 연산 불가능
    add [num], byte 50 ; bss num은 주소값 자체. bss 섹션에서 크기를 잡았다고 해서 num이 그 크기가 아니다. 지금 연산을 할 때 얼마만큼의 메모리 공간을 잡고 더할 것인지 명시해줘야 한다.
    PRINT_DEC 1, [num] ; 171
    NEWLINE
    
    
    xor rax, rax
    ret
    

section .bss
    num resb 1