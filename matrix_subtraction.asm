data segment
ar1 dw 9, 9, 9, 9, 9, 9  
ar2 dw 1, 2, 3, 4, 5, 6 
m equ 3
n equ 2    
data ends
assume cs:code,ds:data
code segment
start: 
    mov ax,data
    mov ds,ax
    
    mov ax, m
    mov bx, n
    mul bx
    mov cx, ax
    lea si, ar1
    lea di, ar2
    loop1:
        xor ax,ax
        xor bx,bx
        mov al, [si]                 
        mov bl, [di]
        sub al, bl
        mov [si], al
        ; int 3
        inc si
        inc di
        inc si
        inc di
        dec cx
        jnz loop1

    int 3;
    ;check dump to find your array

    ;exit code
    mov ah,4ch
    int 21h
code ends
end start
