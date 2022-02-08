%define rep_movsw_opcode 0xA5F3
%define safe_margin 0x42
%define safe_jmp 0x300
%define flag 0x7F3A

;pushing to stuck relocation code
push ss
pop es

mov si, ax
add si, set_location

mov cx, (end_move_steps-set_location)/2
rep movsw

;set the segments

push ss
pop ds

push cs
pop es

push cs
pop ss

mov bx, end_move_steps
mov [bx+2], cs

mov di, ax
add di, end_move_steps

mov ax, rep_movsw_opcode 
mov dx, flag

set_location:
    mov cx, (end_move_steps -set_location)/2
    mov [bx], di
    sub word [bx], end_move_steps - actions
    mov bp, di
    add di, safe_margin
    sub bp, safe_margin +(end_move_steps - actions)
    mov word [bp], dx
    xchg di, bp
    mov word [bp], dx
    xor si, si
end_set_location:


actions:
    cmp word [bp], dx
    xchg bp, di
    jne move_steps
    call far [bx]
    int3
end_actions:


move_steps:
    cmp di, bp
    jng else
        add di, safe_jmp 
        call resume
    else:
        sub di, safe_jmp 
    
    resume:
    mov [bx], di
    stosw
    call far [bx]
end_move_steps:
