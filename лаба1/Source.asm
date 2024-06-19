.686
.model flat,stdcall
.stack 100h
.data
; Объявление переменных, m-переменная для результата, inv-переменная для сдвига
x dw -13
y dw 26
z dw 15
m dw ?

.code
ExitProcess PROTO STDCALL :DWORD
Start:
; Загрузка значений переменных x, y, z в регистры al, bl, cl соответственно
mov ax, x
mov bx, y
mov cx, z

; Сдвиг на 3 бита влево через перенос z
sal cx, 3

; Умножение z на 5
imul cx, 5

; Вычитание x из предыдущего полученного значения
sub cx, x

; Сложение предыдущего значения с единицей *
add cx, 1

; Дизъюнкция x и y
or ax, bx

; Сложение результата * с предыдущим значением
add ax, cx

exit:
Invoke ExitProcess, ax
End Start