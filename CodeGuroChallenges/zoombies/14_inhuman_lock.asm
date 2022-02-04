%define R_READ_SEED 0x1234
%define R_WRITE 0xBEEF
%define R_WORDS_SEED 0x5
%define R_ROR 0x5

%define _SEG 0x1003
%define READ (R_READ_SEED % 0xFFD0)
%define WORDS ((R_WORDS_SEED % 0x7) + 0x1)

@start:
mov si,ax

mov di,READ
mov es,[si+@seg-@start]

mov cl,WORDS

repz cmpsw
jnz @hide

add ax,(@hide-@start)
mov cl,R_ROR
ror ax,cl
mov [R_WRITE],ax

@hide:
jmp @hide

@seg:
dw _SEG
