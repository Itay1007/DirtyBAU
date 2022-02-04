push cs
pop es
add di, ax
add di, end
repeat:
stosw
jmp repeat
end: