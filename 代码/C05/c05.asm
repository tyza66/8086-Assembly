;伪指令只能在编辑器里面写，不能直接用debug了
assume cs:codesg

codesg segment

	mov ax,0123H
	mov bx,0456H
	add ax,bx
	add ax,ax
	
	mov ax,4C00H
	int 21H
	
codesg ends

end

;编译链接之后使用DEBUG C05.EXE可以查看效果