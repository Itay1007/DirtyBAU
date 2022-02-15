%define ROW 0x100
%define SMILIY_INTERVAL 0x350

mov bx, ax
lea bx, [bx + 4 * ROW]

smiloop:
 mov [bx], al
 mov [bx+4], al
 mov [bx+ROW+2], al
 mov [bx+0x300], al
 mov [bx+0x400], al
 mov [bx+0x501], ax
 mov [bx+0x403], al
 mov [bx+0x304], al
 add bx, SMILIY_INTERVAL
 jmp smiloop 