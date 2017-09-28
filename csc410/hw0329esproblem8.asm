   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data
batman byte "batman ", 0
.code
main PROC

call clrscr
mov dl, 20
mov dh, 5
mov ecx, 10 

print:
	call gotoxy
	push edx 
	mov edx, offset batman
	call writestring
	pop edx
	mov eax, 100
	call delay
	call gotoxy
	dec dl
loop print        
         
        exit
	 
main ENDP
 
end main