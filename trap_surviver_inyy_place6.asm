; description => knockdown surviver1 of "" or potentially surviver2 of ""

; ds is 2180 instead of 1000 and the payload should be adjusted to it

%define JMP_MEM_OPCODE 0x26FF


mov cx, 86 - 6
loop $

trapSurviverOf:
    
    push ds
    pop es
    
    ; trap them into our code    
    
    mov cx, 4
    mov bx, JMP_MEM_OPCODE
    add ax, surviverTrap
    mov word [2], ax
      
    mov ax, 0xCCA5
    mov dx, 0xCCCC

    int 0x87
    
jmp $



surviverTrap:
mov cx, 100
jmp $
db 0xCC
db 0xCC


; done :-)
