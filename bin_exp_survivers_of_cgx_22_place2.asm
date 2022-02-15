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

