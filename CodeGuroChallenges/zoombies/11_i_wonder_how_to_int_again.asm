%define R_VAR0 0x1234
%define R_VAR1 0x1234
%define R_VAR2 0x1234
%define R_VAR3 0x1234
%define R_VAR4 0x1234
%define R_WRITE 0x1234


@start:
add ax,@hide-@start

xchg ax,si
xchg sp,dx
xchg dx,ax
xchg si,dx
dw 0xC087

add dx,R_VAR0
xor dx,R_VAR1
rol dx,R_VAR3
sub dx,R_VAR2
ror dx,R_VAR3
neg dx
and dx,R_VAR4

mov [R_WRITE],dx

@hide:
jmp @hide