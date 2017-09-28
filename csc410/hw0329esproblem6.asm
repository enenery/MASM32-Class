   TITLE goupdown         (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data
x1 byte 5
x2 byte 80
y1 byte 0
y2 byte 15
deltax dword ?
deltay dword ?
count dword ?

.code
main PROC
        call clrscr
        call createdeltax
	call createdeltay
	
	call drawupdown
	
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

drawlinedown proc
    
    mov dl,x1
    mov dh,y1
    
    mov ecx , deltay
    drawdown:
      call gotoxy
      mov al,'*'
      call writechar
      mov eax,30
      call delay
      call gotoxy
      mov al,' '
      call writechar
      inc dh
    loop drawdown
    
    ret
drawlinedown endp

drawlineup proc
mov dl, x1
mov dh, y2

mov ecx, deltay
    drawup:
      call gotoxy
      mov al,'*'
      call writechar
      mov eax,30
      call delay
      call gotoxy
      mov al,' '
      call writechar
      dec dh
    loop drawup
sub count, 1
mov ecx, count
ret
drawlineup endp

drawupdown proc
mov ecx, 3
mov count, ecx
loopy:
call drawlinedown
call drawlineup
loop loopy
ret 
drawupdown endp

end main