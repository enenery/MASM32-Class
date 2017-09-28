   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data
first dword ?
second dword ?
third dword ?
.code
main PROC
         call randomize
	 
         mov eax, 7
	 call randomrange
	 mov first, eax
	 call writedec
         exit	 
main ENDP
 
end main