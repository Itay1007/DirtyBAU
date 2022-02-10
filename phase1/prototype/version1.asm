%define PREFIX_MOV_OPCODE 0xB8
%define JMP_AX_OPCODE 0xE0FF
%define JMP_MEM_OPCODE 0X26FF

push ax
mov cx, ax
 
repeat:
    
    mov ax, [0xb60f] ; hex(0xb111 + n * 0x4FE + 2 * (n - 1))
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
    lea bx, [bx + write_zombie_start_location + 1]
    mov [bx], ax
    mov ax, bx 
      
    mov bx, cx
    add bx, 0x3D - 0x2 + 19
    
    mov word [bx], ax
    mov word [bx - 2], JMP_MEM_OPCODE
    
    pop ax
  
main_brain:
    %define jump_dist 0x7300
    %define call_dist (jump_dist - 0x13)
    %define base_cs 0x0FF8
    %define cs_range 0x0012
    %define interval 0x200
    %define shared_loc 0x50

    ;; randomizing CS into the dx register (will get officially updated at call far)
    @CS_random:
     mov bx, ax
     mov byte cl, 0x000C
     shr ax, cl 
     and word ax, 0x000C
     mov dx, ax
     mov ax, bx
     add dx, base_cs


    ;; randomizing IP into the cs register (will get officially consumed at call far. used to be 0xB6A2)
    @IP_random:
    mov ch, bh
    sub ch, 0x50

    ;; tell zombie details
    mov [bx + write_flag + 1], dx  ;the flag
    mov [bx + write_first_location + 1], dx  ;the first location
    mov cl, 0x4
    shl word [bx + write_first_location + 1], cl
    
    mov cl, 0xA2 ; from the "main code"
    
    add [bx + write_first_location + 1], cx
    
    ;; moving data segment into the stack
    push ds
    push ss
    pop ds
    
    
    ;; entering the CS:IP. Interval length is fixed for now.
    mov bx, interval
    mov word [bx], cx
    mov word [bx+2], dx

    ;; shared memory store location
    mov di, shared_loc
    mov ax, cx
    stosw
    mov ax, dx
    stosw
    
    ;; configuring the ES:DI and SS:SP to be at the randomized location of CS:IP
    push dx
    pop es
    pop ss


    ; reconfiguring dx to the jump_dist
    mov dx, jump_dist



    ;; entering data
    @insert:
    mov word [0], 0xF3A5
    mov word [2], 0xB1A5
    mov word [4], 0x0107
    mov word [6], 0xC417
    mov word [8], 0x8D3F
    mov word [10], 0x3121
    mov word [12], 0xABF6
    mov word [14], 0xFF4F
    mov word [16], 0xCC1F


    mov ax, 0x1FFF

    ;; entering the requirements for the call far command
    @prepare:
    les di, [bx]
    stosw
    dec di
    lea sp, [di + bx - 1]
    mov cx, 0x7


    ;; looping (here for encoding clarity)
    @start_copy:
    call far [bx]
    movsw
    rep movsw
    mov cl, 0x7
    add [bx], dx
    les di, [bx]
    lea sp, [bx + di]
    xor si, si
    stosw
    dec di
    call far [bx]
    int3
   
    zombieTrap:
    %define jmp_length jump_dist
    %define first_location 0X307
   
    %define rep_movsw_opcode 0xA5F3
    %define movsw_opcode 0xFFA5
    %define call_far_bx_opcode 0x1FFF
    %define safe_margin_right 0x7A
    %define safe_margin_left 0x48
    %define safe_jmp 0x300

    ;pushing to stuck relocation code
    push ss
    pop es
    
    write_zombie_start_location: ;need +1
    mov si, 0xFFFF ; change in run time
    add si, set_location - zombieTrap
    xor di, di 
    
    mov cx, (end_move_steps-set_location)/2
    rep movsw
    mov cx, (end_move_steps-set_location)/2

    ;set the segments

    push ss
    pop ds

    push cs
    pop es

    push cs
    pop ss

    mov bx, end_move_steps
    mov [bx+2], cs

    mov ax, rep_movsw_opcode 
    write_flag: ;+1
    mov dx, 0xFFFF ; change in run time
    xor si, si
    
    write_first_location: ;+1
    mov di, 0xFFFF ;change in run time
    sub di, 2 + (end_move_steps - set_location)
    mov [bx], di
    stosw
    call far [bx]
    
    set_location:
        mov [bx], di
        sub word [bx], end_move_steps - actions
        lea bp, [di -(safe_margin_left +(end_move_steps - actions))]
        add di, safe_margin_right
        mov word [bp], dx
        mov sp, bp
        xchg di, bp
        mov word [bp], dx
        xchg cx, si
        shr cx, 1
    end_set_location:


    actions:
        cmp word [bp], dx
        jne move_steps 
        xchg di, bp
        xchg bp, [bx]
        cmp word [bp + (end_move_steps - actions)], call_far_bx_opcode
        xchg bp, [bx]
        jne move_steps 
        call far [bx]      
    end_actions:
    
    move_steps:
        mov bp, [bx]
        mov word [bp + (end_move_steps - actions)], 0xF631
        mov word [bp + (end_move_steps - actions) + 2], 0xF631
        mov word [bp + (end_move_steps - actions) + 4], 0x07B1
        mov word [bp + (end_move_steps - actions) + 6], 0xF631
        mov word [bp + (end_move_steps - actions) + 8], 0x1701
        mov word [bp + (end_move_steps - actions) + 10], 0x3FC4
        mov word [bp + (end_move_steps - actions) + 12], 0x218D
        mov word [bp + (end_move_steps - actions) + 14], 0x4FAB
        mov word [bp + (end_move_steps - actions) + 16], 0x1FFF
       
        lea di, [bp + jmp_length - 2 - (end_set_location - set_location)]
        
        mov [bx], di
        stosw
        
        call far [bx]
    end_move_steps:
end: