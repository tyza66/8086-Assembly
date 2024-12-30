;实现了将存储在字符串中的十进制数转换为十六进制数字符串
assume cs:code,ds:data,ss:stack
data segmeNT
	str db '00000123','$'
	res db '0000','$'
data ends
stack segment
	db 100 dup (0) 
stack ends
;十进制转16进制是一种经典的string转int算法
code SEgment
	start:	
		mov ax,data
		mov ds,ax
		mov ax,stack
		mov ss,ax		
		mov sp,10
		mov si,4

		mov bx,0
		mov cx,8
		mov ax,0
		s:
			mov dx,ax
			shl ax,1
			shl ax,1	
			shl ax,1
			shl dx,1
			add ax,dx
;乘10

			add al,str[bx]
			adc ah,0
			sub ax,30H		
		
			inc bx 
			loop s
		
;ax=3039
	
		mov cx,4
		l:
			mov dx,ax
			and dx,0FH
			add dx,30H
			cmp dx,3AH
			jb s1
			add dx,7H
;求出3039的ASCII码，push
		s1:
			dec si
			mov ds:res[si],dl
			shr ax,1
			shr ax,1
			shr ax,1
			shr ax,1
			loop l

		;lea指令相当于mov dx,offset res 把dx移动到了res的偏移量上
	 	lea  dx,res
		mov ah,9
		int 21H

		mov ah,4cH
		int 21H
code ends
end start