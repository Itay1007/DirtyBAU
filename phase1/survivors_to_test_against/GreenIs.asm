JMP 0xD7
PUSH AX
XOR AX, AX
XOR DX, DX
PUSH CS
POP ES
MOV DI, 0x2102
INT 0x86
MOV AX, 0xA5A5
MOV DX, 0xA5A5
MOV BX, [BP + 0x0]
MOV CX, [BP + 0x0]
INT 0x87
MOV DX, 0x1200
MOV BP, 0x1400
MOV CX, 0xA
PUSH SS
POP ES
POP AX
MOV SI, AX
db 0x81, 0xC6, 0x59, 0x00
XOR DI, DI
REP MOVSW
PUSH DS
PUSH SS
POP DS
POP SS
PUSH CS
POP ES
MOV AL, 0xA9
MOV SP, AX
ADD WORD SP, 0x200
MOV BX, 0x200
MOV [BX], AX
MOV [BX + 0x2], CS
MOV DI, [BX]
MOV AX, 0x1FFF
STOSW
DEC DI
MOV AX, 0xA5F3
MOV CL, 0xA
XOR SI, SI
CALL FAR [BX]
ADD [BX], DX
ADD SP, BP
MOV CL, 0xA
MOV DI, [BX]
MOV AX, 0x1FFF
STOSW
MOV AX, 0xA5F3
XOR SI, SI
DEC DI
CALL FAR [BX]
PUSH AX
XOR AX, AX
XOR DX, DX
PUSH CS
POP ES
MOV DI, 0x2102
INT 0x86
MOV AX, 0xA5A5
MOV DX, 0xA5A5
MOV BX, [BP + 0x0]
MOV CX, [BP + 0x0]
INT 0x87
MOV DX, 0x1200
MOV BP, 0x1400
MOV CX, 0xA
PUSH SS
POP ES
POP AX
MOV SI, AX
db 0x81, 0xC6, 0x59, 0x00
XOR DI, DI
REP MOVSW
PUSH DS
PUSH SS
POP DS
POP SS
PUSH CS
POP ES
MOV AL, 0xA9
MOV SP, AX
ADD WORD SP, 0x200
MOV BX, 0x200
MOV [BX], AX
MOV [BX + 0x2], CS
MOV DI, [BX]
MOV AX, 0x1FFF
STOSW
DEC DI
MOV AX, 0xA5F3
MOV CL, 0xA
XOR SI, SI
CALL FAR [BX]
ADD [BX], DX
ADD SP, BP
MOV CL, 0xA
MOV DI, [BX]
MOV AX, 0x1FFF
STOSW
MOV AX, 0xA5F3
XOR SI, SI
DEC DI
CALL FAR [BX]
PUSH AX
XOR AX, AX
XOR DX, DX
PUSH CS
POP ES
MOV DI, 0x2102
INT 0x86
MOV AX, 0xB8FF
MOV DX, 0x1FBA
MOV BX, [BP + 0x0]
MOV CX, [BP + 0x0]
INT 0x87
INT 0x87
MOV DX, 0x1200
MOV BP, 0x1400
MOV CX, 0xA
POP AX
MOV DI, AX
ADD WORD DI, 0x222
INT 0x86
PUSH SS
POP ES
MOV SI, AX
db 0x81, 0xC6, 0x59, 0x00
XOR DI, DI
REP MOVSW
PUSH DS
PUSH SS
POP DS
POP SS
PUSH CS
POP ES
MOV AL, 0xA9
MOV SP, AX
ADD WORD SP, 0x200
MOV BX, 0x200
MOV [BX], AX
MOV [BX + 0x2], CS
MOV DI, [BX]
MOV AX, 0x1FFF
STOSW
DEC DI
MOV AX, 0xA5F3
MOV CL, 0xA
XOR SI, SI
CALL FAR [BX]
ADD [BX], DX
ADD SP, BP
MOV CL, 0xA
MOV DI, [BX]
MOV AX, 0x1FFF
STOSW
MOV AX, 0xA5F3
XOR SI, SI
DEC DI
CALL FAR [BX]
db 0xE9, 0xD4, 0x00
PUSH AX
XOR AX, AX
XOR DX, DX
PUSH CS
POP ES
MOV DI, 0x2102
INT 0x86
MOV AX, 0xA5A5
MOV DX, 0xA5A5
MOV BX, [BP + 0x0]
MOV CX, [BP + 0x0]
INT 0x87
MOV DX, 0x1200
MOV BP, 0x1400
MOV CX, 0xA
PUSH SS
POP ES
POP AX
MOV SI, AX
db 0x81, 0xC6, 0x59, 0x00
XOR DI, DI
REP MOVSW
PUSH DS
PUSH SS
POP DS
POP SS
PUSH CS
POP ES
MOV AL, 0xA9
MOV SP, AX
ADD WORD SP, 0x200
MOV BX, 0x200
MOV [BX], AX
MOV [BX + 0x2], CS
MOV DI, [BX]
MOV AX, 0x1FFF
STOSW
DEC DI
MOV AX, 0xA5F3
MOV CL, 0xA
XOR SI, SI
CALL FAR [BX]
ADD [BX], DX
ADD SP, BP
MOV CL, 0xA
MOV DI, [BX]
MOV AX, 0x1FFF
STOSW
MOV AX, 0xA5F3
XOR SI, SI
DEC DI
CALL FAR [BX]
PUSH AX
XOR AX, AX
XOR DX, DX
PUSH CS
POP ES
MOV DI, 0x2102
INT 0x86
MOV AX, 0xA5A5
MOV DX, 0xA5A5
MOV BX, [BP + 0x0]
MOV CX, [BP + 0x0]
INT 0x87
MOV DX, 0x1200
MOV BP, 0x1400
MOV CX, 0xA
PUSH SS
POP ES
POP AX
MOV SI, AX
db 0x81, 0xC6, 0x59, 0x00
XOR DI, DI
REP MOVSW
PUSH DS
PUSH SS
POP DS
POP SS
PUSH CS
POP ES
MOV AL, 0xA9
MOV SP, AX
ADD WORD SP, 0x200
MOV BX, 0x200
MOV [BX], AX
MOV [BX + 0x2], CS
MOV DI, [BX]
