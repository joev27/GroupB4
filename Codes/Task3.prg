Integer Circ3, Sqrr3, i, Circ1, Sqrr1, h, ns, nc, traydif, a, r
Integer Cir11, Cir12, Cir13
Integer cir21, cir22, cir23
Integer sqr11, sqr12, sqr13
Integer sqr21, sqr22, sqr23
'-------------------------------------------------------------------------------------------------------------------------------------------
Function iotest3
	i = 0
	r = 0
	Go Origen1
	On 8
	Wait 0.5
	If Sw(16) = Off Then
		Print "ERROR:		LOW PRESSURE			"
		Wait Sw(16) = On
	EndIf
	Print "PRESSURE	OK"
	Off 8
	Do While Sw(0) = Off
		If Sw(1) = On Then
			GoTo presscheck
		EndIf
	Loop

	presscheck:
	Xqt pressure
	Do While Sw(7) = Off And Sw(0) = Off
			If Sw(4) = On Then
	        	Halt pressure
	  		Else
				Resume pressure
	  		EndIf
	Loop
	Quit pressure
	
  	Wait Sw(0) = On
  	
  	task3on:
  	Xqt task3
	Do While Sw(0) = On And Sw(2) = Off And Sw(7) = Off And Sw(1) = Off
	  		If Sw(4) = On Then
	        	Halt task3
	  		Else
				Resume task3
	  		EndIf
	Loop
  	Quit task3

  	If Sw(7) = On Then
  		GoTo task3off
  	EndIf
  	
  	Xqt reverse
	Do While Sw(0) = On And Sw(2) = On And Sw(7) = Off And Sw(1) = Off
	  		If Sw(4) = On Then
	        	Halt reverse
	  		Else
				Resume reverse
	  		EndIf
	Loop
	Quit reverse

	If Sw(0) = On And Sw(7) = Off And Sw(1) = Off Then
		GoTo task3on
	EndIf

  	If Sw(7) = On Then
  		GoTo task3off
  	EndIf
  	
	task3off:
	Quit task3
	Quit reverse
	Quit pressure
  	Off 8
  	Wait 5
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
		Print "End"
  	Go Origen1

