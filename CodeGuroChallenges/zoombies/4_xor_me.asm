%define R_WRITE_LOC 0x1234
%define R_KEY 0xBEEF

mov bx,ax
add bx,@loop
xor ax,R_KEY 
mov [R_WRITE_LOC],ax
nop
nop
nop
nop
nop
@loop:
jmp bx