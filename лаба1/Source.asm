.686
.model flat,stdcall
.stack 100h
.data
; ���������� ����������, m-���������� ��� ����������, inv-���������� ��� ������
x dw -13
y dw 26
z dw 15
m dw ?

.code
ExitProcess PROTO STDCALL :DWORD
Start:
; �������� �������� ���������� x, y, z � �������� al, bl, cl ��������������
mov ax, x
mov bx, y
mov cx, z

; ����� �� 3 ���� ����� ����� ������� z
sal cx, 3

; ��������� z �� 5
imul cx, 5

; ��������� x �� ����������� ����������� ��������
sub cx, x

; �������� ����������� �������� � �������� *
add cx, 1

; ���������� x � y
or ax, bx

; �������� ���������� * � ���������� ���������
add ax, cx

exit:
Invoke ExitProcess, ax
End Start