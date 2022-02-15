%define ROW 0x100
%define JMP_$_OPCODE 0xFEEB
%define SPACE_SIZE 0xa



mov bx, ax

lea bx, [bx - 17 * ROW]

create_D:
    mov byte [bx + ROW], al
    mov byte [bx + ROW + 1], al
    mov byte [bx + ROW + 2], al
    mov byte [bx + 2 * ROW + 3], al
    mov byte [bx + 3 * ROW + 4], al
    mov byte [bx + 4 * ROW + 4], al
    mov byte [bx + 5 * ROW + 4], al
    mov byte [bx + 6 * ROW + 3], al
    mov byte [bx + 7 * ROW + 2], al
    mov byte [bx + 7 * ROW + 1], al
    mov byte [bx + 7 * ROW], al
    
    mov byte [bx + 2 * ROW], al
    mov byte [bx + 3 * ROW], al
    mov byte [bx + 4 * ROW], al
    mov byte [bx + 5 * ROW], al
    mov byte [bx + 6 * ROW], al

lea bx, [bx + ROW + SPACE_SIZE]
create_I:
    mov byte [bx], al
    mov byte [bx - 1], al
    mov byte [bx + 1], al
    mov byte [bx + ROW], al
    mov byte [bx + 2 * ROW], al
    mov byte [bx + 3 * ROW], al
    mov byte [bx + 4 * ROW], al
    mov byte [bx + 5 * ROW], al
    mov byte [bx + 6 * ROW], al
    mov byte [bx + 6 * ROW], al
    mov byte [bx + 6 * ROW - 1], al
    mov byte [bx + 6 * ROW + 1], al
    
lea bx, [bx + SPACE_SIZE - 3]
create_R:
    
    mov byte [bx], al
    mov byte [bx + 1], al
    mov byte [bx + 2], al
    mov byte [bx + 3], al
    mov byte [bx + 3 + ROW], al
    mov byte [bx + 3 + 2 * ROW], al
    mov byte [bx + 3 + 3 * ROW], al
    mov byte [bx + 2 + 3 * ROW], al
    mov byte [bx + 1 + 3 * ROW], al

    mov byte [bx + 4 * ROW + 1], al    
    mov byte [bx + 5 * ROW + 2], al    
    mov byte [bx + 6 * ROW + 3], al

    
    mov byte [bx + ROW], al
    mov byte [bx + 2 * ROW], al
    mov byte [bx + 3 * ROW], al
    mov byte [bx + 4 * ROW], al
    mov byte [bx + 5 * ROW], al
    mov byte [bx + 6 * ROW], al


lea bx, [bx + SPACE_SIZE]
create_T:
    mov byte [bx], al
    mov byte [bx - 1], al
    mov byte [bx - 2], al
    mov byte [bx + 1], al
    mov byte [bx + 2], al

    mov byte [bx + ROW], al
    mov byte [bx + 2 * ROW], al
    mov byte [bx + 3 * ROW], al
    mov byte [bx + 4 * ROW], al
    mov byte [bx + 5 * ROW], al
    mov byte [bx + 6 * ROW], al
    

add bx, SPACE_SIZE
create_Y:
    mov byte [bx + 2 * ROW], al
    mov byte [bx + 3 * ROW], al
    mov byte [bx + 4 * ROW], al
    mov byte [bx + 5 * ROW], al
    mov byte [bx + 6 * ROW], al
    mov byte [bx - 1 + ROW], al
    mov byte [bx - 2], al
    mov byte [bx + 1 + ROW], al
    mov byte [bx + 2], al
    


lea bx, [bx - ROW  + SPACE_SIZE]
create_B:
    mov byte [bx + ROW], al
    mov byte [bx + ROW + 1], al
    mov byte [bx + ROW + 2], al
    mov byte [bx + 2 * ROW + 3], al
    mov byte [bx + 3 * ROW + 2], al
    mov byte [bx + 3 * ROW + 1], al
    
    
    mov byte [bx + 4 * ROW + 1], al
    mov byte [bx + 4 * ROW + 2], al
    mov byte [bx + 5 * ROW + 3], al 
    mov byte [bx + 6 * ROW + 3], al
    mov byte [bx + 7 * ROW + 2], al
    mov byte [bx + 7 * ROW + 1], al
    mov byte [bx + 7 * ROW], al
    
    mov byte [bx + 2 * ROW], al
    mov byte [bx + 3 * ROW], al
    mov byte [bx + 4 * ROW], al
    mov byte [bx + 5 * ROW], al
    mov byte [bx + 6 * ROW], al

lea bx, [bx + ROW  + SPACE_SIZE]
create_A:
    mov byte [bx], al
    mov byte [bx - 1 + ROW], al
    mov byte [bx - 2 + 2 * ROW], al
    mov byte [bx - 2 + 3 * ROW], al
    mov byte [bx - 2 + 4 * ROW], al
    mov byte [bx - 2 + 5 * ROW], al
    mov byte [bx - 2 + 6 * ROW], al
    mov byte [bx + 1 + ROW], al
    mov byte [bx + 2 + 2 * ROW], al
    mov byte [bx + 2 + 3 * ROW], al
    mov byte [bx + 2 + 4 * ROW], al
    mov byte [bx + 2 + 5 * ROW], al
    mov byte [bx + 2 + 6 * ROW], al
    mov byte [bx + 4 * ROW], al
    mov byte [bx - 1 + 4 * ROW], al
    mov byte [bx + 1 + 4 * ROW], al

lea bx, [bx + - ROW + SPACE_SIZE]
create_U:
        mov byte [bx - 3 + ROW], al
        mov byte [bx - 3 + 2 * ROW], al
        mov byte [bx - 3 + 3 * ROW], al
        mov byte [bx - 3 + 4 * ROW], al
        mov byte [bx - 3 + 5 * ROW], al
        mov byte [bx - 3 + 6 * ROW], al
        mov byte [bx - 3 + 7 * ROW], al
        
        
        mov byte [bx - 2 + 7 * ROW], al
        mov byte [bx - 1 + 7 * ROW], al
        mov byte [bx + 7 * ROW], al
        mov byte [bx + 1 + 7 * ROW], al
        mov byte [bx + 2 + 7 * ROW], al
        
        mov byte [bx + 3 + 7 * ROW], al        
        mov byte [bx + 3 + 6 * ROW], al
        mov byte [bx + 3 + 5 * ROW], al
        mov byte [bx + 3 + 4 * ROW], al
        mov byte [bx + 3 + 3 * ROW], al
        mov byte [bx + 3 + 2 * ROW], al
        mov byte [bx + 3 + ROW], al
        
loop $
