data segment
    score dw 89,79,32,45,23,32,43
    sign dw ?
data ends
code segment
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax
    mov cx,sign-score
    shr cx,1
    dec cx
loop1: ;外循环
    push cx
    mov bx,0
loop2:
    mov ax,score[bx]
    cmp ax,score[bx+2]
    jle next
    xchg ax,score[bx+2]
    mov score[bx],ax
next:
    add bx,2
    loop loop2
    pop cx
    loop loop1
    mov ah,4ch
    int 21h
code ends
end start