dseg segment
	X dw 0
dseg ends
cseg segment
	assume cs:cseg,ds:dseg
start proc far
	push ds
	sub ax,ax
	push ax
	mov ax,dseg
	mov ds,ax
	mov bl,8
	mov cl,4
	mov al,bl
	cbw
	idiv cl
	cbw
	mov bx,2
	imul bx
	mov dx,ax
	mov X,dx
exit:
	mov ax,4c00h
	int 21h
start endp
cseg ends
	end start