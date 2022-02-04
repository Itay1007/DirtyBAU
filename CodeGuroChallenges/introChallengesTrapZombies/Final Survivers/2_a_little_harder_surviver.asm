%define ZOMBIE_POSITION 0x1234
%define JMP_ZOMBIE_TRAP_OPCODE 0xE3FF
%define JMP_AX_OPCODE 0xE0FF

trapTheZobie:

add ax, zombieTrap
mov bx, [ZOMBIE_POSITION]
add bx, 5

mov byte [bx + 3], 0xB8
mov word [bx + 4], ax
mov word [bx + 6], JMP_AX_OPCODE 

mov byte [bx], 0x2
mov byte [bx - 2], 0x90
mov byte [bx - 1], 0xEB
jmp $

zombieTrap:
    jmp $    
    