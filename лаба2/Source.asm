.686
.model flat,stdcall
.stack 100h
.data
L dw ?;
M dw ?;
R dw 3111h;
W dw ?;
M1 dw 714Ah, 6B15h, 431Bh; объ€вление массива M1 шестн
.code
ExitProcess PROTO STDCALL :DWORD
Start:

xor eax,eax
xor ebx,ebx
xor ecx,ecx

;------------------------------
mov ax,m1
mov cl, 2
mov bx,2
L1: 
	xor ax,[M1+bx]
	add bx,2
loop L1
mov L,ax
;------------------------------
mov bx,2
mul bx
and M1,00F0h
sub ax,M1
mov M,ax

cmp ax, R
jg s1
call s2

s1 PROC
	NEG	M
	ret
s1 ENDP

s2 PROC
	NOT	M
	ret
s2 ENDP



exit:
Invoke ExitProcess,ax
End Start