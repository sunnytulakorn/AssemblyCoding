INDEC	PROC
; reads a number in rage -32768 to 32767
; input: none
; output: AX = binary equivalent of number
	PUSH	BX		; save registers used
	PUSH	CX
	PUSH	DX	
; print prompt
@BEGIN:
	MOV	AH, 2
	MOV	DL, '?'
	INT	21H		; print    '?'
; total = 0
	MOV	BX, 0		; BX holds total
; negative = false
	MOV	CX, 0		; CX holds sign
; read a character
	MOV	AH, 1
	INT	21H		; character in AL
; case character of
	CMP	AL, '-'		; minus sign ?
	JE	@MINUS		; yes, set sign
	CMP	AL, '+'		; plus sign
	JE	@PLUS		; yes, get another character
	JMP	@REPEAT2	; start processing characters
@MINUS:
	MOV	CX, 1		; negative = true
@PLUS:
	INT	21H		; read a character
; end_case
@REPEAT2:
; if character is between '0' and '9'
	CMP	AL, '0'		; character >= '0' ?
	JNGE	@NOT_DIGIT	; illegal character
	CMP	AL, '9'		; character <= '9' ?
	JNLE	@NOT_DIGIT	; no, illegal character
; then convert character to a digit
	SUB	AL, 30H		; convert to digit
	MOV	AH, 0
	PUSH	AX		; save on stack
; total = total x 10 + digit
	MOV	AX, 10		; get 10
	MUL	BX		; AX = total x 10
	POP	BX		; retrieve digit
	ADD	BX, AX		; total = total x 10 + digit
; read a character
	MOV	AH,1
	INT	21H
	CMP	AL, 0DH		; carriage return ?
	JNE	@REPEAT2	; no, keep going
; until CR
	MOV	AX, BX		; store number in AX
; if negative
	CMP	CX, 0		; negatvie number
	JE	@EXIT		; no, exit
; then
	NEG	AX		; yes, negate
; end_if
@EXIT:
	POP	DX		; restore registers
	POP	CX
	POP	BX
	RET			; and return
; here if illegal character entered
@NOT_DIGIT:
	MOV	AH, 2		; move cursor to a new line
	MOV	DL, 0DH
	INT	21H
	MOV	DL, 0AH
	INT	21H
	JMP	@BEGIN		; go to beginning
INDEC	ENDP