Fend
'---------------------------------------------------|		 PRESSURE		|----------------------------------------------------------------
Function pressure
Tool 1
	Go TrayOrigin -Z(20) /2
	Go TrayOrigin /2
	Wait 0.1
	On 8
	Wait 0.5
	Cir11 = Sw(17)
	Wait 0.5
	Off 8
	Wait 0.1
	Go TrayOrigin -Z(20) /2
	
	Go TrayOrigin +Y(30) -Z(20) /2
	Go TrayOrigin +Y(30) /2
	Wait 0.1
	On 8
	Wait 0.5
	Cir12 = Sw(17)
	Wait 0.5
	Off 8
	Wait 0.1
	Go TrayOrigin +Y(30) -Z(20) /2
	
	Go TrayOrigin +Y(60) -Z(20) /2
	Go TrayOrigin +Y(60) /2
	Wait 0.1
	On 8
	Wait 0.5
	Cir13 = Sw(17)
	Wait 0.5
	Off 8
	Wait 0.1
	Go TrayOrigin +Y(60) -Z(20) /2
	
	Go TrayOrigin +X(30) -Z(20) /2
	Go TrayOrigin +X(30) /2
	Wait 0.1
	On 8
	Wait 0.5
	sqr11 = Sw(17)
	Wait 0.5
	Off 8
	Wait 0.1
	Go TrayOrigin +X(30) -Z(20) /2
	
	Go TrayOrigin +X(30) +Y(30) -Z(20) /2
	Go TrayOrigin +X(30) +Y(30) /2
	Wait 0.1
	On 8
	Wait 0.5
	sqr12 = Sw(17)
	Wait 0.5
	Off 8
	Wait 0.1
	Go TrayOrigin +X(30) +Y(30) -Z(20) /2
	
	Go TrayOrigin +X(30) +Y(60) -Z(20) /2
	Go TrayOrigin +X(30) +Y(60) /2
	Wait 0.1
	On 8
	Wait 0.5
	sqr13 = Sw(17)
	Wait 0.5
	Off 8
	Wait 0.1
	Go TrayOrigin +X(30) +Y(60) -Z(20) /2
	
	Go placecir30 -Z(20) /1
	Go placecir30 /1
	Wait 0.1
	On 8
	Wait 0.5
	cir21 = Sw(17)
	Wait 0.5
	Off 8
	Wait 0.1
	Go placecir30 -Z(20) /1
	
	Go placecir30 +Y(30) -Z(20) /1
	Go placecir30 +Y(30) /1
	Wait 0.1
	On 8
	Wait 0.5
	cir22 = Sw(17)
	Wait 0.5
	Off 8
	Wait 0.1
	Go placecir30 +Y(30) -Z(20) /1
	
	Go placecir30 +Y(60) -Z(20) /1
	Go placecir30 +Y(60) /1
	Wait 0.1
	On 8
	Wait 0.5
	cir23 = Sw(17)
	Wait 0.5
	Off 8
	Wait 0.1
	Go placecir30 +Y(60) -Z(20) /1
		
	Go placesqr30 -Z(20) /1
	Go placesqr30 /1
	Wait 0.1
	On 8
	Wait 0.5
	sqr21 = Sw(17)
	Wait 0.5
	Off 8
	Wait 0.1
	Go placesqr30 -Z(20) /1

	Go placesqr30 +Y(30) -Z(20) /1
	Go placesqr30 +Y(30) /1
	Wait 0.1
	On 8
	Wait 0.5
	sqr22 = Sw(17)
	Wait 0.5
	Off 8
	Wait 0.1
	Go placesqr30 +Y(30) -Z(20) /1
	
	Go placesqr30 +Y(60) -Z(20) /1
	Go placesqr30 +Y(60) /1
	Wait 0.1
	On 8
	Wait 0.5
	sqr23 = Sw(17)
	Wait 0.5
	Off 8
	Wait 0.1
	Go placesqr30 +Y(60) -Z(20) /1
	
	Print "tray 1:"
	Print "C:	", Cir11, "	", Cir12, "	", Cir13
	Print "S:	", sqr11, "	", sqr12, "	", sqr13
	
	Print "tray 2:"
	Print "C:	", cir21, "	", cir22, "	", cir23
	Print "S:	", sqr21, "	", sqr22, "	", sqr23
	
Fend
'---------------------------------------------------|		  TASK 3		|----------------------------------------------------------------
Function task3
'Motor On
'Power High
'Speed 30
'Accel 30, 30
'SpeedS 500
'AccelS 5000

h = 6					'height of tokens
ns = 6					'amount of rectangular tokens
nc = 6					'amount of circular tokens
traydif = 127			'distance between tray origins

ns = ns - sqr11 - sqr12 - sqr13 - sqr21 - sqr22 - sqr23
nc = nc - Cir11 - Cir12 - Cir12 - cir21 - cir22 - cir23

