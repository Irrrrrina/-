.586
.model flat,c
.data
tmp real4 0.0
adr dword 0
n dword 0
counter dword 1

.code
extern funcC:near

public funcASM
funcASM proc
push ebp
mov ebp, esp ;���� ������ �� ����� ������� �����

mov eax, [ebp+8]
mov n, eax
mov eax, [ebp+12]
mov adr, eax ;���� � ������� ��� ������ ��� �������
loop1:
 push counter ;������ ���� �������� ��� ������ ���� �
 call funcC ;����� ���� �
 add esp, 4 ;������� ������
 fstp tmp ;���� ������ ����
 mov ebx, tmp
 mov eax, adr
 mov ecx, counter
 dec ecx
 mov [eax+ecx*4], ebx ;������ ������ ���� � ������
 inc counter
 mov eax, n
 cmp counter, eax
 jbe loop1

 mov esp, ebp
 pop ebp
 ret
 funcASM endp

 end