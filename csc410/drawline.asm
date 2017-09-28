   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written SANOU W. LAURENT
INCLUDE Irvine32.inc
.data
	;we need a start and end for x for draw a line accross the screen
	x1 byte 7  ;xs or xstart
	x2 byte 30
	y1 byte 5 ; 5 down
	myWord byte "Laurking",0
	deltax dword ?
.code
main PROC
	call clrscr  ;clear the screen
        call createdelta
	call drawline
	
        exit
	 
main ENDP
 

createdelta proc
	movzx eax,x2
	sub al,x1
	inc eax
	mov deltax,eax
	ret
createdelta endp

drawline proc
	mov dl,x1
	mov dh,y1
	mov ecx,deltax
	draw:
		call gotoxy
		mov al,'*'
		call writechar
		mov eax,10
		call delay
		call gotoxy
		mov al,' '
		call writechar
		inc dl
	loop draw
	ret
drawline endp


moveword proc
	mov dl,x1
	mov dh,y1
	mov ecx,deltax
	draw1:
		call gotoxy
		mov al,'*'
		call writechar
		mov eax,10
		call delay
		call gotoxy
		mov al,' '
		call writechar
		inc dl
	loop draw1
	ret
moveword endp
end main