.MODEL 	SMALL
.STACK 	100H	
.CODE
MAIN 	PROC
; display
	MOV	AH,2
	MOV	DL,'?'
	INT	21H
; input 1
	MOV 	AH,1
	INT	21H
	MOV	BL,AL
; input 2
	MOV	AH,1
	INT	21H
	MOV	CL,AL
; plus
	ADD	BL,CL
	SUB	BL,30H
;new line
	MOV	AH,2
	MOV	DL,0DH
	INT	21H
	MOV	DL,0AH
	INT	21H
; display
	MOV	AH,2
	MOV	DL,BL
	INT	21H
; retuen to DOS
	MOV	AH,4CH
	INT	21H	
MAIN 	ENDP
	END MAIN