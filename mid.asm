.MODEL	SMALL
.STACK	100H
.DATA
CR	EQU	0DH ; newline
LF	EQU	0AH ; newline
G1	DB	?,'$' ;เก็บค่าตัวที่ 1
G2	DB	?,'$' ;เก็บค่าตัวที่ 2
G3	DB	?,'$' ;เก็บค่าตัวที่ 3
G4	DB	?,'$' ;เก็บค่าตัวที่ 4
G5	DB	?,'$' ;เก็บค่าตัวที่ 5
GA	DB	0,'$' ;เก็บค่าคำนวนตัวที่ 1
GB	DB	0,'$' ;เก็บค่าคำนวนตัวที่ 2
GC	DB	0,'$' ;เก็บค่าคำนวนตัวที่ 3
GD	DB	0,'$' ;เก็บค่าคำนวนตัวที่ 4
GF	DB	0,'$' ;เก็บค่าคำนวนตัวที่ 5
RG1	DB	'You have grade A : $'
RG2	DB	'You have grade B : $'
RG3	DB	'You have grade C : $'
RG4	DB	'You have grade D : $'
RG5	DB	'You have grade F : $'
MSG1	DB	'Enter your grade: $'
NL1	DB	CR,LF,'$' ;
MSG2	DB	'Thank you for use this program :D $'
.CODE
MAIN	PROC
	MOV	AX,@DATA
	MOV	DS,AX
;print msg
	LEA	DX,MSG1
	MOV	AH,9
	INT	21H
;input1
	MOV	AH,1
	INT	21H
	MOV	G1,AL
;input2
	MOV	AH,1
	INT	21H
	MOV	G2,AL
;input3
	MOV	AH,1
	INT	21H
	MOV	G3,AL
;input4
	MOV	AH,1
	INT	21H
	MOV	G4,AL
;input5
	MOV	AH,1
	INT	21H
	MOV	G5,AL

;condition G1 ตัวที่1
	CMP	G1,'A' ; if G1 = A
	JE	Grade_A
	CMP	G1,'B' ; if G1 = B
	JE	Grade_B
	CMP	G1,'C' ; if G1 = C
	JE	Grade_C
	CMP	G1,'D' ; if G1 = D
	JE	Grade_D
	CMP	G1,'F' ; if G1 = F
	JE	Grade_F
	JMP	R_OUT
	

;count A
Grade_A:
	INC	GA ; +1
	JMP	F_2
;count B
Grade_B:
	INC	GB ; +1
	JMP	F_2
;count C
Grade_C:
	INC 	GC ; +1
	JMP	F_2
;count D
Grade_D:
	INC	GD ; +1
	JMP	F_2
;count F
Grade_F:
	INC	GF ; +1
	JMP	F_2

;condition G2 ตัวที่2
F_2:
	CMP	G2,'A' ; if G2 = A
	JE	Grade_A1
	CMP	G2,'B' ; if G2 = B
	JE	Grade_B1
	CMP	G2,'C' ; if G2 = C
	JE	Grade_C1
	CMP	G2,'D' ; if G2 = D
	JE	Grade_D1
	CMP	G2,'F' ; if G2 = F
	JE	Grade_F1
	JMP	R_OUT


;count A
Grade_A1:
	INC	GA ; +1
	JMP	F_3	
;count B
Grade_B1:
	INC	GB ; +1
	JMP	F_3
;count C
Grade_C1:
	INC	GC ; +1
	JMP	F_3
;count D
Grade_D1:
	INC	GD ;+1
	JMP	F_3
;count F
Grade_F1:
	INC	GF ;+1
	JMP	F_3

;condition G3 ตัวที่3
F_3:
	CMP	G3,'A' ; if G3 = A
	JE	Grade_A2
	CMP	G3,'B' ; if G3 = B
	JE	Grade_B2
	CMP	G3,'C' ; if G3 = C
	JE	Grade_C2
	CMP	G3,'D' ; if G3 = D
	JE	Grade_D2
	CMP	G3,'F' ; if G3 = F
	JE	Grade_F2
	JMP	R_OUT

