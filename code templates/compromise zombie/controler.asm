%define JMP$ 0xfeeb
%define NOPNOP 0x9090

%define JMPADR 0x26ff
%define PTR 0x0

add ax, zombieTrap
mov [PTR], ax

mov ax, JMP$
mov dx, NOPNOP

mov bx, JMPADR
mov cx, PTR

push cs
pop es
int 0x87
mycode:
jmp $

zombieTrap:
xor dx, dx
mov ax, 0
and bx, 0
loop $

# fixed 300