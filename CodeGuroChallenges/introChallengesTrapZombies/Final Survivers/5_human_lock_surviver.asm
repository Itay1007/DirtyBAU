%define ZOMBIE_POSITION 0x1234
%define JMP_ZOMBIE_TRAP_OPCODE 0xE3FF
%define JMP_AX_OPCODE 0xE0FF
%define PREFIX_MOV_OPCODE 0xB8
%define LOAD_ME_TO_MEM 0x6042
%define MEM 0x1234 + 0x10
%define READ_LOC 0x1234

trapTheZobie:


mov word [MEM], LOAD_ME_TO_MEM 

add ax, zombieTrap
nop
nop
nop
nop
nop
mov bx, [READ_LOC]

mov byte [bx + 5], PREFIX_MOV_OPCODE
mov word [bx + 6], ax
mov word [bx + 8], JMP_AX_OPCODE 

mov byte [bx + 2], 0x2
mov byte [bx], 0x90
mov byte [bx + 1], 0xEB
jmp $

zombieTrap:
    jmp $    
