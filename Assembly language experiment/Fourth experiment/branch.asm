;模仿课本119页5.5.3示例5-9，将以前自己写的程序整理成菜单程序。table表里面保存的是跳转到程序的标号。与我们第三次课中通过学号查找名字时，表里面存姓名标号是一个概念。

data segment
    table dw prog0,prog1,prog2
    mess1 db "Please enter a number(0~2):$"
    mess2 db "Please enter a number(0-4):$"
    x db 32
    y db 34
    student dw stu0,stu1,stu2,stu3,stu4
	stu0 db 0dh,0ah,'jin tao$'
	stu1 db 0dh,0ah,'wang peng$'
	stu2 db 0dh,0ah,'wang bo$'
	stu3 db 0dh,0ah,'xing peng$'
	stu4 db 0dh,0ah,'guo zelin$'
data ends
code segment
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax
let0:
    mov dl,0ah
    mov ah,2
    int 21h
    mov dl,0dh
    mov ah,2
    int 21h
    lea dx,mess1
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    and al,03h
    mov ah,0
    shl ax,1
    mov bx,ax
    jmp table[bx]
    
prog0:
    mov dl,0ah
    mov ah,2
    int 21h
    mov dl,0dh
    mov ah,2
    int 21h
	mov al,x
	add al,y
	mov ah,al ;将al中的数放到ah
	and al,0fh 
	mov cl,4
	rol ah,cl
	and ah,0fh
	add ax,3030h
	mov bx,ax
	mov dl,bh
	mov ah,2
	int 21h
	mov dl,bl
	mov ah,2
	int 21h
    jmp let0
prog1:
    mov dl,0ah
    mov ah,2
    int 21h
    mov dl,0dh
    mov ah,2
    int 21h
    lea dx,mess2
    mov ah,9
    int 21h
    mov dl,0ah
    mov ah,2
    int 21h
	mov ah,1
	int 21h
	sub al,30h
	mov bl,2
	mul bl
	mov bx,ax
	mov dx,student[bx]
	mov ah,9
	int 21h
    jmp let0;
prog2:
    mov ah,4ch
    int 21h
code ends
end start