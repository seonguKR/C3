section .text
global main
main:

    ; if 분기문 (흐름 제어)
    ; 비교한 결과물은 flag register에 저장 eflags
    ; 조건 -> 비교 -> 결과에 맞는 로직 실행
    
    mov eax, 100
    mov ebx, 200
    
    CMP eax, ebx
    
    je LABEL_EQUAL
        
    ; 같지 않아서 LABEL_EQUAL로 점프 안했으면 0
    mov rcx, 0
    jmp LABEL_EQUAL_END
    
    ; 중요 포인트 ) je로 인해 LABEL_EQUAL로 점프하지 않아서 rcx에 0을 넣는 코드까지 실행했다고 해도 순차적으로 LABEL_EQUAL을 실행하게 된다.
    ; 그래서 정확히 분기를 나눠 로직 흐름을 제어하여 실행하기 위해 원하는 값을 만들어준 다음에는 정확한 라벨로 이동하도록 jmp(무조건 점프) 시켜준다.
    ; 그렇게 되면 LABEL_EQUAL을 건너띄고 무조건 LABEL_EQUAL_END로 점프하여 실행하게 된다.
LABEL_EQUAL : 
    mov rcx, 1
    PRINT_HEX rcx, 1

LABEL_EQUAL_END : 
    mov rcx, 0
    PRINT_HEX rcx, 1
    
  
    xor rax, rax
    ret