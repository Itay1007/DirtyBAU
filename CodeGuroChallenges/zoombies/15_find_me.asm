%define R_WRITE 0x1234

%define JMP_DI_OPCODE 0xE7FF
%define MIN_SEG 0xFF6

@start:
xchg ax,si
mov ax,ss
mov cl,0x10
div cx
add dx, 0xFF6

mov ax,es
xor ax,si
; ax = loc, dx = seg

lea bx,[si+@les_data-@start]
mov [bx],ax
mov [bx+0x2],dx

les di,[bx]
mov ax,JMP_DI_OPCODE
stosw
sub di,0x2
mov [R_WRITE],si
jmp far [bx]


@les_data:
dw 0x0
dw 0x0

