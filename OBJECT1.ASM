;-------------------------------------------------------        
;  object course data for IZMIR 
;  stage 1
;-------------------------------------------------------
	.386

_GOTO                   equ     230

object  struc

	obj_no          dd      ?       ; 0

	x               dw      ?       ; coordinate
	y               dw      ?       ;
	z               dw      ?       ;

	dlx             dw      ?       ; delta x
	dly             dw      ?       ; delta y
	dlz             dw      ?       ; delta z

	ix              dw      ?       ; interaction
	iy              dw      ?       ;
	iz              dw      ?       ;

	interaction     dw      ?       ;
	z_clip          dw      ?       ;
	sco             dw      ?       ;

	stat            dd      ?       ; status
	spr_no          dd      ?       ; sprite number
	sfactor         dd      ?       ; scale
	spr_data        dd      ?       ; pointer of sprite image data
	course          dd      ?       ; pointer of course

	crea_rt         dd      ?       ; object creation routine
	spr_rt          dd      ?       ; sprite routine
	course_rt       dd      ?       ; course routine
	course_off      dd      ?       ; course offset

object  ends


_data   segment public use32 'DATA'

extrn   tan_spr_data: dword
extrn   tan_spr_data2: dword
extrn   tan_spr_data3: dword
extrn   bull_spr_data: dword
extrn   rock01_spr_data: dword
extrn   rock02_spr_data: dword
extrn   ctw_spr_data: dword
extrn   bos1_spr_data: dword

	ORG 0
OBJ_DATA        label
enemy_type      label   word
object  <1, 0,    0, 2500,,,,,,, 1, 2500, 10,  2, 0, 0, offset tan_spr_data,  offset tan_course0, 0, 0,0,0>
; tank
object  <2, 0, -250, 150, ,,,,,, 1, 2500, 30,  2, 0, 0, offset tan_spr_data2, offset tan_course2, 0, 1,0,0>
; plane R
object  <3, 0, -250, 150, ,,,,,, 1, 2500, 30,  2, 0, 0, offset tan_spr_data2, offset tan_course3, 0, 1,0,0>
; plane L
object  <4, 0, -100, 2500,,,,,,, 1, 2500, 20,  2, 0, 0, offset tan_spr_data3, offset tan_course1, 0, 1,0,0>
; UFO  1
object  <5, 0, -150, 2500,,,,,,, 1, 2500, 20,  2, 0, 0, offset tan_spr_data3, offset tan_course4, 0, 1,0,0>
; UFO  2
object  <6, 0,    0, 2500,,,,,,, 0, 2500, 0,  2, 0, 0, offset rock01_spr_data, 0, 0, 0,0,0>
; rock 1
object  <7, 0,    0, 2500,,,,,,, 0, 2500, 0,  2, 0, 0, offset rock02_spr_data, 0, 0, 0,0,0>
; rock 2
object  <8, 0,    0, 2500,,,,,,, 0, 2500, 0, 12, 0, 128, offset bull_spr_data, offset bull_course, 0, 0,0,0>
; fire
object  <9, 0,    0, 2500,,,,,,, 1, 2500, 40,  2, 0, 0, offset ctw_spr_data, offset ctw_course, 0, 0,0,0>
; gun tower

object  <10,0, -150, 2500,,,,,,, 1, 2500, 500, 5000, 0, 128, offset bos1_spr_data, offset boss_course1, 0, 1,0,0>
; BOSS

;---------------------------------------------------------------------
bull_course     label   word
	dw 202,0, 200,6, 202,1, 202,2, 202,3, 202,4, 202,5
	dw 202,6, 202,7, 202,8, 202,9, 202,10, 202,7
	dw 202,8, 202,7, 202,8, 202,7, 202,8, 202,7
	dw 202,8, 202,7, 202,8, 202,7, 202,6, 202,5
	dw 202,5, 202,4, 202,3, 202,2, 202,1
	dw _GOTO
	dd bull_course