Tool 1
	If i <> 0 Then
	
	Else
		If r = 0 Then
		Go Origen1
		EndIf
	EndIf
	'r = 1
	Print "cir1: ", Cir11, Cir12, Cir13
	Print "cir3: ", cir21, cir22, cir23
	Print "sqr1: ", sqr11, sqr12, sqr13
	Print "sqr1: ", sqr21, sqr22, sqr23
	For Sqrr3 = 0 To 2 'step 1-9
		If i = 0 Or i = 3 Or i = 6 Then
			If sqr23 = 1 Then
				If sqr22 = 1 Then
					If sqr21 = 1 Then			'1 1 1
						Sqrr3 = Sqrr3 + 3
						i = i + 9
						GoTo pickc3
					Else						'0 1 1
						If Sqrr3 = 1 Then
						Sqrr3 = Sqrr3 + 2
						i = i + 6
						GoTo pickc3
						EndIf
					EndIf
				Else						'X 0 1
					If sqr21 = 1 Then			'1 0 1
						If Sqrr3 = 0 Then
						Sqrr3 = Sqrr3 + 1
						i = i + 3
						EndIf
						If Sqrr3 = 2 Then
							Sqrr3 = Sqrr3 + 1
							i = i + 3
							GoTo pickc3
						EndIf
					Else
						If Sqrr3 = 2 Then		'0 0 1
							Sqrr3 = Sqrr3 + 1
							i = i + 3
							GoTo pickc3
						EndIf
					EndIf
				EndIf
			Else
				If sqr22 = 1 Then
					If sqr21 = 1 Then			'1 1 0
						Sqrr3 = Sqrr3 + 2
						i = i + 6
					Else						'0 1 0
						If Sqrr3 = 1 Then
						Sqrr3 = Sqrr3 + 1
						i = i + 3
						EndIf
					EndIf
				Else						'X 0 0
					If sqr21 = 1 Then			'1 0 0
						If Sqrr3 = 0 Then
						Sqrr3 = Sqrr3 + 1
						i = i + 3
						EndIf
					Else						'0 0 0

					EndIf
				EndIf
			EndIf
        	FeedS1()
        EndIf
        If i = 1 Or i = 4 Or i = 7 Then
			FixS1()
		EndIf
		If i = 2 Or i = 5 Or i = 8 Then
        	If a = 0 Then
				FixS1()
			EndIf
			PlaceS3()
		EndIf
	Next Sqrr3
	
	pickc3:
	For Circ3 = 0 To 2 'step 10-18
		If i = 9 Or i = 12 Or i = 15 Then
			If cir23 = 1 Then
				If cir22 = 1 Then
					If cir21 = 1 Then			'1 1 1
						Circ3 = Circ3 + 3
						i = i + 9
						GoTo picks1
					Else						'0 1 1
						If Circ3 = 1 Then
						Circ3 = Circ3 + 2
						i = i + 6
						GoTo picks1
						EndIf
					EndIf
				Else						'X 0 1
					If cir21 = 1 Then			'1 0 1
						If Circ3 = 0 Then
						Circ3 = Circ3 + 1
						i = i + 3
						EndIf
						If Circ3 = 2 Then
							Circ3 = Circ3 + 1
							i = i + 3
							GoTo picks1
						EndIf
					Else
						If Circ3 = 2 Then		'0 0 1
							Circ3 = Circ3 + 1
							i = i + 3
							GoTo picks1
						EndIf
					EndIf
				EndIf
			Else
				If cir22 = 1 Then
					If cir21 = 1 Then			'1 1 0
						Circ3 = Circ3 + 2
						i = i + 6
					Else						'0 1 0
						If Circ3 = 1 Then
						Circ3 = Circ3 + 1
						i = i + 3
						EndIf
					EndIf
				Else						'X 0 0
					If cir21 = 1 Then			'1 0 0
						If Circ3 = 0 Then
						Circ3 = Circ3 + 1
						i = i + 3
						EndIf
					Else						'0 0 0

					EndIf
				EndIf
			EndIf
			FeedC1()
		EndIf
		If i = 10 Or i = 13 Or i = 16 Then
			FixC1()
		EndIf
		If i = 11 Or i = 14 Or i = 17 Then
			If a = 0 Then
				FixC1()
			EndIf
			PlaceC3()
		EndIf
	Next Circ3
	
	picks1:
	For Sqrr1 = 0 To 2 'step 19-27	
		If i = 18 Or i = 21 Or i = 24 Then
			If sqr13 = 1 Then
				If sqr12 = 1 Then
					If sqr11 = 1 Then			'1 1 1
						Sqrr1 = Sqrr1 + 3
						i = i + 9
						GoTo pickc1
					Else						'0 1 1
						If Sqrr1 = 1 Then
						Sqrr1 = Sqrr1 + 2
						i = i + 6
						GoTo pickc1
						EndIf
					EndIf
				Else						'X 0 1
					If sqr11 = 1 Then			'1 0 1
						If Sqrr1 = 0 Then
						Sqrr1 = Sqrr1 + 1
						i = i + 3
						EndIf
						If Sqrr1 = 2 Then
							Sqrr1 = Sqrr1 + 1
							i = i + 3
							GoTo pickc1
						EndIf
					Else
						If Sqrr1 = 2 Then		'0 0 1
							Sqrr1 = Sqrr1 + 1
							i = i + 3
							GoTo pickc1
						EndIf
					EndIf
				EndIf
			Else
				If sqr12 = 1 Then
					If sqr11 = 1 Then			'1 1 0
						Sqrr1 = Sqrr1 + 2
						i = i + 6
					Else						'0 1 0
						If Sqrr1 = 1 Then
						Sqrr1 = Sqrr1 + 1
						i = i + 3
						EndIf
					EndIf
				Else						'X 0 0
					If sqr11 = 1 Then			'1 0 0
						If Sqrr1 = 0 Then
						Sqrr1 = Sqrr1 + 1
						i = i + 3
						EndIf
					Else						'0 0 0

					EndIf
				EndIf
			EndIf
        	FeedS1()
        EndIf
        If i = 19 Or i = 22 Or i = 25 Then
			FixS1()
		EndIf
		If i = 20 Or i = 23 Or i = 26 Then
        	If a = 0 Then
				FixS1()
			EndIf
			PlaceS1()
		EndIf
	Next Sqrr1
	
	pickc1:
	For Circ1 = 0 To 2 'step 28-36
		If i = 27 Or i = 30 Or i = 33 Then
				If Cir13 = 1 Then
					If Cir12 = 1 Then
						If Cir11 = 1 Then			'1 1 1
							Circ1 = Circ1 + 3
							i = i + 9
							GoTo final
						Else						'0 1 1
							If Circ1 = 1 Then
							Circ1 = Circ1 + 2
							i = i + 6
							GoTo final
							EndIf
						EndIf
					Else						'X 0 1
						If Cir11 = 1 Then			'1 0 1
							If Circ1 = 0 Then
							Circ1 = Circ1 + 1
							i = i + 3
							EndIf
							If Circ1 = 2 Then
								Circ1 = Circ1 + 1
								i = i + 3
								GoTo final
							EndIf
						Else
							If Circ1 = 2 Then		'0 0 1
								Circ1 = Circ1 + 1
								i = i + 3
								GoTo final
							EndIf
						EndIf
					EndIf
				Else
					If Cir12 = 1 Then
						If Cir11 = 1 Then			'1 1 0
							Circ1 = Circ1 + 2
							i = i + 6
						Else						'0 1 0
							If Circ1 = 1 Then
							Circ1 = Circ1 + 1
							i = i + 3
							EndIf
						EndIf
					Else						'X 0 0
						If Cir11 = 1 Then			'1 0 0
							If Circ1 = 0 Then
							Circ1 = Circ1 + 1
							i = i + 3
							EndIf
						Else						'0 0 0
	
						EndIf
					EndIf
				EndIf
			FeedC1()
		EndIf
		If i = 28 Or i = 31 Or i = 34 Then
			FixC1()
		EndIf
		If i = 29 Or i = 32 Or i = 35 Then
			If a = 0 Then
				FixC1()
			EndIf
			PlaceC1()
		EndIf
	Next Circ1
	final:
	If i = 36 Then
	Go Origen1
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
	EndIf
