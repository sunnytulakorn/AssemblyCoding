.MODEL	SMALL
.STACK	100H
.DATA
CR	EQU	0DH ; newline
LF	EQU	0AH ; newline
LFC	DB	5,'$'
G1	DB	?,'$' ;เก็บค่าตัวที่ 1
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
;input
TOP:
	CMP	LFC,0
	JE	END_count
	DEC	LFC ;ลบค่าเพื่อทำloop
	MOV	AH,1
	INT	21H
	MOV	G1,AL
	JMP	CHECK_1
	
CHECK_1:
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
	JMP	R_OUT	;เมื่อกรอกตัวอักษรนอกเหนือ A,B,C,D,F ให้หยุดการทำงานทันที

;count A
Grade_A:
	INC	GA ; +1
	JMP	TOP
;count B
Grade_B:
	INC	GB ; +1
	JMP	TOP
;count C
Grade_C:
	INC 	GC ; +1
	JMP	TOP
;count D
Grade_D:
	INC	GD ; +1
	JMP	TOP
;count F
Grade_F:
	INC	GF ; +1
	JMP	TOP

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