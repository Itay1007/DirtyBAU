%define PREFIX_MOV_OPCODE 0xB8
%define JMP_AX_OPCODE 0xE0FF
%define JMP_MEM_OPCODE 0X26FF

mov cx, ax
 
repeat:   
    mov ax, [0xb80f] ; hex(0xb111 + n * 0x6FE + 2 * (n - 1))
    cmp ax, 0xCCCC
    jne got_result
    jmp repeat
    
 
got_result:
    mov bx, 0xe33f
    mul word bx
    add ax, 0x2503
    
    xor ax, 0xFAEB
    
 
trapZombie:
    xchg cx, ax
    mov bx, ax
    add ax, zombieTrap
    lea bx, [bx + end + 2]
    mov [bx], ax
    mov ax, bx 

    mov bx, cx
    add bx, 19
    
    mov word [bx], ax
    mov word [bx - 2], JMP_MEM_OPCODE
        
    jmp bomb
  
bomb:
   jmp $
   
zombieTrap:
   jmp $
  
  
end: