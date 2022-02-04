%define R_READ 0x1234
%define JMP_BX_OPCODE 0xE3FF


mov cl,0xF8
div cx
mov [R_READ],ax
mov [R_READ+0x2],dx
mov si,[R_READ]
mov bx,[R_READ + 0x2]

cmp bx,0x1000
jz @hide

mov cl,0x4
shl bx,cl
add bx,si

mov word [bx],JMP_BX_OPCODE
jmp bx

@hide:
jmp @hide