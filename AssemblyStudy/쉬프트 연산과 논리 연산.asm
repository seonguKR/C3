%include "io64.inc"

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    ;write your code here
    
    mov eax, 0x12345678
    shl eax, 1 ; eax 값의 모든 bit값을 지정한 1bit씩 왼쪽으로 left 옮긴다.
    PRINT_HEX 4, eax ; 4 byte 16진수 eax를 출력. 값 예상 : 원래 값의 2배. bit 자릿수는 왼쪽으로 갈수록 x2. 16진수에서는 각 자리의 x2
    
    NEWLINE
    
    shr eax, 6 ; eax 값의 모든 bit 값을 지정한 6bit씩 오른쪽으로 right 옮긴다.
    PRINT_HEX 4, eax ; 원래 값의 /8. bit 자릿수는 오른쪽으로 갈수록 /2
    NEWLINE
    
    ; 쉬프트 연산을 쓰는 이유와 장점 : 64bit 체제에서 8byte를 전부 사용하는건 매우 큰 값. 동접자도, 데이터 수도 8byte 끝 범위까지 쓸 일이 잘 없음. 
    ; 그래서 게임 서버에서는 최상위bit에 도메인 데이터를 구분 짓는데 사용. 예를 들어 1이면 사람, 2면 NPC. 최하위bit에 만약 1이 있을 경우 최상위bit까지 옮겨줄 때 shift 연산을 이용하면 리비전을 이용한 곱셈보다 손쉽게 옮겨줄 수 있음.
    
    ; 논리 연산 Logical
    ; ex) 조건 2개 존재. A : 잘생김, B : 돈 많음
    ; NOT A : A가 아니다 -> 잘생김의 반대 (잘생김이 0이라면 1, 1이라면 0) : 한 조건을 이용. NOT은 거꾸로 반대
    ; A and B : 잘생겼고 돈 많고 -> 2가지 모두 충족 : 둘 다 true 시 1, 하나라도 충족하지 못하면 0, 당연히 둘 다 false면 0
    ; A or B : 잘생기거나 돈이 많거나 -> 2가지 중 하나라도 true일 시 true : 당연히 둘 다 충족해도 1 true. 둘 중 하나라도 1이면 1, 둘 다 아니어야 0 :: AND 보다 true의 범위가 넓어짐
    ; A XOR B : A, NOT B or NOT A, B -> 둘 다 1이거나 둘 다 0이면 False 0, 두 조건이 서로 반대로 충족 시 1(서로 true와 false가 하나씩 존재 시 true 1) :: OR보다 범위가 살짝 좁음 (둘 다 충족하면 false 0)
    
    ; 비교 방식 : 두 숫자를 bit 자릿수로 나타내어 서로 같은 자리의 bit값을 비교. AND면 둘 다 1이어야 1.
    ; or -> 두 숫자의 같은 자리의 bit값이 둘 중 하나라도 1이 있으면 1, 둘 다 1이면 당연히 1, 둘 다 0이어야 0
    ; XOR -> 두 숫자의 같은 자리의 bit값이 서로 다르면 1, 둘다 true거나 false면 false
    ; NOT이면 한 숫자의 모든 자릿수의 bit값을 거꾸로 1이면 0, 0이면 1
    
    mov al, 0b10110110
    mov bl, 0b11011001
    
    and al, bl ; al = al and bl 0b10010000
    PRINT_HEX 1, al ; 0x90
    NEWLINE
    
    NEWLINE
    or al, bl ; al = al or bl. 0b11011001
    PRINT_HEX 1, al ; 0xd9
    NEWLINE
    
    NEWLINE
    xor al, bl ;0b00000000
    PRINT_HEX 1, al ; 0
    NEWLINE
    xor al, bl
    PRINT_HEX 1, al
    NEWLINE ; 암호학에서 많이 사용. XOR을 두번하면 원래 값으로 복원됨. 즉 x, y 두 값이 존재하면 y라는 비밀 키를 이용해서 x값을 알 수 없는 값으로 바꾸고, 다시 비밀 키를 이용하면 원래 값으로 복원됨.
    
    NEWLINE
    xor al, al
    PRINT_HEX 1, al ; 0. 자기 자신(즉 자리마다 bit값이 전부 같은)을 비교하면 모든 bit값은 0이 되어서 값은 0으로 초기화됨. 0으로 대입하고 싶을 때 XOR 연산으로 쉽고 빠르게 가능
    
    xor rax, rax
    ret