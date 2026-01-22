section .text
global main
main:
    ;write your code here
    xor rax, rax
    
    mov rax, 0x1122334455667788
    mov al, 0x99 ; 0x1122334455667799
    
    mov rax, 0xfffffffffffffffff
    mov eax, 0x11223344 ; 0x0000000011223344 32bit는 상위 비트 클리어를 한다. 이유는? 
    ; 프로그램은 32bit와 64bit가 존재한다. 당연히 32bit가 먼저 존재했고 그 때의 레지스터는 32bit가 최대(eax).
    ; 그래서 32bit 내에서 16bit로든 8bit로든 하위로 쓰면 상위 비트를 보존해야 프로그램이 깨지지 않기에 상위 비트 클리어를 하지 않음.
    ; 하지만 32bit에서는 64bit인 rax 존재를 어차피 알지도 못하기 때문에 0으로 클리어. 괜히 쓰레기값이 있으면 프로그램이 망가짐.
    ; 그리고 보존을 하게 되면 상위 비트를 읽어야 하고 연산할 하위 비트를 수정하고, 다시 써야한다는 파이프라인 성능 무너짐.
    ; 즉 ax는 eax를 알지만, eax는 rax를 알지 못한다. 원래 32bit가 기본이어서 하위 16bit는 32bit인 eax를 안다.하지만 자기가 왕인 줄 알았던 eax는 64bit rax가 나오면서 우물 안 개구리 형태로 64bit를 알지 못한다. 즉 확장되었기 때문.
    
    mov rax, 0xfffffffffffffffff
    mov ax, 0x1234 ; 0xffffffffffff1234 16bit는 상위 비트 클리어를 하지 않는다. 이유는? 
    
    mov rax, 0x0
    mov al, 0xab ; 0x00000000000000ab
    mov ah, 0xcd ; 0x000000000000cdab
    
    mov rax, 0xaaaaaaaaaaaaaaa
    mov eax, 0x11223344 ; 0x0000000011223344
    mov ah, 0x99 ; 0x0000000011229944
    mov al, 0x88 ; 0x0000000011229988
    
    mov rax, 0x1234567890abcdef ; eax = 0x0000000890abcdef rax의 하위 32비트
    mov eax, eax ; eax를 다시 eax에 쓰면 상위 32bit가 0으로 상위 비트 클리어. 자기 자신에게 복사해도 32bit 레지스터에 쓴다는 규칙 적용
    ; eax는 독립된 레지스터가 아니다. 64bit가 나오기 전 32bit(eax)만 사용. 
    ; 64bit 확장 시 32bit 하위 호환성 유지하기 위해서
    ; 32bit 결과는 상위 비트 신경 안 써도 된다는 보장
    ret