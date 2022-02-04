mov bx, CS
mov ES, bx
mov ax, 0xFF
loop:
    stosw
    loop loop