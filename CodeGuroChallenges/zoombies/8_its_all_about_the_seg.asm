%define R_LOC_SEED 0x1234

%define JMP_BP_SI_OPCODE 0x2AFF
%define MIN_SEG 0xFF6
%define LOC ((R_LOC_SEED % (0xFFB0-0xA0)) + 0xA0)

mov cl,0xC
shr ax,cl
add ax,MIN_SEG
mov es,ax

mov ax,JMP_BP_SI_OPCODE
mov di,LOC

mov [bp+si],di
mov [bp+si+0x2],es

stosw

jmp far [bp+si]


