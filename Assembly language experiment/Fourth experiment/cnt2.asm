data segment
	info db'please input no more than 30:$' ;输入的提示信息
    digitinfo db 'The number of digits is:$' ;
    upperinfo db 'The number of capitals is:$'
    lowerinfo db 'The number of letters is:$'
	buf db 30,?,31 dup(?)
	number db 0 ;数字的个数
	capital db 0 ;大写字母的个数
	letter db 0 ;小写字母的个数
	len dw 0
    table dw 3 dup(?)
    tlen equ $-table
    hex db '0123456789ABCDEF'
    ans dw ?
data ends
code segment
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax
    mov dx,offset info
    mov ah,9
    int 21h
    mov dx,offset buf
    mov ah,10
    int 21h
    mov al,buf[1]
    mov ah,0
    add ax,2
    mov len,ax
    mov bx,1
isdigit:;获得数字的个数
    inc bx
    mov al,buf[bx];遍历串
    cmp bx,len
    jae ts
    cmp al,30h
    jb isdigit
    cmp al,39h
    ja iscapital
    inc number
    jmp isdigit
iscapital:;获得大写字母的个数
    cmp al,41h
    jb isdigit
    cmp al,5ah
    ja isletter
    inc capital
    jmp isdigit
isletter:;获得小写字母的个数
    cmp al,61h
    jb isdigit
    cmp al,7ah
    ja isdigit
    inc letter
    jmp isdigit
ts:;转换十六进制的函数
    mov dl,0ah;换行
    mov ah,2
    int 21h
    mov dl,0dh
    mov ah,2
    int 21h
    mov al,number
    cbw ;拓展为双字
    mov table[0],ax
    mov al,capital
    cbw
    mov table[2],ax
    mov al,letter
    cbw
    mov table[4],ax
    mov bx,0
fetch:
    cmp bx,tlen
    jae exit
    mov ax,table[bx]
    mov ans,ax
    mov ch,4
    mov cl,4
ts1:
    mov ax,ans
    rol ax,cl
    mov ans,ax
    and ax,000fh
    mov si,ax
    mov dl,hex[si]
    mov ah,2
    int 21h
    dec ch
    jnz ts1

    mov dl,0ah
    mov ah,2
    int 21h
    mov dl,0dh
    mov ah,2
    int 21h

    add bx,2;加2，到下个存储单元
    jmp fetch
exit:
    mov ah,4ch
    int 21h
code ends
end start
