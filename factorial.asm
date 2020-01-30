data segment
num dw 5        
data ends

assume cs:code,ds:data

code segment
start: 
    mov ax,data
    mov ds,ax

    mov cx, num
    mov ax, 1
    loop1:        
        mov bx, cx
        mul bx 
        dec cx 
        jnz loop1

    int 3;
    ;check ax for factorial

    ;exit code
    mov ah,4ch
    int 21h
code ends
end start
