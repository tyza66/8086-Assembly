comment *
这样希望最大值存在ah里面
* comment
assume cs:codesg,ds:data,ss:stack

data segment
	str db 'Hello world','$'
data ends

stack segment
	db 10 dup(0)
stack ends

codesg segment
start:	mov ax,data	;先将ds指向数据区
		mov ds,ax
		
		mov bx,0	;用于记录偏移量
		mov cx,11	;用于记录循环次数
		
		mov ah,00	;给ah先置为0 之后ah用于存储最大值
		
s:		mov al,[bx]	;将当前字符存进al
		cmp ah,al	;比较ah和al 结果会存在标识寄存器中
		jnb s1		;jnb是 如果 ah >= al (无符号数比较)，跳转到sl
		mov ah,al	;如果没有跳转 就是因为 ah<al 那就将ah更新为当前的al

s1:		inc bx		;bx步进一下
		loop s	;如果cx-1不等于0那就回到s继续
		
codesg ends
end start

comment *
	如果想要求最小值就让ah先为0FFH 
	然后下面判定改为jna 跟刚才的相反
* comment