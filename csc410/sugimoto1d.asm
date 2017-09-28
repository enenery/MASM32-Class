TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data

promptA byte "Enter a number of your choice for A: ", 0
promptB byte "Enter a number of your choice for B: ", 0
promptY1 byte "Enter a number of your choice for Y1: ", 0
A dword ?
B dword ?
Y1 dword ?
count dword ?
height dword 0
colors byte ?

.code
main PROC

	call clrscr
	mov eax, 0
	call ReadA
	call ReadB
	call ReadY1
	call clrscr
	call randomize
	call drawlineAB
	mov eax, white + (black*16)
	call settextcolor
                
        exit
	 
main ENDP
 
ReadA proc

mov edx, offset promptA
call writestring
call readint 
mov A, eax
call crlf
ret
ReadA endp

ReadB proc

mov edx, offset promptB
call writestring
call readint 
mov B, eax
call crlf
ret
ReadB endp

ReadY1 proc

	mov edx, offset promptY1
	call writestring
	call readint 
	mov Y1, eax
	call crlf
	ret
ReadY1 endp

drawline PROC

	mov eax, B
	sub eax, A
	dec al
	mov ecx, eax
	mov eax, A
	mov dl, al
	mov eax, height
	mov dh, al
	mov eax, 16
	call randomrange
	mov colors[esi], al
	call settextcolor

drawToTheRight:

	call gotoxy
	mov al, '*'
	call writechar
	mov eax, 50
	call delay
	inc dl
	
loop drawToTheRight

	mov ecx, Y1
	mov eax, B
	dec al
	mov dl, al
	mov eax, height
	mov dh, al

drawverticalDown:

	call gotoxy
	mov al, '*'
	call writechar
	mov eax, 50
	call delay
	inc dh

loop drawverticalDown
	ret

drawline ENDP

drawback PROC

	mov ecx, Y1
	mov eax, height
	mov dh, al
	mov eax, B
	dec al
	mov dl, al

drawverticalUp:

	call gotoxy
	mov eax, black + (black * 16)
	call settextcolor

	mov al, '*'
	call writechar
	mov eax, 50
	call delay
	dec dh

loop drawverticalUp

	mov eax, B
	mov ecx, B
	inc ecx
	mov dl, al
	mov eax, height
	sub eax, Y1
	mov dh, al

drawToTheLeft:

	call gotoxy
	mov eax, black + (black * 16)
	call settextcolor
	mov al, '*'
	call writechar
	mov eax, 50
	call delay
	dec dl
	
loop drawToTheLeft
	sub count, 1
	mov ecx, count
	ret
drawback ENDP

drawlineAB PROC
	mov ecx, 11
	mov count, ecx
	mov esi, 0

loopy:	
	call drawline
	mov eax, Y1
	add height, eax
	call drawback
	inc esi
loop loopy	
	ret

drawlineAB ENDP

countColors PROC

	.if(al == 0)
	add colors[0], 1
	.elseif(al == 1)
	add colors[1], 1
	.elseif(al == 2)
	add colors[2], 1
	.elseif(al == 3)
	add colors[3], 1
	.elseif(al == 4)
	add colors[4], 1
	.elseif(al == 5)
	add colors[5], 1
	.elseif(al == 6)
	add colors[6], 1
	.elseif(al == 7)
	add colors[7], 1
	.elseif(al == 8)
	add colors[8], 1
	.elseif(al == 9)
	add colors[9], 1
	.elseif(al == 10)
	add colors[10], 1	
	.elseif(al == 11)
	add colors[11], 1	
	.elseif(al == 12)
	add colors[12], 1
	.elseif(al == 13)
	add colors[13], 1
	.elseif(al == 14)
	add colors[14], 1
	.else
	add colors[15], 1
	.endif
	ret
	
countColors ENDP


end main