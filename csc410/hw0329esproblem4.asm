   TITLE gofromx2tox1anderase         (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data
x1 byte 20
x2 byte 60
y1 byte 5
deltax dword ?
.code
main PROC
        call clrscr
        call createdeltax
	call drawline
        exit
	 
main ENDP


createdeltax proc
     movzx eax,x2
     sub   al,x1
     inc eax 
     mov deltax,eax
     ret
createdeltax  endp 

drawline proc
    mov dl,x2
    mov dh,y1
    mov ecx , deltax
    draw:
      call gotoxy
      mov al,'*'
      call writechar
      mov eax,50
      call delay
      call gotoxy
      mov al,' '
      call writechar
      dec dl
    loop draw
    ret
drawline endp
end main