%define PUSHBX_STOSW_OPCODE 0xAB53


@start:
push cs
pop es
push cs
pop ss

mov bx,0xCCCC
add ax,(@start_bomb-@start)
mov di,ax
mov sp,ax
mov ax,PUSHBX_STOSW_OPCODE

stosw
@start_bomb:


