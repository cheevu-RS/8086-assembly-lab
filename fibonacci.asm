data segment
num dw 10         
data ends

assume cs:code,ds:data

code segment
start: 
    mov ax,data
    mov ds,ax
    mov cx, num
    ; initialise number 1, 2
    ;ax for num1, bx for num 2
    mov ax, 1
    mov bx, 0 
    ; decrement count by 2
    dec cx
    dec cx
    loop1:        
        int 3;
        ;check ax for values
        mov di, ax
        add ax, bx
        mov bx, di
        dec cx 
        jnz loop1
    ;exit code
    mov ah,4ch
    int 21h
code ends
end start
