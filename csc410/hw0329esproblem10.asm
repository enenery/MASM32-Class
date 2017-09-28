   TITLE randomrange         (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data
x1 byte 10
x2 byte 40
y1 byte 8
y2 byte 22
deltax dword ?
deltay dword ?
a dword ?
xy dword ?
.code
main PROC

	call clrscr
        call createdeltax
	call createdeltay
	call createxy 
	call randomize
	call randomdrawV

	mov eax, 15
	call settextcolor
	mov ecx, 10
	laurent:
	call crlf
	loop laurent
 	
        exit
	 
main ENDP

createdeltax proc
     movzx eax,x2
     sub   al,x1
     inc eax 
     mov deltax,eax
     ret
createdeltax  endp 

createdeltay proc
     movzx eax,y2
     sub   al,y1
     inc eax 
     mov deltay,eax
     ret
createdeltay  endp         
 
createxy proc

mov ecx, deltay
addloopy:
	mov eax, deltax
	add xy, eax
loop addloopy	
ret
createxy endp 
       
randomdrawV proc

	mov dl, x1
	mov dh, y2		
	mov ecx, 1000
	
loopy:		
	mov eax, deltax ;keeps the range in 0 - deltax
	call randomrange ; automatically random num is sent to eax
	add eax, 10
	mov dl, al
	
	mov eax, deltay
	call randomrange
	add eax, 5
	mov dh, al

	call gotoxy
	
	mov eax, 16
	call randomrange 
	call settextcolor
	
	mov al, '*'
	call writechar

	mov eax, 10
	call delay

	mov dl, x2
	mov dh, y2

loop loopy		
ret
randomdrawV endp


end main
