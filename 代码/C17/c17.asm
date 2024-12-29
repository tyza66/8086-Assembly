* comment

* comment
assume cs:codesg,ds:data,ss:stack

data segment
	string db 'hello world'
data ends

stack segment
	db 10 dup(0)
stack ends

codesg segment
start:	
codesg ends
end start