;-------------------------------------------------------        
;  object course data for IZMIR 
;  stage 5
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

extrn   s5tan_spr_data1: dword
extrn   s5tan_spr_data2: dword
extrn   s5tan_spr_data3: dword
extrn   s5tan_spr_data4: dword
extrn   s5tan_spr_data5: dword
extrn   s5tan_spr_data6: dword
extrn   s5tan_spr_data7: dword
extrn   s5tan_spr_data8: dword
extrn   s5tan_spr_data9: dword
extrn   s5boss1_spr_data: dword

	ORG 0
OBJ_DATA        label
enemy_type      label   word
object  <1, 0,    0, 2500,,,,,,, 1, 2500, 10,  2, 0, 0, offset s5tan_spr_data1, offset tan_course1, 0, 0,0,0>
; tank5
object  <2, 0, -150, 2500,,,,,,, 1, 2500, 30,  2, 0, 0, offset s5tan_spr_data2, offset tan_course2, 0, 1,0,0>
; plane
object  <3, 0, -150, 2500,,,,,,, 1, 2500, 40,  2, 0, 128, offset s5tan_spr_data3, offset tan_course3, 0, 1,0,0>
; ball in air
object  <4, 0, -200,  150,,,,,,, 1, 2500, 50,  4, 0, 0, offset s5tan_spr_data4, offset tan_course9, 0, 1,0,0>
; big plane
object  <5, 0, -150, 2500,,,,,,, 1, 2500, 20,  2, 0, 128, offset s5tan_spr_data5, offset tan_course5, 0, 1,0,0>
; UFO
object  <6, 0, -250,  150,,,,,,, 1, 2500, 20,  2, 0, 128, offset s5tan_spr_data6, offset tan_course6, 0, 1,0,0>
; UFO
object  <7, 0, -100, 2500,,,,,,, 1, 2500, 30,  3, 0, 128, offset s5tan_spr_data7, offset tan_course7, 0, 1,0,0>
; robot in air
object  <8, 0,    0, 2500,,,,,,, 0, 2500,  0,   7, 0, 128, offset s5tan_spr_data8, offset tan_course8, 0, 0,0,0>
; beam
object  <9, 0, -250,  150,,,,,,, 1, 2500, 30,   2, 0, 128, offset s5tan_spr_data9, offset tan_course9, 0, 1,0,0>
; plane

object  <10, 0,  -10, 2500,,,,,,, 1, 2500,500, 5000, 0, 128, offset s5boss1_spr_data, offset boss_course, 0, 0,0,0>
; boss


;---------------------------------------------------------------------
tan_course1     label   word  ; tank 5
	dw 0,0,0,-5, 1,0,0,-5, 2,0,0,-5
	dw 201,1,0,0
	dw _GOTO
	dd tan_course1

tan_course2     label   word  ; plane 5
	dw 4,0,0,-10, 5,0,0,-10, 6,0,0,-10, 7,0,0,-10
	dw 232,500
	dd conti222,tan_course2,tan_course2
conti222:
	dw 3,0,10,-5, 2,0,10,-5, 1,0,10,-5, 0,0,10,-5
	dw 201,0,0,0
	dw 1,0,10,-5, 2,0,10,-5, 3,0,10,-5
	dw 201,0,0,0
loop222:
	dw 4,0,0,-10, 5,0,0,-10, 6,0,0,-10, 7,0,0,-10
	dw _GOTO
	dd loop222

tan_course3     label   word  ; ball in air
	dw 0,0,0,-5, 1,0,5,-5, 2,0,10,-5
	dw 3,0,15,-5, 4,0,20,-5

	dw 0,0,25,-5, 1,0,20,-5, 2,0,15,-5
	dw 3,0,10,-5, 4,0,5,-5

	dw 0,0,0,-5, 1,0,-5,-5, 2,0,-10,-5
	dw 3,0,-15,-5, 4,0,-20,-5

	dw 0,0,-25,-5, 1,0,-20,-5, 2,0,-15,-5
	dw 3,0,-10,-5, 4,0,-5,-5

	dw _GOTO
	dd tan_course3

tan_course4     label   word  ;
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

tan_course5     label   word  ;  UFO
	dw 0,0,0,-4,    1,0,2,-4,  2,0,5,-4,  3,0,7,-4,  4,0,10,-4
	dw 200,10, 201,1,0,0
	dw 0,0,10,-4, 1,0,7,-4, 2,0,5,-4, 3,0,2,-4, 4,0,0,-4
	dw 0,0,0,-4, 1,0,-2,-4, 2,-0,-5,-4, 3,0,-7,-4, 4,0,-10,-4
	dw 0,0,-10,-4, 1,0,-7,-4, 2,0,-5,-4, 3,0,-2,-4, 4,0,0,-4
	dw _GOTO
	dd tan_course5

