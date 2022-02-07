%define call_dist 0x51ED



mov dx, 0x5200

;confurations:
push ss
pop ds

push cs
push cs
pop es 
pop ss


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







;; entering the CS:IP (since it's fixed for now)
mov bx, 0x240
mov word [bx], 0xB6A2
mov word [bx+2], 0x1000


; entering the call far command
push ds 
push cs 
pop ds
mov word [0xB6A2], 0x1FFF
pop ds

mov di, 0xB6A3
lea sp, [di + bx - 1]
mov si, 0x2
mov cl, 0x7


;looping:
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
