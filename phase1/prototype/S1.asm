%define call_dist 0x51ED
%define jump_dist 0x5200
%define base_cs 0x1000
%define cs_range 0x0006


;; randomizing CS into the dx register (will get officially updated at call far)
mov bx, ax
mov word [0x0], cs_range
div word [0x0]
mov ax, bx
add dx, base_cs


;; randomizing IP into the cs register (will get officially consumed at call far. used to be 0xB6A2)
mov ch, bh
sub ch, 0x50
mov cl, 0xA2

;; moving data segment into the stack
push ss
pop ds


;; entering the CS:IP. Interval length is fixed for now.
mov bx, 0x240
mov word [bx], cx
mov word [bx+2], dx


;; configuring the ES:DI and SS:SP to be at the randomized location of CS:IP
push dx
push dx
pop es 
pop ss



;; entering the call far command into the right place 
mov di, cx
mov word [0x0], 0x1FFF
movsw



; reconfiguring dx to the jump_dist
mov dx, jump_dist



;; entering data
mov word [0], 0x1FFF
mov word [2], 0xA5A4
mov word [4], 0xA5F3
mov word [6], 0x07B1
mov word [8], 0x3C03
mov word [10], 0x218D
mov word [12], 0xF631
mov word [14], 0x1701
mov word [16], 0x4FA5
mov word [18], 0x1FFF
mov word [20], call_dist




;; entering the requirements for the call far command
dec di
lea sp, [di + bx - 1]
mov si, 0x2
mov cx, 0x0007


;; looping (here for encoding clarity)
call far [bx]
movsb
movsw
rep movsw
mov cl, 0x7
add di, [si]
lea sp, [bx + di]
xor si, si
add [bx], dx
movsw
dec di
call far [bx]


# si is now at 0x4, so we need the next commands at ds:si to start at the 0x04 location, making need for the 66, and 68 