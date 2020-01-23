data segment
a dw 8888H
b dw 9999H
s dw ?
c dw 0000H
data ends
code segment
assume cs: code, ds: data
start: 
mov ax, data
mov ds, ax
;add
mov ax, a
mov bx, b
add ax, bx
mov s, ax
; check for add carry
jnc noCarryA
mov cx, c
inc cx
noCarryA:
int 3
;subtract
mov ax, a
mov bx, b
sub ax, bx
mov s, ax
;check for sub carry
jnc noCarryS
mov cx, c
inc cx
noCarryS:
int 3
;multiply
mov ax, a
mov bx, b
mul bx
mov s, ax
;check for mul carry
jnc noCarryM
mov cx, dx
noCarryM:
int 3
;divide
mov ax, a
mov bx, b
div bx
mov s, ax
;check for div carry
jnc noCarryD
mov cx, dx
noCarryD:
int 3
code ends
end start