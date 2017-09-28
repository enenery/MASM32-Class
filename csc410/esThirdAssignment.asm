TITLE esThirdAssignment          

; Author: Erii Sugimoto 
; Date: 09/22/2016

INCLUDE Irvine32.inc

swap            MACRO            a, b
                xor              a, b
                xor              b, a
                xor              a, b
                ENDM

.data

prompt          BYTE             "Enter a string: ",0
message         BYTE             "You entered: ",0 
message2        BYTE             "The length of your string is: ",0
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

strlen          PROC

                push             ebp
                mov              ebp, esp  
              
                push             edx            
                push             ecx  

              
                mov              eax, 0          
                
                mov              ebx, [ebp+8]
                mov              cl, [ebx]                          
                cmp              cl, 0
                jne              L

L:              inc              eax
                inc              ebx
                mov              cl, [ebx]
                cmp              cl, 0
                jne              L

                pop              ecx
                pop              edx
                pop              ebp

                ret              4

strlen          ENDP

strrev          PROC
                
                push             ebp
                mov              ebp, esp  
              
                push             edx            
                push             ecx 
               

                mov              ebx, [ebp+12]
                mov              eax, [ebp+8]
                add              eax, ebx

                swap             ebx, eax
               
                add              ebx, 4
                sub              eax, 4

                cmp              ebx, eax
                jnae             L

L:              swap             ebx, eax
                add              ebx, 4
                sub              eax, 4
                jnae             L

                
                

                pop              ecx
                pop              edx
                pop              ebp
  
                ret              8

strrev          ENDP


main            PROC 

                push             offset  prompt
                call             strqry

                mov              edx, offset message
		call             writeString

                mov              edx, eax
                call             writeString
                
                call             crlf

                push             eax
                call             strlen
                
                mov              edx, offset message2
                call             writeString

                call             writedec

                push             response
                push             eax
                call             strrev
                
   
        	exit
	 
main            ENDP

		END	 	 main