tan_course0     label   word  ;   tank
	dw 0,5,0,-5,  1,5,0,-5,  2,0,0,-5,  3,5,0,-5,  4,5,0,-5
	dw 0,5,0,-10,  1,5,0,-10,  2,0,0,-10,  3,5,0,-10,  4,5,0,-10
	dw 200,10, 201,1,-15,-40
	dw 0,5,0,-5,  1,5,0,-5,  2,0,0,-5,  3,5,0,-5,  4,5,0,-5
	dw 201,1,-5,-20, 0,-5,0,-5, 1,-5,0,-5,  2,0,0,-5,  3,-5,0,-5,  4,-5,0,-5
	dw 201,1,-5,-20, 0,-5,0,-10, 1,-5,0,-10,  2,0,0,-10,  3,-5,0,-10,  4,-5,0,-10
	dw 0,-5,0,-5, 1,-5,0,-5,  2,0,0,-5,  3,-5,0,-5,  4,-5,0,-5
	dw _GOTO
	dd tan_course0

tan_course1     label   word  ;      UFO
	dw 0,2,0,-4,  1,3,0,-4,  2,5,0,-4,  3,5,0,-4,  4,5,0,-4
	dw 200,10, 201,1,0,0
	dw 0,2,0,-4,  1,5,0,-4,  2,2,0,-4, 3,5,0,-4,  4,2,0,-4
	dw 0,-2,0,-4,  1,-3,0,-4, 2,-5,0,-4, 3,-10,0,-4, 4,-5,0,-4
	dw 0,-5,0,-4, 1,-4,0,-4, 2,-3,0,-4, 3,-2,0,-4, 4,-1,0,-4
	dw _GOTO
	dd tan_course1

tan_course2     label   word
	dw 0,0,2,80, 200,5, 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80
	dw 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80
	dw 0,0,3,60, 0,0,3,60, 0,0,3,60, 0,0,3,40, 0,0,3,40, 0,0,3,40
	dw 0,0,3,40, 0,0,3,40, 0,0,3,30, 0,0,3,20, 0,0,3,10, 0,0,3,10
	dw 1,-10,3,10, 1,-10,3,10, 1,-10,3,10, 1,-10,3,10
	dw 2,-20,3,10, 2,-20,3,10, 2,-20,3,10
	dw 2,-20,3,10, 2,-20,3,10
	dw 3,-30,3,0, 3,-30,3,0
	dw 3,-30,3,0, 3,-30,3,0, 201,0,0,0
	dw 4,-20,2,-10, 4,-20,2,-10, 200,10,  201,0,0,0
	dw 4,-20,2,-10, 4,-20,2,-10, 4,-20,2,-10
	dw 5,-10,2,-10, 5,-10,2,-10, 5,-5,3,-15, 5,-5,4,-15, 201,0,0,0
	dw 6,0,5,-20, 6,0,0,-30, -1

tan_course3     label   word
	dw 0,0,2,80, 200,5, 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80
	dw 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80
	dw 0,0,3,60, 0,0,3,60, 0,0,3,60, 0,0,3,60, 0,0,3,60, 0,0,3,60
	dw 0,0,3,40, 0,0,3,40, 0,0,3,30, 0,0,3,20, 0,0,3,10, 0,0,3,10

	dw 1+256,10,3,10, 1+256,10,3,10, 1+256,10,3,10, 1+256,10,3,10
	dw 2+256,20,3,10, 2+256,20,3,10, 2+256,20,3,10
	dw 2+256,20,3,10, 2+256,20,3,10
	dw 3+256,30,3,0, 3+256,30,3,0
	dw 3+256,30,3,0, 3+256,30,3,0, 201,0,0,0
	dw 4+256,20,2,-10, 4+256,20,2,-10, 200,10,  201,0,0,0
	dw 4+256,20,2,-10, 4+256,20,2,-10, 4+256,20,2,-10
	dw 5+256,10,2,-10, 5+256,10,2,-10, 5+256,5,3,-15, 5+256,5,4,-15

	dw 201,0,0,0
	dw 6,0,5,-20, 6,0,0,-30, -1

