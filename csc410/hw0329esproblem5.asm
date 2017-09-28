   TITLE *movingforwardandbackwards10times          (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr Erii
INCLUDE Irvine32.inc
.data

x1 byte 5
x2 byte 20
y1 byte 5
deltax dword ?
count dword ?

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
    mov ecx, 11
    mov count, ecx
    print:
    call drawbackandforth  
    loop print
    ret
drawline endp 

drawbackandforth proc

    mov dl,x1
    mov dh,y1
    mov ecx , deltax
    drawforward:
      call gotoxy
      mov al,'*'
      call writechar
      mov eax,30
      call delay
      call gotoxy
      mov al,' '
      call writechar
      inc dl
    loop drawforward

    mov dl,x2
    mov dh,y1
    mov ecx , deltax
    drawbackward:
      call gotoxy
      mov al,'*'
      call writechar
      mov eax,30
      call delay
      call gotoxy
      mov al,' '
      call writechar
      dec dl
    loop drawbackward
    dec count
    mov ecx, count
    ret
drawbackandforth endp
end main