tan_course6     label   word  ;   UFO
	dw 0,0,10,50, 1,0,10,50, 2,0,10,50
	dw 4,0,5,50, 5,0,5,50, 6,0,5,50
	dw 7,0,0,60, 8,0,0,60, 9,0,0,60
	dw 10,0,0,50, 11,0,0,50
	dw 201,1,0,0
	dw _GOTO
	dd tan_course6

tan_course7     label   word  ;   robot in air

	dw 234,30
	dd course701,loop700,course703

course701:
	dw 0,-20,0,0
	dw 234,30
	dd course701,conti700,conti700
conti700:
	dw 1,-5,0,0, 2,0,0,-5, 202,3
	dw 4,0,0,-10, 5,0,0,-15, 6,0,0,-20

loop700:
	dw 7,0,0,-25
	dw 232,1000
	dd conti701,conti701,loop700
conti701:
	dw 6,0,0,-20, 5,0,0,-15, 4,0,0,-10
	dw 201,1,0,0
	dw 202,4, 202,4, 202,4
	dw 201,1,0,0
	dw 4,0,0,-5, 5,0,0,-10, 6,0,0,-15
loop701:
	dw 7,0,0,-15
	dw 232,500
	dd conti702,conti702,loop701
conti702:
	dw 6,0,0,-10, 5,0,0,0, 4,0,0,10
	dw 201,1,0,0
	dw 4,0,0,20, 202,4
	dw 201,1,0,0
	dw 202,4, 202,4
	dw 201,1,0,0
	dw 4,0,0,-5, 5,0,0,-10, 6,0,0,-15
	dw 7,0,0,-15, -1
;;
course703:
	dw 0+256,20,0,0
	dw 234,30
	dd conti703,conti703,course703
conti703:
	dw 1+256,-5,0,0, 2+256,0,0,-5, 202,3+256
	dw 4,0,0,-10, 5,0,0,-15, 6,0,0,-20
	dw _GOTO
	dd loop700


tan_course8     label   word  ;   high beam
	dw 0,0,0,0, 1,0,0,0, 2,0,0,0
	dw 3,0,0,0, 4,0,0,0
	dw _GOTO
	dd tan_course8

tan_course9     label   word  ; plane
	dw 0,0,2,80, 200,5, 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80
	dw 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80, 0,0,2,80
	dw 0,0,3,60, 0,0,3,60, 0,0,3,60, 0,0,3,40, 0,0,3,40, 0,0,3,40
	dw 0,0,3,40, 0,0,3,40, 0,0,3,30, 0,0,3,20, 0,0,3,10, 0,0,3,10
	dw 234,5
	dd course902,conti900,conti900
conti900:
	dw 1,10,3,10, 1,10,3,10, 1,10,3,10, 1,10,3,10
	dw 2,20,3,10, 2,20,3,10, 2,20,3,10
	dw 2,20,3,10, 2,20,3,10
	dw 3,30,3,0, 3,30,3,0
	dw 3,30,3,0, 3,30,3,0, 201,0,0,0
	dw 4,20,2,-10, 4,20,2,-10, 200,10,  201,0,0,0
	dw 4,20,2,-10, 4,20,2,-10, 4,20,2,-10
	dw 5,10,2,-10, 5,10,2,-10, 5,5,3,-15, 5,5,4,-15, 201,0,0,0
	dw _GOTO
	dd conti901
course902:
	dw 1+256,-10,3,10, 1+256,-10,3,10, 1+256,-10,3,10, 1+256,-10,3,10
	dw 2+256,-20,3,10, 2+256,-20,3,10, 2+256,-20,3,10
	dw 2+256,-20,3,10, 2+256,-20,3,10
	dw 3+256,-30,3,0, 3+256,-30,3,0
	dw 3+256,-30,3,0, 3+256,-30,3,0, 201,0,0,0
	dw 4+256,-20,2,-10, 4+256,-20,2,-10, 200,10,  201,0,0,0
	dw 4+256,-20,2,-10, 4+256,-20,2,-10, 4+256,-20,2,-10
	dw 5+256,-10,2,-10, 5+256,-10,2,-10, 5+256,-5,3,-15, 5+256,-5,4,-15, 201,0,0,0
conti901:
	dw 6,0,5,-20, 6,0,0,-30, -1


