.MODEL	SMALL
.STACK	100H
.DATA
CR	EQU	0DH
LF	EQU	0AH
.CODE
MAIN	PROC       
	MOV	AX,@DATA
	MOV	DS,AX
                                                
	MOV	BL,80H ;กำหนดตัวเริ่ม
	MOV	CX,10 ;loop 10 times
TOP:
	CMP	BL,0FFH ;ถ้าถึงตัวสุดท้าย
	JE	EXIT
	MOV	AH,2
	MOV	DL,BL
	INT	21H
	MOV	DL,' '
	INT	21H
	DEC	BL
	DEC	CX
	CMP	CX,0
	JE	New_line
	JMP	TOP

New_line:
	MOV	AH,2
	MOV	DL,CR
	INT	21H
	MOV	DL,LF
	INT	21H
	MOV	CX,10
	JMP	TOP
EXIT:
	MOV	AH,4CH
	INT 	21H
MAIN	ENDP
	END MAIN
	