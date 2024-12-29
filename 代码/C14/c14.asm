assume cs:codesg
codesg segment
start:	mov ax,0
		jmp short s	;短跳到s那块 最终ax应该是1而不是2
		add ax,2
		
s:		inc ax

codesg ends
end start

;虽然汇编代码转换出来是jmp 0008 但是机器码EBO3中没有存储0008这样的信息。而存储的是距离

;除此之外还有jmp near ptr 功能差不多 执行近跳转，目标地址在当前代码段内，通常用于跳转到相对较近的位置。指令只修改IP寄存器的值，不影响CS寄存器。

;JMP SHORT：用于当前代码段内的短跳转（short jump）。这种跳转只能覆盖较短的距离，目标地址必须在当前指令的前或后 128 字节内（即距离当前指令的地址在 -128 到 +127 字节范围内）。与近跳转一样，指令只修改 IP 寄存器的值，不影响 CS 寄存器。
;JMP NEAR PTR：用于当前代码段内的近跳转（near jump）。这种跳转可以覆盖较长的距离，目标地址可以在当前代码段内的较远位置。指令只修改 IP 寄存器的值，不影响 CS 寄存器。

;jmp far ptr s 下一句来个 db 246 dup(0)把下面的代码推到不是同一个段里面 远跳转相当于存的跳转地址包括cs:ip
;jmp word ptr ds:[0] 跳转到字中存放的IP地址
;jmp dword ptr 这样可以同时更改CS:IP dword是双字 IP部分是存在DS:[0] mov  ds:[0],ax CS存在DS:[2] mov word ptr ds:[2],0 之后jmp dword ptr ds:[0] 相当于一次远跳转

;jcxz 也是一种条件条转 目的是判断通用寄存器cx是否为0 为0就跳转