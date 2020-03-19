dseg segment
	X dw 10
	Y dw 3
	W dw 30
	Z dw 0
	
dseg ends
cseg segment
	assume cs:cseg,ds:dseg
start proc far
	push ds
	sub ax,ax
	push ax
	mov ax, dseg
	mov ds, ax

	mov ax, W
	sub ax, X
	cwd
	mov bx, 5
	idiv bx
	imul Y
	mov bx, 2
	imul bx
	mov Z, ax

exit:
	mov ax, 4c00h
	int 21h
start endp
cseg ends
        end start