Fend
'-------------------------------------------------------------------------------------------------------------------------------------------
Function PlaceC3
    Go placecir30 -Z(20) +Y(Circ3 * 30) /1
	Wait 0.5
    Go placecir30 +Y(Circ3 * 30) /1
	Off 8
    Go placecir30 -Z(20) +Y(Circ3 * 30) /1
    i = i + 1
    Print i
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function PlaceS3
    Go placesqr30 -Z(20) +Y(Sqrr3 * 30) /1
	Wait 0.5
    Go placesqr30 +Y(Sqrr3 * 30) /1
	Off 8
	Go placesqr30 -Z(20) +Y(Sqrr3 * 30) /1
    i = i + 1
    Print i
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function FeedC1
    Go FeedCir -Z(50) /2
	Wait 0.5
	On 8
	Do While Sw(17) = 0
	Go Here -Z(2)
	Loop
	i = i + 1
	Wait 0.2
    Go FeedCir -Z((nc - Circ3 - Circ1 - 1) * h + 15) -X(10) /2
	Wait 0.5
	Print (i)
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function FixC1
    a = 0
    Go FixCir -Z(15) /2
    Go FixCir -Z(5) -X(10) /2
	Wait 0.5
	Off 8
	i = i + 1
	Print (i)
	Go FixCir -Z(15) -X(10) /2
	Wait 0.5
    On 10
    a = 1
    Wait 0.5
    Off 10
    Go FixCir -Z(10) /2
    Go FixCir +Z(3) /2
	On 8
    Go FixCir -Z(20) /2
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function PlaceC1
    Go TrayOrigin -Z(20) +Y(Circ1 * 30) /2
	Wait 0.5
    Go TrayOrigin +Y(Circ1 * 30) /2
	Off 8
    Go TrayOrigin -Z(20) +Y(Circ1 * 30) /2
	i = i + 1
	Print (i)
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function FeedS1
    Go FeedSqr -Z(55) /2
	Wait 0.5
	On 8
	Do While Sw(17) = 0
	Go Here -Z(2)
	Loop
	i = i + 1
	Wait 0.2
    Go FeedSqr -Z(55) /2
	Wait 0.5
	Print (i)
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function FixS1
    a = 0
    Go FixSqr3 -Z(15) -Y(5) /2
    Go FixSqr3 -Z(5) -X(10) -Y(5) /2
	Wait 0.5
	Off 8
	i = i + 1
	Print (i)
	Go FixSqr3 +X(5) +Y(5) -Z(10) /2
	Wait 0.5
    On 9
    a = 1
    Wait 0.5
	Off 9
    Go FixSqr3 -Z(10) /2
    Go FixSqr3 +Z(3) /2
	On 8
    Go FixSqr3 -Z(20) /2
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function PlaceS1
    Go TrayOrigin -Z(20) +X(30) +Y(Sqrr1 * 30) /2
	Wait 0.5
    Go TrayOrigin +X(30) +Y(Sqrr1 * 30) /2
	Off 8
	Go TrayOrigin -Z(20) +X(30) +Y(Sqrr1 * 30) /2
	i = i + 1
	Print (i)
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
'---------------------------------------------------|		  REVERSE		|----------------------------------------------------------------
Function reverse
'Motor On
'Power High
'Speed 30
'Accel 30, 30
'SpeedS 500
'AccelS 5000