;;BOSS;;
boss_course     label   word  ;
	dw 0,0,0,-15, 1,0,0,-15, 2,0,0,-15, 3,0,0,-15
	dw 201,1,-60,-120
	dw 201,1, 60,-120
	dw 4,0,0,-15, 5,0,0,-15, 6,0,0,-15, 7,0,0,-15
	dw 8,0,0,-15, 9,0,0,-15
	dw 232,1000
	dd contib1,contib1,boss_course
contib1:
	dw 0,0,0,10
	dw 1,0,0,10
	dw 2,0,0,10
	dw 201,1,-50,-120
	dw 201,1, 50,-120
	dw 3,0,0,10
	dw 4,0,0,10
	dw 5,0,0,10
check00:dw 232,200
	dd backmove0,backmove0,contib2
contib2:
	dw 6,0,0,20
	dw 7,0,0,20
	dw 8,0,0,20
	dw 9,0,0,20
	dw 233,5000-400
	dd chkd0,chkd0,contib3
contib3:
	dw 6,0,0,20
	dw 7,0,0,20
check01:dw 232,250
	dd backmove0,backmove0,contib1
backmove0:
	dw 0,0,0,30, 1,0,0,30, 2,0,0,30, 3,0,0,30
	dw 201,0,0,-120
	dw 4,0,0,30, 5,0,0,30, 6,0,0,30, 7,0,0,30
	dw 8,0,0,30, 9,0,0,30
	dw 201,0,0,-120
	dw 234,50
	dd left00,check01,right00

left00: dw 210,-25,0,25
	dw _GOTO
	dd check01

right00:dw 210,25,0,25
	dw _GOTO
	dd check01

bossdown:
	dw 10,0,0,0
	dw 201,1,-60,-120
	dw 11,0,0,0, 12,0,0,0, 13,0,0,0, 14,0,0,0
	dw 201,1, 60,-120
	dw 15,0,0,0, 16,0,0,0, 17,0,0,0, 18,0,0,0
	dw 19,0,0,0
	dw _GOTO
	dd chkd1
chkd0:
	dw 9,0,0,0
	dw 205,1,-50,-30
	dw 205,1,50,-50
	dw 205,1,-5,-25
	dw 205,1,-5,-15
	dw 10,0,25,10
	dw 11,0,25,20
chkd1:
	dw 232,1000
	dd contid1,contid1,bossdown
contid1:
	dw 12,0,0,10
	dw 201,1,-50,-120
	dw 13,0,0,20
	dw 14,0,0,10
	dw 201,1, 50,-120
	dw 232,250
	dd backmove1,backmove1,contid2
contid2:
	dw 15,0,0,10, 16,0,0,20
	dw 17,0,0,10, 18,0,0,10
	dw 233,5000-500
	dd bosskill,bosskill,contid3
contid3:
	dw 19,0,0,10
check001:dw 232,200
	dd backmove1,backmove1,contid1
backmove1:
	dw 201,0,0,-120
	dw 205,1,0,-80
	dw 11,0,0,40, 12,0,0,40, 13,0,0,40, 14,0,0,40, 15,0,0,40
	dw 201,0,0,-120
	dw 16,0,0,40, 17,0,0,40, 18,0,0,40, 19,0,0,40
	dw 201,0,0,-120
	dw 234,50
	dd left01,check001,right01

left01: dw 210,-25,0,20
	dw _GOTO
	dd check001

right01:dw 210,25,0,20
	dw _GOTO
	dd check001


bosskill:
	dw 205,1,0,-90
	dw 205,1,30,-90
	dw 11,0,0,10, 11,0,0,10
	dw 205,1,0,0
	dw 12,0,0,20, 12,0,0,20
	dw 13,0,0,20, 13,0,0,20
	dw 14,0,0,20, 14,0,0,20
	dw 15,0,0,20, 15,0,0,20
	dw 205,1,-40,-80
	dw 15,0,0,20
	dw 205,1,60,-80
	dw 16,0,0,20
	dw 205,1,-60,-180
	dw 16,0,0,20
	dw 205,1,-60,-120
	dw 17,0,0,20
	dw 205,1,-40,-80
	dw 18,0,0,20
	dw 205,1,80,-80
	dw 19,0,0,20
	dw 205,1,-80,-80
	dw 19,0,0,20
	dw 205,1,-60,-160
	dw 205,1,40,-80
	dw 19,0,0,20
	dw 205,1,60,-80
	dw 205,1,-60,-180
	dw 205,1,-60,-120
	dw 19,0,0,20
	dw 205,1,20,-120
	dw 205,1,60,0
	dw 19,0,0,20
	dw 205,1,-60,-80
	dw 205,1,0,-80

	dw 209


_data   ends
	END