;count A
Grade_A2:
	INC	GA ;+1
	JMP	F_4	
;count B
Grade_B2:
	INC	GB ;+1
	JMP	F_4
;count C
Grade_C2:
	INC	GC ; +1
	JMP	F_4
;count D
Grade_D2:
	INC	GD ;+1
	JMP	F_4
;count F
Grade_F2:
	INC	GF ;+1
	JMP	F_4

;condition G4 ตัวที่4
F_4:
	CMP	G4,'A' ; if G4 = A
	JE	Grade_A3
	CMP	G4,'B' ; if G4 = B
	JE	Grade_B3
	CMP	G4,'C' ; if G4 = C
	JE	Grade_C3
	CMP	G4,'D' ; if G4 = D
	JE	Grade_D3
	CMP	G4,'F' ; if G4 = F
	JE	Grade_F3
	JMP	R_OUT

;count A
Grade_A3:
	INC	GA ;+1
	JMP	F_5	
;count B
Grade_B3:
	INC	GB ;+1
	JMP	F_5
;count C
Grade_C3:
	INC 	GC
	JMP	F_5
;count D
Grade_D3:
	INC	GD ;+1
	JMP	F_5
;count F
Grade_F3:
	INC	GF ;+1
	JMP	F_5

;condition G5 ตัวที่ 5
F_5:
	CMP	G5,'A' ; if G5 = A
	JE	Grade_A4
	CMP	G5,'B' ; if G5 = B
	JE	Grade_B4
	CMP	G5,'C' ; if G5 = C
	JE	Grade_C4
	CMP	G5,'D' ; if G5 = D
	JE	Grade_D4
	CMP	G5,'F' ; if G5 = F
	JE	Grade_F4
	JMP	R_OUT

;count A
Grade_A4:
	INC	GA ;+1
	JMP	END_count	
;count B
Grade_B4:
	INC	GB ;+1
	JMP	END_count
;count C
Grade_C4:
	INC GC ;+1
	JMP	END_count
;count D
Grade_D4:
	INC	GD ;+1
	JMP	END_count
;count F
Grade_F4:
	INC	GF ;+1
	JMP	END_count

END_count:
;display grade บวก30Hทุกตัวเก็บค่า
	ADD	GA,30H
	ADD	GB,30H
	ADD	GC,30H
	ADD	GD,30H
	ADD	GF,30H

;new line
	LEA	DX,NL1
	MOV	AH,9
	INT	21H

;display grade A
	LEA	DX,RG1
	MOV	AH,9
	INT	21H
	LEA	DX,GA
	MOV	AH,9
	INT	21H

;new line
	LEA	DX,NL1
	MOV	AH,9
	INT	21H	

;display grade B
	LEA	DX,RG2
	MOV	AH,9
	INT	21H
	LEA	DX,GB
	MOV	AH,9
	INT	21H

;new line
	LEA	DX,NL1
	MOV	AH,9
	INT	21H

;display grade C
	LEA	DX,RG3
	MOV	AH,9
	INT	21H	
	LEA	DX,GC
	MOV	AH,9
	INT	21H

;new line
	LEA	DX,NL1
	MOV	AH,9
	INT	21H
	
;display grade D
	LEA	DX,RG4
	MOV	AH,9
	INT	21H
	LEA	DX,GD
	MOV	AH,9
	INT	21H
;new line
	LEA	DX,NL1
	MOV	AH,9
	INT	21H	

;display grade F
	LEA	DX,RG5
	MOV	AH,9
	INT	21H
	LEA	DX,GF
	MOV	AH,9
	INT	21H
;if out or end
R_OUT:
;new line
	LEA	DX,NL1
	MOV	AH,9
	INT	21H
;print msg2
	LEA	DX,MSG2
	MOV	AH,9
	INT	21H
	

;DOS exit
	MOV	AH,4CH
	INT	21H
MAIN	ENDP
	END MAIN