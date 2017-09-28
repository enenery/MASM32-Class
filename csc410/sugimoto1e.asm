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
colors byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
msg byte "Here is the array of colors: ", 0
colorLabelmsg byte "There was ", 0

blackm byte " of black", 0
bluem byte " of blue",0
greenm byte " of green", 0
cyanm  byte " of cyan", 0	
redm byte " of red", 0
magentam byte " of magenta", 0
brownm byte " of brown", 0
lightGraym byte " of light gray", 0
graym byte " of gray", 0
lightBluem byte " of light blue", 0
lightGreenm byte " of light green", 0
lightCyanm byte " of light cyan", 0
lightRedm byte " of light red", 0
lightMagentam byte " of light magenta", 0
yellowm byte " of yellow", 0
whitem byte " of white", 0

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
	dec eax
	mov ecx, eax
	mov eax, A
	mov dl, al
	mov eax, height
	mov dh, al
	mov eax, 15
	call randomrange
	add eax, 1
	call countColors
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
	mov esi, 1

loopy:	
	call drawline
	mov eax, Y1
	add height, eax
	call drawback
	inc esi
loop loopy
	mov eax, white + (black*16)
	call settextcolor

call printResults	

	ret
drawlineAB ENDP

countColors PROC
	.if(al == 1)
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

printResults PROC
	
	mov eax, white + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[0]
	mov edx, offset blackm
	call writedec
	call writestring
	call crlf

	mov eax, blue + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[1]
	mov edx, offset bluem
	call writedec
	call writestring
	call crlf

	mov eax, green + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[2]
	mov edx, offset greenm
	call writedec
	call writestring
	call crlf

	mov eax, cyan + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[3]
	mov edx, offset cyanm
	call writedec
	call writestring
	call crlf

	mov eax, red + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[4]
	mov edx, offset redm
	call writedec
	call writestring
	call crlf
	
	mov eax, magenta + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[5]
	mov edx, offset magentam
	call writedec
	call writestring
	call crlf

	mov eax, brown + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[6]
	mov edx, offset brownm
	call writedec
	call writestring
	call crlf

	mov eax, lightgray + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[7]
	mov edx, offset lightGraym
	call writedec
	call writestring
	call crlf

	mov eax, gray + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[8]
	mov edx, offset graym
	call writedec
	call writestring
	call crlf

	mov eax, lightblue + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[9]
	mov edx, offset lightBluem
	call writedec
	call writestring
	call crlf

	mov eax, lightgreen + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[10]
	mov edx, offset lightGreenm
	call writedec
	call writestring
	call crlf

	mov eax, lightcyan + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[11]
	mov edx, offset lightCyanm
	call writedec
	call writestring
	call crlf

	mov eax, lightred + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[12]
	mov edx, offset lightRedm
	call writedec
	call writestring
	call crlf

	mov eax, lightmagenta + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[13]
	mov edx, offset lightMagentam
	call writedec
	call writestring
	call crlf

	mov eax, yellow + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[14]
	mov edx, offset yellowm
	call writedec
	call writestring
	call crlf
	
	mov eax, white + (black*16)
	call settextcolor
	mov edx, offset colorLabelmsg
	call writestring
	mov al, colors[15]
	mov edx, offset whitem
	call writedec
	call writestring
	call crlf

	ret	
printResults ENDP

end main