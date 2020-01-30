data segment
nums db 5, 6, 7, 10, 2, 3
count equ 6               
data ends

assume cs:code,ds:data

code segment
start: 
    mov ax,data
    mov ds,ax
    ;bubble sort
    mov dx, count
    outer:
        mov cx, count
        lea si, nums

        inner:
            mov al, [si]                 
            cmp al, [si+1]
            ; for descending
            ; jg swapornot                      
            ; for ascending
            jl swapornot
            xchg al, [si+1]
            mov [si], al                   

            swapornot:
                INC si
                loop inner

        dec dx
        jnz outer

    int 3;
    ;check dump to find your array

    ;exit code
    mov ah,4ch
    int 21h
code ends
end start
