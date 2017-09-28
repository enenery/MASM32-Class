   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data

.code
main PROC  
call clrscr
 call drawline        
        exit
	 
main ENDP

drawline PROC
mov dl, 15
mov dh, 15
mov ecx, 11
loopy:
call gotoxy
mov al, '*'
call writechar
mov eax, 50
call delay
dec dl
loop loopy
ret
drawline ENDP 
end main