h = 6					'height of tokens
ns = 6					'amount of rectangular tokens
nc = 6					'amount of circular tokens
traydif = 110			'distance between tray origins
r = r + 1
Tool 1
reverseon:
If i <= 9 Then		'reverse for rectangular token on tray 2
	If Sqrr3 = 3 Then
		Sqrr3 = Sqrr3 - 1
	EndIf
	For Sqrr3 = 2 To 0 Step -1
	If i = 1 Or i = 4 Or i = 7 Then
		revsqrfeed()
	EndIf
	If i = 2 Or i = 5 Or i = 8 Then
		revsqrfix()
	EndIf
	If i = 3 Or i = 6 Or i = 9 Then
		revsqrplace3()
	EndIf
	Next
EndIf
If i <= 18 Then 	'reverse for circular token on tray 2
	If Circ3 = 3 Then
		Circ3 = Circ3 - 1
	EndIf
	For Circ3 = 2 To 0 Step -1
	If i = 10 Or i = 13 Or i = 16 Then
		revcircfeed()
    EndIf
    If i = 11 Or i = 14 Or i = 17 Then
		revcircfix()
    EndIf
    If i = 12 Or i = 15 Or i = 18 Then
		revcircplace3()
	EndIf
	Next
EndIf
If i <= 27 Then 	'reverse for rectangular token on tray 1
    If Sqrr1 = 3 Then
	    Sqrr1 = Sqrr1 - 1
    EndIf
    For Sqrr1 = 2 To 0 Step -1
    If i = 19 Or i = 22 Or i = 25 Then
		revsqrfeed()
    EndIf
    If i = 20 Or i = 23 Or i = 26 Then
		revsqrfix()
    EndIf
    If i = 21 Or i = 24 Or i = 27 Then
		revsqrplace1()
	EndIf
	Next
