TITLE esSecondAssignment          

; Author: Erii Sugimoto 
; Date: 09/22/2016

INCLUDE Irvine32.inc

.data

prompt          BYTE             "Enter a string: ",0
message         BYTE             "You entered: ",0 
response        BYTE             20 DUP (0)

.code

strqry          PROC
                push             ebp
                mov              ebp, esp
                
                push             edx            
                push             ecx

                mov              edx, [ebp+8]
                call             writeString

                mov              edx, offset response
                mov              ecx, sizeof response
                call             readString

                mov              eax, offset response

                pop              ecx
                pop              edx
                pop              ebp

                ret              4

strqry          ENDP

main            PROC 

                push             offset  prompt
                call             strqry

                mov              edx, offset message
		call             writeString

                mov              edx, eax
                call             writeString

               mov al, 3
               cmp al, 0
               jz   L
L: call writechar
   
        	exit
	 
main            ENDP

		END	 	 main