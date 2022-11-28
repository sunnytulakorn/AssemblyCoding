.MODEL	SMALL
.STACK	100H
.DATA
x1	DB	0,'$' ;keep result condition2
x2	DB	0,'$' ;keep result condition3
x3	DB	0,'$' ; keep result condition4
MSG1	DB	'Input first number: $' ;ข้อความแสดง
MSG2	DB	'Input second number: $' ;ข้อความแสดง
Result1	DB	'Lover 7 <3 $' ;แสดงข้อความเมื่อเข้าเงื่อนไข
Result2	DB	'Why not 7 :( $' ;แสดงข้อความเมื่อไม่เข้าเงื่อนไข
.CODE
MAIN	PROC ;เริ่มโปรแกรม
	MOV	AX,@DATA ;ย้าย@DATAไปAX
	MOV	DS,AX ;ย้ายAXไปDS
;print msg1
	LEA	DX,MSG1 ;DX=MSG1
	MOV	AH,9 ;เรียกใช้AH9
	INT	21H ;เริ่มคำสั่งAH9
;input1
	MOV	AH,1 ;เรียกใช้AH1
	INT	21H ;เริ่มคำสั่งAH1
	MOV	BL,AL ;ย้ายALไปBL
;new line
	MOV	AH,2 ;เรียกใช้AH2
	MOV	DL,0DH ;ย้าย0DHไปDL
	INT	21H ;เริ่มคำสั่งAH2
	MOV	DL,0AH ;ย้าย0AHไปDL
	INT	21H ;เริ่มคำสั่งAH2
;print msg2
	LEA	DX,MSG2 ;DX=MSG2
	MOV	AH,9 ;เรียกใช้AH9
	INT	21H ;เริ่มคำสั่งAH9
;input2
	MOV	AH,1 ;เรียกใช้AH1
	INT	21H ;เริ่มคำสั่งAH1
	MOV	CL,AL ;ย้ายALไปCL
;1st condition if first and second == 7
	CMP	BL,'7' ; if first = 7
	JNE	con_2 ; ถ้าไม่เข้าเงื่อนไขกระโดดไปฟังก์ชั่น con_s
	CMP	CL,'7' ; if second = 7
	JNE	con_2 ;ถ้าไม่เข้าเงื่อนไขกระโดดไปฟังก์ชั่น con_2
	JE	Yes_7 ;ถ้าเข้าเงื่อไขกระโดดไปฟังก์ชั่นYes_7
con_2: ; condition 2 if first + second == 7
	ADD	x1,CL ;บวกCLลงไปในx1
	ADD	x1,BL ;บวกBLลงไปในx1
	SUB	x1,30H ;ลบx1ด้วย30H
	CMP	x1,'7' ;if x1 = 7
	JNE	con_3 ;ถ้าไม่เข้าเงื่อนไขกระโดดไปฟังก์ชั่น con_3
	JE	Yes_7 ;ถ้าเข้าเงื่อไขกระโดดไปฟังก์ชั่นYes_7
	
con_3: ; condition 3 if first - second == 7
	ADD	x2,BL ;บวกBLลงไปในx2
	SUB	x2,CL ;ลบx2ด้วยCL
	ADD	x2,30H ;บวกx2ด้วย30H
	CMP	x2,'7' ;if x2 = 7
	JNE	con_4 ;ถ้าไม่เข้าเงื่อนไขกระโดดไปฟังก์ชั่น con_4
	JE	Yes_7 ;ถ้าเข้าเงื่อไขกระโดดไปฟังก์ชั่นYes_7

con_4: ; condition 4 if second - first == 7 (2,9)
	ADD	x3,BL ;บวกBLลงไปในx3
	SUB	x3,30H ;ลบx3ด้วย30H
	SUB	CL,x3 ;ลบCLด้วยx3
	CMP	CL,'7' ;if CL = 7
	JNE	Not_7 ;ถ้าไม่เข้าเงื่อนไขกระโดดไปฟังก์ชั่น Not_7
	JE	Yes_7 ;ถ้าเข้าเงื่อไขกระโดดไปฟังก์ชั่นYes_7
	
Yes_7: ; if result = 7 condition
;new line
	MOV	AH,2 ;เรียกใช้AH2
	MOV	DL,0DH ;ย้าย0DHไปDL
	INT	21H ;เริ่มคำสั่งAH2
	MOV	DL,0AH ;ย้าย0AHไปDL
	INT	21H ;เริ่มคำสั่งAH2
;show result
	LEA	DX,Result1 ;DX = Result1
	MOV	AH,9 ;เรียกใช้AH9
	INT	21H ;เริ่มคำสั่งAH9
	JMP	END_R ;กระโดดไปฟังก์ชั่น END_R
Not_7: ; if result != 7 condition
;new line
	MOV	AH,2 ;เรียกใช้AH2
	MOV	DL,0DH ;ย้าย0DHไปDL
	INT	21H ;เริ่มคำสั่งAH2
	MOV	DL,0AH ;ย้าย0AHไปDL
	INT	21H ;เริ่มคำสั่งAH2
;show result
	LEA	DX,Result2 ;DX = Result2
	MOV	AH,9 ;เรียกใช้AH9
	INT	21H ;เริ่มคำสั่งAH9
END_R: ;ฟังก์ชั่นจบการทำงาน
;return DOS
	MOV	AH,4CH ;เรียกใช้4CH
	INT	21H ;เริ่มคำสั่ง4CH
MAIN	ENDP ;จบโปรแกรม
	END MAIN

