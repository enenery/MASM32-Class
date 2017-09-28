   TITLE drawabox         (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data

x1 byte 5
x2 byte 25
y1 byte 5
y2 byte 12
deltax dword ?
deltay dword ?

.code
main PROC
       
	call clrscr
        call createdeltax
	call createdeltay  
	call drawleftToright 
	call drawDown 
 	call drawrightToleft  
	call drawUp 
	mov ecx, 8
	loopy:
	call crlf
	loop loopy  
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

drawleftToright proc
    mov dl,x1
    mov dh,y1
    mov ecx , deltax
    drawforward:
      call gotoxy
      mov al,'*'
      call writechar
      mov eax,50
      call delay
      inc dl
    loop drawforward
	ret
drawleftToright endp

drawDown proc
    mov dl,x2
    mov dh,y1
    mov ecx , deltay
    drawlinedown:
      call gotoxy
      mov al,'*'
      call writechar
      mov eax,50
      call delay
      inc dh
    loop drawlinedown
	ret
drawDown endp

drawrightToleft proc
    mov dl,x2
    mov dh,y2
    mov ecx , deltax
    drawbackward:
      call gotoxy
      mov al,'*'
      call writechar
      mov eax,100
      call delay
      dec dl
    loop drawbackward
	ret
drawrightToleft endp

drawUp proc
    mov dl,x1
    mov dh,y2
    mov ecx , deltay
    drawlinedown:
      call gotoxy
      mov al,'*'
      call writechar
      mov eax,100
      call delay
      dec dh
    loop drawlinedown
	ret
drawUp endp
 
end main