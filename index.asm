    .ORIG x3000         ;Set starting point
    LD R6, ASCII
    LD R5 NEGASCII
SA  .STRINGZ "Type a number to add "
    LEA R0, SA        ; load the address of the message
    PUTS
    IN                  ;Trap instruction to get user input
    ADD R1, R0, x0      ; move the first integer to R1
    ADD R1, R1, R5      ; convert ASCII number to integer
SB  .STRINGZ "Type another number to add "
    LEA R0, SB        ; load the address of the message
    PUTS
    IN                  ; another "IN"
    ADD R0, R0, R5      ; convert ASCII number to integer 
    ADD R2, R0, R1      ; add the two integers
    ADD R2, R2, R6      ; convert sum to ASCII
SC  .STRINGZ "The Sum is "
    LEA R0, SC
    PUTS
    ADD R0, R2, x0      ; move the sum to R0, to be output
    OUT
SG  .STRINGZ "\n"
    LEA r0, SG
    PUTS
SD  .STRINGZ "Type a number "
    LEA R0, SD        ; load the address of the message
    PUTS
    IN                  ;Trap instruction to get user input
    ADD R1, R0, x0      ; move the first integer to R1
    ADD R1, R1, R5      ; convert ASCII number to integer
SE  .STRINGZ "Type another number to subtract "
    LEA R0, SE        ; load the address of the message
    PUTS
    IN                  ; another "IN"
    ADD R0, R0, R5      ; convert ASCII number to integer
    NOT R0, R0        ; Flip the bits
    ADD R0, R0, #1      ; Complete transition to negative
    ADD R2, R0, R1      ; add the two integers
    ADD R2, R2, R6      ; convert sum to ASCII
SF  .STRINGZ "The subtraction is "
    LEA R0, SF
    PUTS
    ADD R0, R2, x0      ; move the sum to R0, to be output
    OUT
    HALT
ASCII   .FILL x30           ; mask to add to convert to ASCII
NEGASCII .FILL xFFD0         ; negated ASCII maask (-x30)
    .END
    
