%define ADDITIONS 0xB
%define KEY 0x45D9

%define R_READ 0x1234
%define R_WRITE 0xBEEF


nop
mov bl,[R_READ]
mov dl,[R_READ+0x1]

mov cl,ADDITIONS


@calc:
mov si,bx
add bx,dx
mov dx,si

loop @calc

cmp bx,KEY
jnz @hide

mov [R_WRITE],ax

@hide:
jmp @hide



