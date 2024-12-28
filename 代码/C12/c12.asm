;offset可以读取一个函数所在的地址并
;mov ax,offset start 相当于mov ax,0 就是获得了start的地址之后给ax 其实获得的是当前段的偏移地址

assume cs:code
code segment
start: 
	mov ax,offset start
	mov dx,offset s
s:	inc bx
	
	mov ax,4c00h
	int 21H
code ends
end start

;这东西的作用是可获得代码段在哪
;我们可以使用offset的方法将一个函数中的一条指令复制到由nop占位出来的地方里面（这个地方可以是一个方法里面）