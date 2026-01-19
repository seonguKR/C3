%include "io64.inc"

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    
    mov eax, 0x12345
    mov rbx, 0x1234567
    ;mov cl, 0x00
   ; mov cl, 0x00; 원래 rcx에는(rbx도) 초기값이 0x1로 되어있다. cl 자리인 최하위 1bye에서 1을 나타낸다. 00000001. 이게 왜 있는걸까? 거기서 오른쪽 최하위 바이트인 cl을 0x00으로 0으로 바꾸면 0x00이 된다.
    mov ch, 0xff ; 8 bit 1 byte CH인데 왜 0xff를 하면 0xff01이 찍힐까? 초기값 cl 최하위 1 byte에 1이 있었기 때문에 남아있었다. 지금은 cl을 0으로 변경한 뒤 실행하면 0xFF00이 된다. 1) 0xFF를 넣었는데 왜 0xFF00이 레지스터에 찍힐까?
    mov rdx, rbx
    mov ah, 0x00;
    mov al, 0x00 ; eax 32bit 4byte인 eax 0x12345에 al (오른쪽 최하위 1byte에 0000을 넣는다.) 그러면 0x12300. 그런데 왜 0x12345 16진수는 저 표기법으로 어떻게 나타내기에 오른쪽 최하위 1byte에 0을 넣으면 0x12300이 될까? 2) 0x5자리에서 연산을 하는법이 궁금하다.
    xor rax, rax
    ret
    
section .data
    msg db 'hello assembler', 0x00