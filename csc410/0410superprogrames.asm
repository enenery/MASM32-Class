   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data
myword byte "Hola ", 0
len dword lengthof myword
.code
main PROC
call clrscr

mov dl, 5
mov dh, 10
mov esi, 0
mov ecx, len
call gotoxy
print:
mov al, myword[esi]
call writechar
mov eax, 100
call delay
inc esi       
loop print       
        exit
	 
main ENDP
 
end main