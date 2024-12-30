assume cs:code,ds:data,ss:stack

data segment
	str db 'aaaacbbbbbccccc '	;这样声明的话因为在内存空间上是连续的 而一个一维数组可以同时认为它是一个二维数组
	db 'aaaacbbbbbccccc '
	db 'aaaacbbbbbccccc '
	db 'aaaacbbbbbccccc ','$'
data ends

stack segment
	db 10 dup(0)
stack ends

;让第四列全变成大写
code segment
start:	mov ax,data	;先将ds指向数据区
		mov ds,ax
		
		mov bx,0
		mov cx,4

for:	mov dx,cx	;把外层循环的dx存起来，避免内层循环影响外层循环的次数
		mov si,0
		mov cx,5
		for1:	mov al,ds:str[bx+si]
				and al,11011111B
				mov ds:str[bx+si],al
				inc si
				loop for1
		mov cx,dx
		add bx,16
		loop for

		mov ax,4c00H
		int 21H
code ends
end start