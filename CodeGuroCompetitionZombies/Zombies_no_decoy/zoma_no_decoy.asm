JMP SHORT 0x2
PUSH DS
POP ES
MOV BX, 0x11BF
MOV CL, 0x35
JMP SHORT 0x5
PUSH CX
MUL WORD BX
ADD AX, 0x4743
LOOP 0xC
ADD WORD DI, 0x4FE
STOSW
POP CX
JMP SHORT 0xB
