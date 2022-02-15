; description => knockdown surviver1 of "" or potentially surviver2 of ""


mov cx, 86 - 6
loop $

trapSurviverOf:
    
    push ds
    pop es
        
    mov bx, 0xCCCC
    mov cx, 0xCCCC

    mov ax, 0xA590
    mov dx, 0xCCCC

    int 0x87
    
    db 0xCC
    db 0xCC

jmp $

; done :-)
