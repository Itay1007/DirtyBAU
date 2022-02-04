%define R_ADR1 0x1111
%define R_ADR2 0x2222
%define R_ADR3 0x3333
%define R_ADR4 0x4444
%define R_ADR5 0x5555
%define R_ADR6 0x6666
%define R_ADR7 0x7777
%define R_ADR8 0x8888

%define JMP_BX_OPCODE 0xE3FF

mov bx,ax
mov cl,0x8
div cx
mov si,dx
add si,si

mov bx,[bx+si+@addresses]
mov word [bx],JMP_BX_OPCODE

jmp bx

@addresses:
dw R_ADR1
dw R_ADR2
dw R_ADR3
dw R_ADR4
dw R_ADR5
dw R_ADR6
dw R_ADR7
dw R_ADR8