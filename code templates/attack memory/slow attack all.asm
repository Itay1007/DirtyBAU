push ds
pop es
mov cx, ax
mov ax, 0xCCCC
mov bx, 0

start:
    stosw
    add bx, 2
    cmp bx, cx
    je skip_code

ret_skip_code:
    jmp start
    
skip_code:
add di, sof
jmp ret_skip_code
sof:
