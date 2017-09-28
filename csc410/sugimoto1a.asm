   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data

promptA byte "Enter a positive interger of your choice for A: ", 0
promptB byte "Enter a positive integer of your choice for B: ", 0
promptY1 byte "Enter a positive integer of your choice for Y1: ", 0
error byte "B must be larger than A, please reenter: ",0
A dword ?
B dword ?
Y1 dword ?

.code
main PROC
	call clrscr
	mov eax, 0
	call ReadA
	call ReadB
	call ReadY
	call clrscr
	
	mov eax, B
	sub eax, A
	cmp eax, 00
	je L1
	call drawline
	L1:
	mov eax, white + (black*16)
	call settextcolor
	;call drawback
                
        exit
	 
main ENDP
 
ReadA PROC

	mov edx, offset promptA
	call writestring
	call readint 
	mov A, eax
	call crlf
	ret

ReadA ENDP

ReadB PROC

	mov edx, offset promptB
	call writestring
	call readint 
	mov edx, offset error
	beginwhile:
		cmp eax, A
		jnl endwhile
		call writestring 
		call readint
		jmp beginwhile
	endwhile:
	 
	mov B, eax
	call crlf
	ret

ReadB ENDP

ReadY PROC

	mov edx, offset promptY1
	call writestring
	call readint 
	mov Y1, eax
	call crlf
	ret

ReadY endp

drawline PROC
	mov eax, B
	sub eax, A
	mov ecx, eax
	mov eax, A
	mov dl, al
	mov dh, 0

	drawToTheRight:
	   call gotoxy
	   mov eax, red + (black * 16)
	   call settextcolor

	   mov al, '*'
	   call writechar
	   mov eax, 50
	   call delay
	   inc dl
	loop drawToTheRight

mov ecx, Y1
mov eax, B
mov dl, al
mov dh, 0

drawverticalDown:

call gotoxy

mov al, '*'
call writechar
mov eax, 50
call delay
inc dh

loop drawverticalDown
ret
drawline endp

drawback proc
mov ecx, Y1
mov eax, Y1
mov dh, al
mov eax, B
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
mov dh, 0

drawToTheLeft:
	call gotoxy
	mov eax, black + (black * 16)
	call settextcolor

	mov al, '*'
	call writechar
	mov eax, 50
	call delay
	dec dl
	call dumpregs

loop drawToTheLeft
ret
drawback endp
end main