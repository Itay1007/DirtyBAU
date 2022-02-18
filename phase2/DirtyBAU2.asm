%define JUMP_DIST 0x4000
%define TOP_TRAP_DIST 0x12
%define BOTTOM_TRAP_DIST 0x3B
%define TRAP_VAL 0x5703
%define BOMB_VAL 0xA5A5
%define DIST_CALC (0xA2 + 0x4*0x4 -((@main_loop_end - @copy) + BOTTOM_TRAP_DIST))
%define SAFETY_GAP 0x10
%define DX_OFFSET 0x2
%define SHARED_MEM_OFFSET 0x52
%define CHANGING_OFFSET 0x0
%define INIT_SI (TOP_TRAP_DIST + (@main_loop_end - @main_loop) + BOTTOM_TRAP_DIST + CHANGING_OFFSET)
%define START_DX 0xFE

%define JMP_MEM_OPCODE 0X26FF


; description => knockdown surviver1 of 4Lz4Lo1 and
; potentially surviver2 of 4Lz4Lo1 from phase1 in cgx 2022

; case1 => surviver2 starts the turns before me
mov word bx, [0xE129]

; case2 => I start the turns before surviver2
mov word cx, [0xE129]

; treat case1

; force segmentation fault on place2 team for division in 0 :-)
mov word [bx + 0x29] , 0x0000

; treat case2
; switch between cases
xchg bx, cx

; force segmentation fault on place2 team for division in 0 :-)
mov word [bx + 0x29] , 0x0000

; break place2 team surviver2 [maybe can trap and use his IP] :-)
mov word [bx + 16 + 0xA5], 0xCCCC ; mov word [bx + 3 + 3 + 0xA5], 0xCCCC

; switch between cases
xchg bx, cx
; break place2 team surviver2 [maybe can trap and use his IP] :-)
mov word [bx + 16 + 0xA5], 0xCCCC ; mov word [bx + 3 + 3 + 0xA5], 0xCCCC


; done :-)


jmp end_of_decoy

decoy:
; decoy

			; treat case2
		; switch between cases
		xchg bx, cx

		; force segmentation fault on place2 team for division in 0 :-)
		mov word [bx + 0x29] , 0x0000

		; break place2 team surviver2 [maybe can trap and use his IP] :-)
		mov word [bx + 16 + 0xA5], 0xCCCC ; mov word [bx + 3 + 3 + 0xA5], 0xCCCC

		; switch between cases
		xchg bx, cx
		; break place2 team surviver2 [maybe can trap and use his IP] :-)
		mov word [bx + 16 + 0xA5], 0xCCCC ; mov word [bx + 3 + 3 + 0xA5], 0xCCCC

		push ax

		; code for traping the zombie

		mov dx, ax

		mov ax, 0xe33f
		mov cx, 171
		; need to add heavy jumps here
		loop $
		mov cx, dx

			
			mul word [0xbc0f]  ; hex(0xb111 + n * 0x4FE + 2 * (n - 1))
			
		 
			add ax, 0x2503
			
			xor ax, 0xFAEB
			
		 
			xchg cx, ax
			mov bx, ax
			add ax, zombieTrap
			lea bx, [bx + end + 1]
			mov [bx], ax
			mov ax, bx
			  
			mov bx, cx
			add bx, 0x3D - 0x2 + 19
			
			mov word [bx], ax
			mov word [bx - 2], JMP_MEM_OPCODE

		pop ax


		;


		mov cl, 0x8
		add ax,@copy
		mov si,ss
		mov bx,ss
		and bx,0x10
		lea si,[bx+si+0x4]
		xchg ax,si
		mov es,ax


		mov di,INIT_SI


		mov cl,(@copy_end - @copy + 1)/0x2
		rep movsw

		mov ds,ax

		lea sp,[bx + INIT_SI - 0x2]
		mov bx,di

		pop di
		pop bp
		shl bp,cl
		mov word [bp+di-0x2],ax
		sub sp,0x3
		dec ch
		jnz @anti_loop
		mov di,bx
		rep movsw

		mov cl,((@main_loop_end - @reset_main_loop + 1)/0x2 - 0x2)
		rep movsw

		
		mov cx,(@traps_loop_end - @traps_loop + 1)/0x2
		movsw
		jmp dx
		dw TRAP_VAL
		dw TRAP_VAL
		dw INIT_SI
		dw 0x1000



		; done :-)

	
; end of decoy

end_of_decoy:


push ax

; code for traping the zombie

mov dx, ax

mov ax, 0xe33f
mov cx, 158
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
    lea bx, [bx + end + 1]
    mov [bx], ax
    mov ax, bx
      
    mov bx, cx
    add bx, 0x3D - 0x2 + 19
    
    mov word [bx], ax
    mov word [bx - 2], JMP_MEM_OPCODE


; initalize values
pop ax
mov ch, 0

maybe_can_make_efficient:
mov cl, 0x8
add ax,@copy
mov si,ss
mov bx,ss
and bx,0x10
lea si,[bx+si+0x4]
xchg ax,si
mov es,ax


mov di,INIT_SI


mov cl,(@copy_end - @copy + 1)/0x2
rep movsw

mov ds,ax

lea dx,[si - @copy_end + JUMP_DIST]
mov dl,((DIST_CALC - SAFETY_GAP)%(0x100)) + DX_OFFSET - 0x10
add dx, bp


real_start:
mov dl, START_DX


mov bx,dx
add bx,(@main_loop - @copy - TOP_TRAP_DIST - 0x2)

push cs
pop es

push cs
pop ss

mov si,(INIT_SI + @reset_main_loop - @copy - 0x2)

mov [@main_loop_end - @copy + INIT_SI + 0x8],ax

mov ax,BOMB_VAL

lea di,[bx + 0x2 + TOP_TRAP_DIST - (@reset_main_loop_end - @reset_main_loop) - 0x2]
lea sp,[bx + INIT_SI + 0x2]

mov bp,di
mov cl,((@main_loop_end - @reset_main_loop + 1)/0x2)

movsw
jmp bp

@copy:
@traps_loader:
rep movsw

@traps_loop:
mov cx,0x404
lea sp,[bx + INIT_SI - 0x2]
mov bx,di

@anti_loop:
pop di
pop bp
shl bp,cl
mov word [bp+di-0x2],ax
sub sp,0x3
dec ch
jnz @anti_loop
mov di,bx
rep movsw
@traps_loop_end:

@reset_main_loop_loader:
mov cl,((@main_loop_end - @reset_main_loop + 1)/0x2 - 0x2)
rep movsw

@reset_main_loop:
add di,BOTTOM_TRAP_DIST
movsw
sub di,(INIT_SI + 0x2)
mov bx,di
movsw
mov cx,[si+0x4]
lds si,[si]
add dh,(JUMP_DIST/0x100)
nop
@reset_main_loop_end:

@main_loop:
pop di
pop bp
shl bp,cl
mov word [bp+di-0x2],ax
add sp,[bx]
mov di,[bx]
cmp [bx+si],di
jz @main_loop
mov ds,cx
mov di,dx
mov cx,(@traps_loop_end - @traps_loop + 1)/0x2
movsw
jmp dx
@main_loop_end:
dw TRAP_VAL
dw TRAP_VAL
dw INIT_SI
dw 0x1000
@copy_end:

zombieTrap:
	 push ds
    pop es
        
    mov bx, 0xCCCC
    mov cx, 0xCCCC

    mov ax, 0xA590
    mov dx, 0xCCCC

    int 0x87
    
    db 0xCC
    db 0xCC

end: