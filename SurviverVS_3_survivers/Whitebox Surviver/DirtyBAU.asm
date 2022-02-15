%define JMP_MEM_OPCODE 0x26FF

trapSurviver3:

    push ds
    pop es
    
    mov bx, JMP_MEM_OPCODE
    
    add ax, surviver3Trap
    mov word [0], ax

    mov ax, 0xCCAB
    mov dx, 0xCCCC

    int 0x87

    jmp $


surviver3Trap:
    
    push ds
    pop es
    
    mov ax, [0]
    add ax, surviver1Trap - surviver3Trap
    
    mov [0], ax
    
    mov bx, JMP_MEM_OPCODE
    mov cx, 0

    mov ax, 0xD7FF
    mov dx, 0xCCCC

    int 0x87
    
    db 0xCC
    db 0xCC

surviver1Trap:
    push ds
    pop es

    mov bx, 0xCCCC

    mov ax, 0x1FFF
    mov dx, 0xCCCC
    
    mov cx,0x70
    loop $
    
    int 0x87
    
    db 0xCC
    db 0xCC