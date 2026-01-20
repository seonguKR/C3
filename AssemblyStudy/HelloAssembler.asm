%include "io64.inc"


section .text
global main
main:
    mov rbp, rsp; for correct debugging
    
    ; 16진법 : 0~9를 나타낸 뒤 다음 숫자를 하나의 문자로 나타내기 위해 알파벳을 사용. 
    mov rax, 0xff 
    ; 0x2자리니까 1byte
    ; 가장 하위부터 값을 채우니 rax(4줄 8byte)에서 ax (한 줄 2byte) 범위를 잡고 값을 채우겠다는 뜻. 그래도 0xff는 두 문자 합쳐서 8byte이기에 다 쓰지 않고 al 자리에 ff.
    mov rax, 0x0f 
    ; 0x2자리니까 1byte
    ;  똑같은 rax 범위를 잡고 al 자리에 0과 f를 넣으면 덮어씌워져 0x0f의 값이 되는 rax
    mov ah, 0xee
    ; 0x2자리니까 1byte. al 자리에 
    ; 이번엔 al 자리에 0x0f가 있고 ah 자리에 0xee가 있으니 0xee0f가 된다. 
    mov ax, 0xddee
    ; 그리고 다시 ah (1)와 al (1)을 합친 ax(2)에 0xdd를 넣어도 0xeedd.
    ; 만약 ax 범위를 잡고 꽉 채워 넣으면 0x4자리수를 넣어야 하는데 0xddee를 넣으면 0xddee가 된다.
    ; 꿀팁) 0x2자리는 1byte = 1자리 당 4byte. 0x4자리는 2byte, 0x5자리는 = 20bit..
    mov ah, 0x11
    ; 0xddee에서 ah에 0x11을 하면 왼쪽 1byte이므로 0x11ee
    ; 0xeedd에서 0x11을 하면 0x11dd
    mov al, 0x22   
    ; 0x11ee에서 al 오른쪽 1byte 22를 넣으면 0x1122
    ; 0x11dd에서 al 오른쪾 1byte 22를 넣으면 0x1122
   
    xor rax, rax
    ret
    
section .data
    msg db 'hello assembler', 0x00