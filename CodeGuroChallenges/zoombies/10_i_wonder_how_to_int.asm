%define R_LOC 0x1234

%define RET_OPCODE 0xC3

@start:
mov ch,0x2
div cx
mov bx,dx
add bx,R_LOC
mov byte [bx],RET_OPCODE
nop
call bx
@loop:
jmp @loop