EndIf
If i <= 36 Then 	'reverse for circular token on tray 1
	If Circ1 = 3 Then
		Circ1 = Circ1 - 1
    EndIf
    For Circ1 = 2 To 0 Step -1
    If i = 28 Or i = 31 Or i = 34 Then
		revcircfeed()
	EndIf
	If i = 29 Or i = 32 Or i = 35 Then
		revcircfix()
	EndIf
	If i = 30 Or i = 33 Or i = 36 Then
		revcircplace1()
	EndIf
	Next
EndIf
GoTo reverseon
Fend
Function revsqrfix
	If a = 1 Then
		Go FixSqr3 -Z(20) /2
		Wait 0.5
	    Go FixSqr3 /2
		On 8
	    Go FixSqr3 -Z(20) /2
		Wait 0.5
	Else
		Go FixSqr3 -X(10) -Y(5) -Z(20) /2
		Wait 0.5
	    Go FixSqr3 -X(10) -Y(5) /2
		On 8
	    Go FixSqr3 -X(10) -Y(5) -Z(20) /2
		Wait 0.5
	EndIf
   	revsqrfeed()
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function revsqrfeed
    Go FeedSqr -Z(55) /2
	Wait 0.5
    Go FeedSqr -Z((ns - Sqrr3 - Sqrr1 - 1) * h) /2
	Off 8
	Wait 0.2
    Go FeedSqr -Z(55) /2
	Wait 0.5
	i = i - 1
	Print (i)
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function revsqrplace3
	Go placesqr30 -Z(20) +Y(Sqrr3 * 30) /1
	Wait 0.5
    Go placesqr30 +Y(Sqrr3 * 30) /1
	On 8
    Go placesqr30 -Z(20) +Y(Sqrr3 * 30) /1
	Wait 0.5
   	revsqrfeed()
    i = i - 2
    Print i
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function revcircfix
	If a = 1 Then
		Go FixCir -Z(20) /2
		Wait 0.5
	    Go FixCir /2
		On 8
	    Go FixCir -Z(20) /2
		Wait 0.5
	Else
		Go FixCir -X(10) -Z(20) /2
		Wait 0.5
	    Go FixCir -X(10) /2
		On 8
	    Go FixCir -X(10) -Z(20) /2
		Wait 0.5
	EndIf
	i = i - 1
   	revcircfeed()
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function revcircfeed
   	Go FeedCir -Z(55) /2
	Wait 0.5
    Go FeedCir -Z((nc - Circ3 - Circ1 - 1) * h) /2
	Off 8
	Wait 0.2
    Go FeedCir -Z(55) /2
	Wait 0.5
	i = i - 1
	Print (i)
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function revcircplace3
	Go placecir30 -Z(20) +Y(Circ3 * 30) /1
	Wait 0.5
    Go placecir30 +Y(Circ3 * 30) /1
	On 8
    Go placecir30 -Z(20) +Y(Circ3 * 30) /1
	Wait 0.5
   	revcircfeed()
    i = i - 2
    Print i
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function revsqrplace1
	Go TrayOrigin +X(30) -Z(20) +Y(Sqrr1 * 30) /2
	Wait 0.5
    Go TrayOrigin +X(30) +Y(Sqrr1 * 30) /2
	On 8
    Go TrayOrigin +X(30) -Z(20) +Y(Sqrr1 * 30) /2
	Wait 0.5
   	revsqrfeed()
    i = i - 2
    Print i
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend
Function revcircplace1
	Go TrayOrigin -Z(20) +Y(Circ1 * 30) /2
	Wait 0.5
    Go TrayOrigin +Y(Circ1 * 30) /2
	On 8
    Go TrayOrigin -Z(20) +Y(Circ1 * 30) /2
	Wait 0.5
   	revcircfeed()
    i = i - 2
    Print i
		Print "Circ3: ", Circ3
		Print "Circ1: ", Circ1
		Print "Sqrr3: ", Sqrr3
		Print "Sqrr1: ", Sqrr1
Fend


