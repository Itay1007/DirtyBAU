%define ZOMBIE_POSITION 0x1234
%define JMP_ZOMBIE_TRAP_OPCODE 0xE3FF
%define JMP_AX_OPCODE 0xE0FF

trapTheZobie:
 
add ax, zombieTrap
mov byte [ZOMBIE_POSITION + 5], 0xB8
mov word [ZOMBIE_POSITION + 6], ax
mov word [ZOMBIE_POSITION + 8], JMP_AX_OPCODE 

mov byte [ZOMBIE_POSITION + 2], 0x2
mov byte [ZOMBIE_POSITION], 0x90
mov byte [ZOMBIE_POSITION + 1], 0xEB
jmp $

zombieTrap:
    jmp $    
