JMP SHORT 0xB
NOP
XLATB
XCHG AH, AL
XLATB
XLATB
XCHG AH, AL
XLATB
XCHG BX, [0xE129]
MOV SI, AX
MOV AX, BX
DIV WORD [BX + 0x29]
ADD WORD DX, 0xFF6
MOV CL, 0xD
MOV BP, DX
RCR WORD BP, CL
ADD WORD BP, 0x211
LES AX, [BX + 0x2B]
MOV [BP + 0x2], DX
MOV DX, 0xD7E0
LEA DI, [SI + 0xFF00]
INT 0x86
ADD WORD DI, 0x200
ADD WORD BX, 0x2F
INT 0x86
LEA DI, [BX + 0xD3]
MOV [DI + 0x14], DI
MOV [DI + 0x1B], DI
XOR DI, DI
PUSH SS
ADD WORD SI, 0xDE
POP ES
REP MOVSW
LEA AX, [SI + 0x5108]
MOV AL, 0xA2
db 0x88, 0x5C, 0xAB
XCHG AX, [BP + 0x0]
db 0x88, 0x7C, 0xA5
PUSH BP
MOV CL, 0x4
LEA BX, [SI]
XOR SI, SI
MOV [0x8701], BP
MOV BP, DI
MOV [0x8801], BX
MOV [0x4501], AL
MOV [0x4701], AL
MOV [0x4401], AL
MOV [0x4101], AL
MOV [0x4201], AL
MOV [0x4301], AL
XCHG SP, [DI + 0x80E6]
XCHG DX, [DI + 0x82E6]
XCHG SI, [DI + 0x84E6]
XCHG AX, [DI + 0x86E6]
NOP
XLATB
XCHG AH, AL
XLATB
XOR AH,AL
XCHG DI, AX
MOV WORD [DI + 0x6E], 0xFFCC
MOV WORD [DI + 0x6C], 0xCCB9
db 0x80, 0x47, 0x9A, 0x02
db 0xE2, 0xE8
db 0xC6, 0x47, 0x9A, 0x90
INC BP
MOV CL, 0x4
MOV DI, BP
MOV SP, 0x7FE
db 0x7A, 0xB8
POP BX
PUSH SS
MOV CL, 0x8
POP DS
PUSH CS
XOR SI, SI
POP SS
MOV AX, 0xCCCC
PUSH CS
MOV DX, 0x29CC
POP ES
INT 0x87
LES DI, [BX + SI]
MOV AX, BX
DEC DI
LEA SP, [BX + DI]
MOV BP, 0x2
MOV DX, 0x5200
MOVSW
MOVSW
SUB DI, BP
CALL FAR [BX]
db 0x66
db 0xFF
db 0x1F
db 0x68
db 0xA4
db 0xA5
db 0xF3
db 0xA5
db 0xB1
db 0x08
db 0x03
db 0x3C
db 0x8D
db 0x21
db 0x33
db 0xF6
db 0x01
db 0x10
db 0xA5
db 0xA5
db 0x2B
db 0xFD
db 0xFF
db 0x1F
db 0xEA
db 0x51
db 0x00
db 0x2E
db 0x88
db 0xA6
db 0x2B
db 0x05
db 0xA3
db 0x8D
db 0x93
db 0xBD
db 0x1B
db 0x35
db 0xB8
db 0x96
db 0x30
db 0x1E
db 0x4E
db 0x60
db 0xC6
db 0xE8
db 0x65
db 0x4B
db 0xED
db 0xC3
db 0xDD
db 0xF3
db 0x55
db 0x7B
db 0xF6
db 0xD8
db 0x7E
db 0x50
db 0xFA
db 0xD4
db 0x72
db 0x5C
db 0xD1
db 0xFF
db 0x59
db 0x77
db 0x69
db 0x47
db 0xE1
db 0xCF
db 0x42
db 0x6C
db 0xCA
db 0xE4
db 0xB4
db 0x9A
db 0x3C
db 0x12
db 0x9F
db 0xB1
db 0x17
db 0x39
db 0x27
db 0x09
db 0xAF
db 0x81
db 0x0C
db 0x22
db 0x84
db 0xAA
db 0x6A
db 0x44
db 0xE2
db 0xCC
db 0x41
db 0x6F
db 0xC9
db 0xE7
db 0xF9
db 0xD7
db 0x71
db 0x5F
db 0xD2
db 0xFC
db 0x5A
db 0x74
db 0x24
db 0x0A
db 0xAC
db 0x82
db 0x0F
db 0x21
db 0x87
db 0xA9
db 0xB7
db 0x99
db 0x3F
db 0x11
db 0x9C
db 0xB2
db 0x14
db 0x3A
db 0x90
db 0xBE
db 0x18
db 0x36
db 0xBB
db 0x95
db 0x33
db 0x1D
db 0x03
db 0x2D
db 0x8B
db 0xA5
db 0x28
db 0x06
db 0xA0
db 0x8E
db 0xDE
db 0xF0
db 0x56
db 0x78
db 0xF5
db 0xDB
db 0x7D
db 0x53
db 0x4D
db 0x63
db 0xC5
db 0xEB
db 0x66
db 0x48
db 0xEE
db 0xC0
db 0x80
db 0xAE
db 0x08
db 0x26
db 0xAB
db 0x85
db 0x23
db 0x0D
db 0x13
db 0x3D
db 0x9B
db 0xB5
db 0x38
db 0x16
db 0xB0
db 0x9E
db 0xCE
db 0xE0
db 0x46
db 0x68
db 0xE5
db 0xCB
db 0x6D
db 0x43
db 0x5D
db 0x73
db 0xD5
db 0xFB
db 0x76
db 0x58
db 0xFE
db 0xD0
db 0x7A
db 0x54
db 0xF2
db 0xDC
db 0x51
db 0x7F
db 0xD9
db 0xF7
db 0xE9
db 0xC7
db 0x61
db 0x4F
db 0xC2
db 0xEC
db 0x4A
db 0x64
db 0x34
db 0x1A
db 0xBC
db 0x92
db 0x1F
db 0x31
db 0x97
db 0xB9
db 0xA7
db 0x89
db 0x2F
db 0x01
db 0x8C
db 0xA2
db 0x04
db 0x2A
db 0xEA
db 0xC4
db 0x62
db 0x4C
db 0xC1
db 0xEF
db 0x49
db 0x67
db 0x79
db 0x57
db 0xF1
db 0xDF
db 0x52
db 0x7C
db 0xDA
db 0xF4
db 0xA4
db 0x8A
db 0x2C
db 0x02
db 0x8F
db 0xA1
db 0x07
db 0x29
db 0x37
db 0x19
db 0xBF
db 0x91
db 0x1C
db 0x32
db 0x94
db 0xBA
db 0x10
db 0x3E
db 0x98
db 0xB6
db 0x3B
db 0x15
db 0xB3
db 0x9D
db 0x83
db 0xAD
db 0x0B
db 0x25
db 0xA8
db 0x86
db 0x20
db 0x0E
db 0x5E
db 0x70
db 0xD6
db 0xF8
db 0x75
db 0x5B
db 0xFD
db 0xD3
db 0xCD
db 0xE3
db 0x45
db 0x6B
db 0xE6
db 0xC8
db 0x6E
db 0x40
db 0xD7
db 0x86
db 0xE0
db 0xD7
db 0xD7
db 0x86
db 0xE0
db 0xD7