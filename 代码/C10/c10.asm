;MASM内部以数据位定义了多种数据类型 一下第一个d其实翻译成define 就是定义
;BYTE  db 8位
;WORD  dw 16位
;DWORD dd 32位
;QWORD qd 64位
;代码和数据在内存中是不加以区分的
;使用dw db这些的时候不用执行就相当于在当前内存中存下了当前参数的数据
;可以使用大的数据类型存小数据类型的值但是高位有00填充
;16进制不能以字母打头
;左低右高内部相反
assume cs:code

code segment
	dw 123H,456H,789H,0abcH,0defH ;如果直接接上代码了，后面的代码就会和这个混起来 就不好了 需要用到start
	
start:	mov ax,1	;start表示代码段从这里开始执行，上面是数据部分，也就是说明可以把数据存在代码段中
		mov cx,3
		call s
		sub ax,1
	
		mov ax,4c00h
		int 21H
		
s: 	add ax,ax
	loop s
	ret
		
code ends
end start

;事实上尽管使用了start进行分割，数据和代码段之间虽然不会影响，但显示上还是有一定的混淆，如果想要完全不混淆可以直接手动dw出来一片空间之后用循环压倒用dw创建好的栈区域里面，再依次出栈到代码段0-15单元CS:BX中