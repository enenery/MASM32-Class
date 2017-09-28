TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data

promptA byte "Enter a positive interger of your choice for A: ", 0
promptB byte "Enter a positive integer of your choice for B: ", 0
promptY1 byte "Enter a positive integer of your choice for Y1: ", 0
A dword ?
B dword ?
Y1 dword ?

.code
main PROC
	mov eax, white + (black*16)
	call settextcolor
	call clrscr
	mov eax, 0
	call ReadA
	call ReadB
	call ReadY
	call clrscr
	call drawup
	;call drawline
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

drawup PROC
mov ecx, Y1
mov eax, B
dec al
mov dl, 0
mov dh, al

drawverticalUp2:

call gotoxy

mov al, 'x'
call writechar
mov eax, 50
call delay
dec dh

loop drawverticalUp2

mov eax, A
mov ecx, 27
mov dl, 0
mov dh, al

drawToTheRight2:

	call gotoxy

	mov al, 'x'
	call writechar
	mov eax, 50
	call delay
	inc dl

loop drawToTheRight2
	ret

drawup ENDP
end main