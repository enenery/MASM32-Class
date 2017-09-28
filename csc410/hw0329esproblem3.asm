   TITLE move*across          (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data

.code
main PROC
	call clrscr
	mov dl, 0
	mov dh, 0
	call gotoxy
	
	mov ecx, 80
	print:
	mov al, '*'
	call writechar
	mov eax, 100
	call delay
	call gotoxy
	mov al, ' '
	call writechar
	inc dl
	loop print
              
        exit
	 
main ENDP
 
end main