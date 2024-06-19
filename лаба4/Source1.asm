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
mov ebp, esp ;сохр указат на адрес вершины стека

mov eax, [ebp+8]
mov n, eax
mov eax, [ebp+12]
mov adr, eax ;сохр в перемен адр адреса нач массива
loop1:
 push counter ;запись знач счетчика для вызова функ С
 call funcC ;вызов функ С
 add esp, 4 ;коррект указат
 fstp tmp ;сохр расчит знач
 mov ebx, tmp
 mov eax, adr
 mov ecx, counter
 dec ecx
 mov [eax+ecx*4], ebx ;запись нового знач в массив
 inc counter
 mov eax, n
 cmp counter, eax
 jbe loop1

 mov esp, ebp
 pop ebp
 ret
 funcASM endp

 end