data segment
    info db 0dh,0ah,'Please input a number:$'
    info1 db 0dh,0ah,'The heximal of the number is:$'
data ends
code segment
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax
    mov dx,offset info;显示提示信息
    mov ah,9          
    int 21h   
    mov bx,0
newchar:
    mov ah,1;输入数字
    int 21h
    sub al,30h
    cmp al,0d
    jb let1
    cmp al,9d
    ja let1
    cbw
    xchg ax,bx
    mov cx,10d
    mul cx
    xchg ax,bx
    add bx,ax
    jmp newchar
let1:
    mov dl,0ah;换行
    mov ah,2
    int 21h
    mov dl,0dh
    mov ah,2
    int 21h
    mov ax,bx
    mov bx,16;把被除数放入bx
let2: 
    mov cx,0
    mov dx,0
    inc cx
    div bx
    push dx
    cmp ax,0
    jnz let2
let3:
    pop ax
    cmp ax,0ah
    jae let4
    add ax,30h
    mov dl,al
    mov ah,2
    int 21h
    dec cx
    cmp cx,0
    jnz let3
let4:
    add ax,37h
    mov dl,al
    mov ah,2
    int 21h
    dec cx
    cmp cx,0
    jnz let3

    mov ah,4ch
    int 21h
code ends
end start
