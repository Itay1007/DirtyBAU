%define ZOMBIE_START_POSITION_XOR_KEY 0x1234
%define R_KEY 0xBEEF
%define ZOMBIE_START_CODE_LEN 0x11
%define BOMB_VALUE 0xCCCC

bomb:
mov cx, 4
loop $
mov ax, [ZOMBIE_START_POSITION_XOR_KEY]
xor ax, R_KEY
; ax contains the start address of the zombie
add ax, ZOMBIE_START_CODE_LEN
mov bx, ax
mov word [bx], 0xCCCC
jmp bomb