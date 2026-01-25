%include "io64.inc"

section .text
global main
main:
    ; 지금까지는 레지스터 공간 8byte 0x16자리(2자리 당 1byte) 4개 a,b,c,d에 값을 16진수로 집어넣는 걸 연습했다.
    ; 하지만 레지스터 말고도 데이터를 저장할 수 있는 공간이 또 있다. 바로 메모리이다. 레지스터와 메모리 간 데이터 핑퐁 방법에 대해 알아보자.
    xor rax, rax
    ret
    
; 초기화된 데이터
; db, dw, dd, dq
section.data
 a db 0x11
 b dw 0x2222
 c dd 0x333333
 d dq 0x444444444444


; 초기화되지 않은 데이터 : exe 실행 시 0으로 세팅하기 때문에 크기만 지정해주면 됨
; rsvb, rsvw, rsvd, rsvq
; bss는 왜 data와 공간이 나뉘어져 있을까? -> 파일 크기를 최적화 하기 위해서 -> 메모리 공간을 어떻게 최적화? -> bss는 값을 지정할 수 없고 크기만 지정. 0으로 세팅하기에 값을 지정해줄 필요가 없음 -> exe 파일에 굳이 공간을 내어주지 않아도 됨 -> 메모리에 올라갔을 때 생김
section.bss
