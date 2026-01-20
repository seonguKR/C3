%include "io64.inc"

section .text
global main
main:
    ; 지금까지는 레지스터 공간 8byte 0x16자리(2자리 당 1byte) 4개 a,b,c,d에 값을 16진수로 집어넣는 걸 연습했다.
    ; 하지만 레지스터 말고도 데이터를 저장할 수 있는 공간이 또 있다. 바로 메모리이다. 레지스터와 메모리 간 데이터 핑퐁 방법에 대해 알아보자.
    xor rax, rax
    ret