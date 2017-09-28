   TITLE delay          (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data
msg byte "I am delayed...", 0
len dword lengthof msg
.code
main PROC

mov esi, 0
mov ecx, len
print: 
mov al, msg[esi] 
call writechar 
inc esi
mov eax, 100
call delay
loop print  

       
         
        exit
	 
main ENDP
 
end main