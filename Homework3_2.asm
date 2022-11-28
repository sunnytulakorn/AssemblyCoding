.MODEL	SMALL
.STACK 	100H
.CODE
MAIN	PROC
;first condition
	CMP	"A",AX ;
	JE	IF_A ; if AX == "A"
;second condition
	CMP	"B",AX 
	JE	IF_B ; if AX == "B"
	JMP	END_IF
:IF_A
	MOV	AH,2
	MOV	DL,0DH
	INT	21H
	JMP	END_IF
:IF_B	
	MOV	AH,2
	MOV	DL,0AH
	INT	21H	
:END_IF
