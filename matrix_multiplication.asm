assume  cs:code,ds:data
data  segment
mat1  db  1, 2, 3, 4, 5, 6 ; 3*2
mat2  db  1, 1, 1, 1, 1, 1 ; 2*3
res  dw  09h  dup(?)
data  ends
code  segment
start:
    mov  ax, data
    mov  ds, ax
    ; i
    mov  ch, 03h	
    lea  bx, res
    lea  si, mat1
			
nextrow:	
    lea  di, mat2
    ; j
    mov  cl, 03h 

nextcol:	
    ; k
    mov  dl, 02h 
    ; sum
    mov  bp, 0000h 
    ; temp value for calculating multiplication
    mov  ax, 0000h	

next_ele:
	mov  al, [si] 	
    ; multiply a[i][k]*b[k][j] 
    mul  byte ptr[di]	
    add  bp, ax	
    ; next element of a
    inc  si	
    ; because in 2nd matrix we need below element
    add  di, 03h 
    ; decrement k
    dec dl		
    jnz next_ele
    ; again di goes initial value 
    sub di, 05h	
    ; si goes to initial value
    sub si, 02h	
    ; storing result
    mov [bx], bp	
    inc bx		
    ; decrement j
    dec cl		
    jnz nextcol	
    add si, 02h  
    dec ch
    jnz nextrow
    mov ah, 4ch
    int 3
code ends
end start