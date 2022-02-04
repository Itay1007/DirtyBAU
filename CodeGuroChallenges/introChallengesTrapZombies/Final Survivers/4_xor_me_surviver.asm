%define ZOMBIE_START_POSITION_XOR_KEY 0x1234
%define R_KEY 0xBEEF
%define ZOMBIE_START_CODE_LEN 0x11

%define JMP_ZOMBIE_TRAP_OPCODE 0xE3FF
%define JMP_AX_OPCODE 0xE0FF
%define ZOMBIE_CODE_LENGTH 19

trapTheZobie:

add ax, zombieTrap
nop
nop
nop
mov bx, [ZOMBIE_START_POSITION_XOR_KEY]
xor bx, R_KEY
add bx, ZOMBIE_CODE_LENGTH

mov byte [bx - 2], 0xB8
mov word [bx - 1], ax
mov word [bx + 1], JMP_AX_OPCODE 
jmp $

zombieTrap:
    jmp $    
