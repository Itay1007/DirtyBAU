%define PREFIX_MOV_OPCODE 0xB8
%define JMP_AX_OPCODE 0xE0FF
%define JMP_MEM_OPCODE 0X26FF
%define jump_dist 0x7300
    %define call_dist (jump_dist - 0x13)
    %define base_cs 0x0FF8
    %define cs_range 0x0012
    %define interval 0x200
    %define shared_loc 0x50 ; TODO change for 0x00
	
	; zombie decoy
	 %define offset_first_jmp jump_dist * 16
    %define round_ttl 0x0520
	
start:

jmp end_decoy
	
; decoy 

mov ax, end-start
mov bx, end

     mov byte cl, 0x000C
     shr ax, cl
     and word ax, 0x000C
     mov dx, ax
     mov ax, bx
     add dx, base_cs


    ;; randomizing IP into the cs register (will get officially consumed at call far. used to be 0xB6A2)
    mov ch, bh
    add ch, 0x50
    mov cl, 0xA2 

    ;; tell zombie details
    mov [bx + write_cs + 1], dx
    mov [bx + write_ip + 1], cx
    
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


    ;; entering data (assume bp holds the ax value : assume cx, si, ds, cs are wanted later : assume  assume ds is at the stack : assume the SS is at 0x1000)
	push si ; 0
	push cx ; 1
    push ds ; 2
	push ds ; 3
	push cs ; 4 
	pop ds ; (4) mov ds to cs
	pop es ; (3) mov es to stack (since ds is at the stack)
	lea si, [bp + @start_copy] ; write the @start_copy bytes into the start of the stack
	xor di, di ; zero out the di
    mov cx, 0x9 ; write 9 * 2 bytes
    rep movsw ; do while 
	pop ds ; restore ds (2)
	pop cx ; restore cx (1)
	pop si ; restore si (0)



	pop ax ; temporary pop of ds
	pop cx ; pop the save the start location from the stack
	push ax ; push of ds
	
	; save the values for the main functionality from the init part
	push bx
	push dx

	push ds
	;  set values for the trapZombie part
	mov bx, cs
	mov ds, bx

	mov dx, cx ; temp save value of cx in dx
	
	
	mov ax, 0xe33f
	mov cx, 125
	; need to add heavy jumps here
	loop $
	mov cx, dx
	
	
    mul word [0xbc0f]  ; hex(0xb111 + n * 0x4FE + 2 * (n - 1))
    
 
    add ax, 0x2503
    
    xor ax, 0xFAEB
    
 
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
    
    pop ds
	
    pop dx
	pop bx
  

	;; configuring the ES:DI and SS:SP to be at the randomized location of CS:IP
    push dx
    pop es
    pop ss


	; reconfiguring dx to the jump_dist
    mov dx, jump_dist


    mov ax, 0x1FFF

    ;; entering the requirements for the call far command
    les di, [bx]
    stosw
    dec di
    lea sp, [di + bx - 1]
    mov cx, 0x7


	;; initiate
	call far [bx]

    ;; looping (here for encoding clarity)
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

; end of denoy

end_decoy:
	
	
	
mov bp, ax
push ax ; save the start location to the stack

start_action_before_main:
	

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
    add ch, 0x50
    mov cl, 0xA2 

    ;; tell zombie details
    mov [bx + write_cs + 1], dx
    mov [bx + write_ip + 1], cx
    
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


    ;; entering data (assume bp holds the ax value : assume cx, si, ds, cs are wanted later : assume  assume ds is at the stack : assume the SS is at 0x1000)
    @insert: 
	push si ; 0
	push cx ; 1
    push ds ; 2
	push ds ; 3
	push cs ; 4 
	pop ds ; (4) mov ds to cs
	pop es ; (3) mov es to stack (since ds is at the stack)
	lea si, [bp + @start_copy] ; write the @start_copy bytes into the start of the stack
	xor di, di ; zero out the di
    mov cx, 0x9 ; write 9 * 2 bytes
    rep movsw ; do while 
	pop ds ; restore ds (2)
	pop cx ; restore cx (1)
	pop si ; restore si (0)



	pop ax ; temporary pop of ds
	pop cx ; pop the save the start location from the stack
	push ax ; push of ds
	
	; save the values for the main functionality from the init part
	push bx
	push dx

	push ds
	;  set values for the trapZombie part
	mov bx, cs
	mov ds, bx

	mov dx, cx ; temp save value of cx in dx	
	
	mov ax, 0xe33f
	mov cx, 125
	; need to add heavy jumps here
	loop $
	mov cx, dx
	
	
get_result:   
    mul word [0xbc0f]  ; hex(0xb111 + n * 0x4FE + 2 * (n - 1))
    
 
got_result:
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
    
    pop ds
	
    pop dx
	pop bx
  
main_brain:

	;; configuring the ES:DI and SS:SP to be at the randomized location of CS:IP
    push dx
    pop es
    pop ss


	; reconfiguring dx to the jump_dist
    mov dx, jump_dist


    mov ax, 0x1FFF

    ;; entering the requirements for the call far command
    @prepare:
    les di, [bx]
    stosw
    dec di
    lea sp, [di + bx - 1]
    mov cx, 0x7


	;; initiate
	@initiation:
	call far [bx]

    ;; looping (here for encoding clarity)
    @start_copy:
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
   

    ;; get cs & ip - change in run time
    write_zombie_start_location:
    mov ax, 0xFFFF

    write_cs:
    mov dx, 0xFFFF

    write_ip:
    mov cx,0xFFFF 
    add cx, offset_first_jmp

    ;; moving data segment into the stack
    push ds
    push ss
    pop ds
    
    
    ;; entering the CS:IP. Interval length is fixed for now.
    mov bx, interval - 28
    mov word [bx], cx
    mov word [bx+2], dx
    

    ;; entering data
    ;@insert:
    mov word [0], 0xF3A5
    mov word [2], 0xB1A5
    mov word [4], 0x010B
    mov word [6], 0xC417
    mov word [8], 0x8D3F
    mov word [10], 0xFF21
    mov word [12], 0x8104
    mov word [14], 0x303C
    mov word [16], 0x7405
    mov word [18], 0x3106
    mov word [20], 0xABF6
    mov word [22], 0xFF4F
    mov word [24], 0xCC1F
    
    ;; configuring the ES:DI and SS:SP to be at the randomized location of CS:IP
    push dx
    pop es
    pop ss


    ; reconfiguring dx to the jump_dist
    mov dx, jump_dist


    mov ax, 0x1FFF

    ;; entering the requirements for the call far command
    ;@prepare:
    ;mov cx, 155
    ;loop $

    les di, [bx]
    stosw
    dec di
    lea sp, [di + bx - 1]
    mov cx, 0xB


    ;; looping (here for encoding clarity)
    ;@start_copy:
    call far [bx]
    movsw
    rep movsw
    mov cl, 0xB
    add [bx], dx
    les di, [bx]
    lea sp, [bx + di]
    inc word [si]
    cmp word [si], round_ttl
    je die
    xor si, si
    stosw
    dec di
    call far [bx]
    die:
    int3
end:
