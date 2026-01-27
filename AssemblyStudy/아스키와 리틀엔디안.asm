%include "io64.inc"

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ;write your code here
    xor rax, rax
    ret
  
    PRINT_STRING msg

section .data
    msg db 'Hello World', 0x00
    b dd 0x11, 0x22, 0x33, 0x44 ; 4byte에 x011, 4byte에 0x22 이렇게 저장 -> dd는 메모리 크기 4byte를 잡고 거기에 1byte값인 0x11을 저장
    c dd 0x12345678 ; 실제 저장되는걸 보면 little endian. 즉 비트를 거꾸로 저장. --> 캐스팅(크기가 큰 데이터를 작은 데이터로 쪼개 변환하는 작업)에 유리
    ; word 메모리 형태라면 2byte씩 0x5678, 0x1234 이렇게 메모리에 저장됨.
    ; ,의 중요성. ,가 있으면 쉼표 전후를 문자열과 숫자로 구분해서 해석. 그리고 데이터 지시어 크기에 맞게 db라면 1byte씩 메모리에 연속 나열, dd라면 4byte씩 메모리에 연속 나열
    ; ,가 없으면 구분하지 않고 하나의 큰 덩어리로 해석하여 한 메모리 공간 안에 넣으려고 하기에 Too Long 에러 발생
    ; 문자 하나 당 1byte. 16진수로 0x두자리. 16진수 한 자리당 4bit (2진수의 4승이 16진수)
    ; 가장 큰 핵심 ; 실제 메모리 안에 데이터 값은 같더라도 분석하는 관점에 따라 다르게 표현할 수 있음. 16진수 숫자들을 아스키 코드로 변환 시 의미를 가진 문자열 탄생