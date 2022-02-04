%define ZOMBIE_POSITION 0x1234
%define JMP_AX_OPCODE 0xE0FF
%define ZOMBLIE_CODE_LENGTH 13
%define JMP_BX_OPCODE 0xE3FF
%define PREFIX_MOV_OPCODE 0xB8

push ax
nop
nop
nop

spyToFindZombie:

; key observation 
; zombie ip after some steps
; is and can be only in a memory cell of kind
; [XXXX] while X in {1,2,3,4,5,6,7,8} as [1111] and [6666]

    add cx, 1
    mov ax, 0x1111
    mul cx
    mov bx, ax
    mov word dx, [bx]
    cmp dx, JMP_BX_OPCODE
    jne spyToFindZombie
    jmp trapTheZombie

trapTheZombie:

pop ax
add ax, zombieTrap

mov byte [bx + 5], PREFIX_MOV_OPCODE
mov word [bx + 6], ax
mov word [bx + 8], JMP_AX_OPCODE 

mov byte [bx + 2], 0x2
mov byte [bx], 0x90
mov byte [bx + 1], 0xEB
jmp $

zombieTrap:
    jmp $    
