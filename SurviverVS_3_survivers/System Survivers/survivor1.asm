%define INTERVAL 0xD


@start:
push cs
pop ss

add ax,(@loop-@start)
mov di,ax
lea sp,[di+0x2]
mov dx,INTERVAL

@loop:
add sp,dx
call di
