   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data

.code
main PROC
    mov eax, 260  
    shr eax, 4
    mov ax, 0
    mov bx, ax
    call writedec   
        exit
	 
main ENDP
 
end main