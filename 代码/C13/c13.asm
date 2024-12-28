;我们可以使用offset的方法将一个函数中的一条指令复制到由nop占位出来的地方里面（这个地方可以是一个方法里面）
assume cs:codesg
codesg segment
s: 	mov ax,bx			;这句话占了两个字节 圈一
	mov si,offset s
	mov di,offset s0
	mov dx,cs:[si]		;si里面存的是圈一这段话的偏移地址 cs:[si]取得的就是mov ax,bx这句话8BC3移动进了dx
	mov cs:[di],dx		;把8BC3再移入s0所在的未知

s0:	nop
	nop

codesg ends
end s