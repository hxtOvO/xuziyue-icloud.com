dseg segment
	A dw 12,32,2,59,222,91,23,44,75,11,24,85,25,57,43		;15 numbers
	B dw 2,33,32,55,31,95,69,91,44,45,7,30,28,57,12,60,53,19,73,13	;20 numbers
	C dw 15 dup(0)
dseg ends
;
cseg segment
	assume cs:cseg,ds:dseg
start proc far
	push ds
	sub ax,ax
	push ax
;
	mov ax,dseg
	mov ds,ax
;
	mov bx,0			;����C��ָ��
	mov ch,15		;��ѭ������
	mov si,offset A		;����A��ָ��
outerloop:
	mov ax,[si]
	mov cl,20			;��ѭ������
	mov di,offset B		;����B��ָ��
innerloop:
	mov dx,[di]
	cmp ax,dx
	jnz next
	mov C[bx],ax
	add bx,2
next:
	add di,2
	dec cl
	jnz innerloop
	add si,2
	dec ch
	jnz outerloop
;
exit:
	ret
;
start endp
cseg ends
        end start
