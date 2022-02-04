%define ZOMBIE_POSITION 0x1234
%define BOMB_VALUE 0xCCCC

bomb:
mov bx, BOMB_VALUE
mov [ZOMBIE_POSITION], bx    
jmp bomb