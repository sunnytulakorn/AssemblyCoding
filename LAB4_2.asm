.MODEL	SMALL
.STACK	100H
.DATA
CR	EQU	0DH
LF	EQU	0AH
H	DB	' HALF-DOLLAR $'
Q	DB	' QUARTER $'
D	DB	' DIME $'
N	DB	' NICKEL $'
P	DB	' PENNY $'
.CODE
MAIN	PROC
	MOV	AX,@DATA
	MOV	DS.AX

LOOP_:
	CALL	INDEC
	CMP	AX,99
	JA	LOOP_
	CMP	AX,0
	JB	LOOP_

	XOR	DX,DX
	MOV	BX,50
	DIV	BX
	PUSH	DX

	CALL 	OUTDEC
	MOV	AH,9
	LEA	DX,H
	INT	21H
	MOV	AH,2
	MOV	DL,0DH
	INT	21H
	MOV	DL,0AH
	INT	21H

	POP	AX
	XOR	DX,DX
	MOV	BX,25
	DIV	BX
	PUSH	DX
	
	CALL	OUTDEC
	MOV	AH,9
	LEA	DX,Q
	INT	21H
	MOV	AH,2
	MOV	DL,0DH
	INT	21H
	MOV	DL,0AH
	INT	21H

	POP	AX
	XOR	DX,DX
	MOV	BX,10
	DIV	BX
	PUSH	DX

	CALL	OUTDEC
	MOV	AH,9
	LEA	DX,D
	INT	21H
	MOV	AH,2
	MOV	DL,0DH
	INT	21H
	MOV	DL,0AH
	INT	21H
	
	POP	AX
	XOR	DX,DX
	MOV	BX,5
	DIV	BX
	PUSH	DX

	CALL	OUTDEC
	MOV	AH,9
	LEA	DX,N
	INT	21H
	MOV	AH,2
	MOV	DL,0DH
	INT	21H
	MOV	DL,0AH
	INT	21H

	POP	AX
	CALL	OUTDEC
	MOV	AH,9
	LEA	DX,P
	INT	21H

	MOV	AH,4CH
	INT	21H

MAIN	ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
	END MAIN

