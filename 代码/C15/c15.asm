;注意汇编语言是不区分字母大小写的、除了单引号双引号也是可以用的
;字母应该用字节db来存、如果用字dw来存就会报错、代码中写0011B这样定义二进制数不会报错，但是不能直接在debug中敲
;不写默认是10进制 B二进制 H16进制数 O是八进制
;十六进制必须以数字开头
assume cs:codesg,ds:data,ss:stack

data segment
	arr db 12,34	;前面的arr是别名(带:是标号相当于代码不能直接[]到达、也不能type)
	;align指令用来内存对齐 如果当前地址不是4的倍数，汇编器会插入适当数量的填充字节（通常是0），直到地址成为4的倍数。
	arr1 dw 12,34
	arr2 db 'hello world'
	arr4 db 10H,20H,30H,40H,50H
data ends

stack segment
	db 10 dup(0)
stack ends

codesg segment
	arr3 dw 12,34,56,78,9AH	;这样定义的数组可以使用[0]访问到位置
start:	mov ax,data			;通过这样就能找到之前那些段的地址
		mov bx,type arr1		;可以求出数组是哪一种类型的 返回的是代码
		;mov si,offset arr	不可以找到arr的位置，因为当前在代码段不在数据段，如果想，可以把数据定义移动过来
		mov ax,arr3[2];访问数组 但是和平时C中的数组不一样 下标每次移动都是移动一个字节而不是一个字
		;等价于mov si,offset arr3 再 mov ax,cs:[si+2] 如果用db就没问题
		
		mov ax,data
		mov ds,ax		;必须将ds和data的地址联系在一起 才能用后面的arr4 这里不可以直接赋值
		mov al,arr4[2]	;如果想存入30应该使用mov al, arr4[2]吧，如果使用了ax会从arr4[2]区两个字节就是一个字进入ax导致ax值不对
codesg ends
end start