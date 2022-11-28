.MODEL	SMALL
.STACK 	100H
.CODE
MAIN	PROC
;first condition
	CMP	AX,BX ;if AX < BX
	JGE	END_IF ; if AX >= BX
;second condition
	CMP	BX,CX 
	JL	IF_1 ; if BX < CX
	JGE	IF_2 ; if BX >= CX
:IF_1
	MOV	AX,0
	JMP	END_IF	
:IF_2	
	MOV	BX,0	
:END_IF