tan_course4     label   word  ;  UFO
	dw 0,0,0,-4,    1,0,2,-4,  2,0,5,-4,  3,0,7,-4,  4,0,10,-4
	dw 200,10, 201,1,0,0
	dw 0,0,10,-4, 1,0,7,-4, 2,0,5,-4, 3,0,2,-4, 4,0,0,-4
	dw 0,0,0,-4, 1,0,-2,-4, 2,-0,-5,-4, 3,0,-7,-4, 4,0,-10,-4
	dw 0,0,-10,-4, 1,0,-7,-4, 2,0,-5,-4, 3,0,-2,-4, 4,0,0,-4
	dw _GOTO
	dd tan_course4

ctw_course     label   word  ;  GUN TOWER
	dw 0,0,0,0
check002:
	dw 201,1,0,-30
	dw 234,30
	dd left200,center200,right200

left200:
	dw 235,40
	dd up200,center201,center201
up200:
	dw 202,3
	dw _GOTO
	dd check002
center201:
	dw 202,0
	dw _GOTO
	dd check002

center200:
	dw 235,40
	dd up201,center202,center202
up201:
	dw 202,4
	dw _GOTO
	dd check002
center202:
	dw 202,1
	dw _GOTO
	dd check002

right200:
	dw 235,40
	dd up202,center203,center203
up202:
	dw 202,5
	dw _GOTO
	dd check002
center203:
	dw 202,2
	dw _GOTO
	dd check002

;;;;BOSS;;;;
boss_course1     label   word  ;
	dw 0,0,0,-15, 0,0,0,-15, 1,0,0,-15, 1,0,0,-15, 2,0,0,-15, 2,0,0,-15, 3,0,0,-15, 3,0,0,-15
	dw 201,1,0,20
	dw 4,0,0,-15, 4,0,0,-15, 5,0,0,-15, 5,0,0,-15, 6,0,0,-15, 6,0,0,-15, 7,0,0,-15, 7,0,0,-15
	dw 201,1,0,20
	dw 232,1000
	dd contib1,contib1,boss_course1
contib1:
	dw 0,0,0,10, 0,0,5,10
	dw 201,1,0,20
	dw 1,0,10,10, 1,0,5,10
	dw 201,1,0,20
	dw 2,0,0,10, 2,0,-5,10
	dw 3,0,-10,10, 3,0,-5,10
check00:dw 232,200
	dd backmove,backmove,contib2
contib2:
	dw 4,0,0,20, 4,0,0,20
	dw 201,1,0,20
	dw 5,0,0,20, 5,0,0,20
	dw 233,5000-300
	dd chkd0,chkd0,contib3
contib3:
	dw 6,0,0,20, 6,0,0,20
	dw 201,1,0,20
	dw 7,0,0,20, 7,0,0,20
check01:dw 232,200
	dd backmove,backmove,contib1
backmove:
	dw 0,0,0,40, 0,0,5,40, 1,0,10,40, 1,0,15,40, 2,0,15,40, 2,0,10,40, 3,0,5,40, 3,0,0,40
	dw 201,0,0,20
	dw 205,1,0,0
	dw 4,0,0,40, 4,0,-5,40, 5,0,-10,40, 5,0,-15,40, 6,0,-15,40, 6,0,-10,40, 7,0,-5,40, 7,0,0,40
	dw 201,0,0,20
	dw 0,0,0,40, 0,0,5,40, 1,0,10,40, 1,0,15,40, 2,0,15,40, 2,0,10,40, 3,0,5,40, 3,0,0,40
	dw 201,0,0,20
	dw 4,0,0,40, 4,0,-5,40, 5,0,-10,40, 5,0,-15,40, 6,0,-15,40, 6,0,-10,40, 7,0,-5,40, 7,0,0,40
	dw 234,50
	dd left00,check01,right00

left00: dw 210,-25,0,25
	dw _GOTO
	dd check01

right00:dw 210,25,0,25
	dw _GOTO
	dd check01

bossdown:
	dw 8,0,0,-15, 8,0,0,-15, 9,0,0,-15, 9,0,0,-15, 10,0,0,-15, 10,0,0,-15, 11,0,0,-15, 11,0,0,-15
	dw 201,1,0,20
	dw 12,0,0,-15, 12,0,0,-15, 13,0,0,-15, 13,0,0,-15, 14,0,0,-15, 14,0,0,-15, 15,0,0,-15, 15,0,0,-15
	dw 201,1,0,20
