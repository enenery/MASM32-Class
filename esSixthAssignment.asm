; Floating Point IO Procedures         (floatio.asm)
TITLE esSixthAssignment

; Author: Erii Sugimoto
; Date: 11/22/2016

INCLUDE Irvine32.inc
INCLUDE Floatio.inc

.data
a         REAL8       1.0    
b         REAL8       2.0  
d         REAL8       -8.0  
four      REAL8       -4.0 
.code

main      PROC
          finit        
          fld         a
          fld         d
          fmul
          fld         four
          fmul
          fld         b
          fld         b
          fmul		  
          fadd 
          fsqrt
          fld         b
          fsub
          fld         b
          fld         a
          fmul   
          fdiv 
		  
          call        writeFloat 
          call        crlf
		  
          fld         a
          fld         d
          fmul
          fld         four
          fmul
          fld         b
          fld         b
          fmul			  
          fadd
          fsqrt
          fchs
          fld         b
          fsub
          fld         b
          fld         a
          fmul   
          fdiv 
	
          call        writeFloat
		 
          exit
main      ENDP
          END         main
