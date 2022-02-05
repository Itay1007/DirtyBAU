%define PREFIX_MOV_OPCODE 0xB8
%define JMP_AX_OPCODE 0xE0FF
%define JMP_MEM_OPCODE 0X26FF

mov cx, 16
mov bx, ax
add ax, zombieTrap
lea bx, [bx + end + 2]
mov [bx], ax
mov ax, bx

repeat:   
    mov dx, [0x310f] ; hex(0xb111 + n * 0x4FE + 2 * (n - 1))
    cmp dx, 0xCCCC  ; replace ax with dx
    jne got_result
    jmp repeat

got_result:
    xor dx, 0xFAEB
    and dx, 0x0FFF
    add dx, 0xF000
    jmp trapZombieBruteForceMSB
    

trapZombieBruteForceMSB:
    mov bx, dx
    add bx, 19
    trapZombie:
        ; need to add some more 
        mov word [bx], ax
        mov word [bx - 2], JMP_MEM_OPCODE
        
    sub dx, 0x1000
    loop trapZombieBruteForceMSB
    jmp bomb
  
bomb:
   jmp $
   
zombieTrap:
   jmp $
  
  
end: