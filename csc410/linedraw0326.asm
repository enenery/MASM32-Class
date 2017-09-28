  title draw a line          (LINEDRAW.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data
   ;we need a start and end for x for draw a line across the screen
   x1 byte 7  ; xs or xstart 
   x2 byte 30 ; xe or xend
   y1 byte 5;  5 down
   myword byte " batman",0
   deltax dword ?
.code
main PROC
       call clrscr ; clears the screen
       call createdeltax
       call drawline  
       call moveword
       exit
	 
main ENDP
 
createdeltax proc
     ;  x2-x1+1
     movzx eax,x2
     sub   al,x1
     inc eax 
     mov deltax,eax
     ret
createdeltax  endp

drawline proc
    mov dl,x1
    mov dh,y1
    mov ecx , deltax
    draw:
      call gotoxy
      mov al,'*'
      call writechar
      mov eax,100
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
    inc y1
    mov dh,y1
     
    mov ecx , deltax
    draw1:
       call gotoxy
      push edx
      mov edx,offset myword
      call writestring
    pop edx
      mov eax,100
      call delay
      call gotoxy
    ; mov al,' '
    ;  call writechar
      inc dl
    loop draw1
    ret
moveword endp
 
end main