chkd0:
	dw 8,0,0,0
	dw 205,1,0,10
	dw 205,1,10,15
	dw 205,1,-10,25
	dw 232,1000
	dd contid1,contid1,bossdown
contid1:
	dw 8,0,0,10, 8,0,0,10
	dw 201,1,-60,-10
	dw 201,1, 60,-10
	dw 9,0,0,10, 9,0,0,10
	dw 201,1,-60,-10
	dw 201,1, 60,-10
	dw 10,0,0,10, 10,0,0,10
	dw 201,1,-60,-10
	dw 201,1, 60,-10
	dw 11,0,0,10, 11,0,0,10
	dw 201,1,-60,-10
	dw 201,1, 60,-10
	dw 232,200
	dd backmove1,backmove1,contid2
contid2:
	dw 12,0,5,20, 12,0,0,20
	dw 201,1,-60,-10
	dw 201,1, 60,-10
	dw 13,0,0,20, 13,0,-5,20
	dw 233,5000-500
	dd bosskill,bosskill,contid3
contid3:
	dw 14,0,5,20, 14,0,0,20
	dw 15,0,-5,20, 15,0,0,20
check001:dw 232,200
	dd backmove1,backmove1,contid1
backmove1:
	dw 8,0,0,40, 8,0,5,40, 9,0,10,40, 9,0,15,40, 10,0,15,40, 10,0,10,40, 11,0,5,40, 11,0,0,40
	dw 201,1,-60,-10
	dw 201,1, 60,-10
	dw 205,1,0,0
	dw 12,0,0,40, 12,0,-5,40, 13,0,-10,40, 13,0,-15,40, 14,0,-15,40, 14,0,-10,40, 15,0,-5,40, 15,0,0,40
	dw 201,1,-60,-10
	dw 201,1, 60,-10
	dw 8,0,0,40, 8,0,5,40, 9,0,10,40, 9,0,15,40, 10,0,15,40, 10,0,10,40, 11,0,5,40, 11,0,0,40
	dw 201,1,-60,-10
	dw 201,1, 60,-10
	dw 12,0,0,40, 12,0,-5,40, 13,0,-10,40, 13,0,-15,40, 14,0,-15,40, 14,0,-10,40, 15,0,-5,40, 15,0,0,40
	dw 234,50
	dd left01,check001,right01

left01: dw 210,-25,0,25
	dw _GOTO
	dd check001

right01:dw 210,25,0,25
	dw _GOTO
	dd check001


bosskill:
	dw 205,1,0,0
	dw 8,0,0,10, 8,0,5,10
	dw 205,1,-20,10
	dw 9,0,10,10, 9,0,15,10
	dw 205,1, 20,10
	dw 10,0,15,10, 10,0,10,10
	dw 205,1, 30,20
	dw 11,0,5,10, 11,0,0,10
	dw 205,1,-30,20
	dw 12,0,0,20, 12,0,-5,20
	dw 13,0,-10,20, 13,0,-15,20
	dw 14,0,0,20, 14,0,-5,20
	dw 15,0,-10,20, 15,0,-15,20
	dw 205,1,-20,-10
	dw 15,0,5,20
	dw 205,1,30,-10
	dw 15,0,5,20
	dw 205,1,-30,-20
	dw 15,0,5,20
	dw 205,1,-30,-30
	dw 15,0,5,20
	dw 205,1,-20,-10
	dw 15,0,2,20
	dw 205,1,40,-10
	dw 15,0,2,20
	dw 205,1,-40,-20
	dw 15,0,5,20
	dw 205,1,-30,-40
	dw 205,1,20,-10
	dw 15,0,2,20
	dw 205,1,30,-10
	dw 205,1,-30,-20
	dw 205,1,-30,-30
	dw 15,0,1,20
	dw 205,1,20,-50
	dw 205,1,30,0
	dw 15,0,5,20
	dw 205,1,-30,-20
	dw 205,1,0,0

	dw 209

_data   ends
	END
