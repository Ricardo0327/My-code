data segment
	info db'please input no more than 30:$'
    digitinfo db 'The number of digits is:$'
    upperinfo db 'The number of capitals is:$'
    lowerinfo db 'The number of letters is:$'
	buf db 30,?,31 dup(?)
	number db 0
	capital db 0
	letter db 0
	len dw 0
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
isdigit:
    inc bx
    mov al,buf[bx];遍历串
    cmp bx,len
    jae exit
    cmp al,30h
    jb isdigit
    cmp al,39h
    ja iscapital
    inc number
    jmp isdigit
iscapital:
    cmp al,41h
    jb isdigit
    cmp al,5ah
    ja isletter
    inc capital
    jmp isdigit
isletter:
    cmp al,61h
    jb isdigit
    cmp al,7ah
    ja isdigit
    inc letter
    jmp isdigit
exit:
    mov dl,0ah;换行
    mov ah,2
    int 21h
    mov dl,0dh
    mov ah,2
    int 21h
    mov dx,offset digitinfo
    mov ah,9
    int 21h
    mov cl,number;显示数字的个数
    add cl,30h
    mov dl,cl
    mov ah,2
    int 21h
    mov dl,0ah;换行
    mov ah,2
    int 21h
    mov dl,0dh
    mov ah,2
    int 21h
    mov dx,offset upperinfo
    mov ah,9
    int 21h
    mov cl,capital;显示大写字母的个数
    add cl,30h
    mov dl,cl
    mov ah,2
    int 21h
    mov dl,0ah;换行
    mov ah,2
    int 21h
    mov dl,0dh
    mov ah,2
    int 21h
    mov dx,offset lowerinfo
    mov ah,9
    int 21h
    mov cl,letter;显示小写字母的个数
    add cl,30h
    mov dl,cl
    mov ah,2
    int 21h
    mov dl,0ah
    mov ah,2
    int 21h
    mov dl,0dh
    mov ah,2
    int 21h
    mov ah,4ch
    int 21h
code ends
end start



    
    