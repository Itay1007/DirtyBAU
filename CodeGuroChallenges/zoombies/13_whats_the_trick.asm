%define R_READ 0x1234
%define R_BYTE_SEED 0x80

%define _BYTE (R_BYTE_SEED % 0x100)

@start:
xchg ax,di

mov cl,[R_READ]
mov bl,[R_READ+0x1]
mov al,[R_READ+0x2]

add bp,cx
add si,bx

mov cl,0x5

div cx

cmp dx,0x1
jz @add

cmp dx,0x2
jz @sub

cmp dx,0x3
jz @shr

cmp dx,0x4
jz @and

jmp di

@add:
add si,_BYTE
jmp @leak

@sub:
sub si,_BYTE
jmp @leak

@shr:
shr si,cl
jmp @leak

@and:
and si,cx

@leak:
mov [bp+si+0x100],di
add di,(@hide - @start)

@hide:
jmp di