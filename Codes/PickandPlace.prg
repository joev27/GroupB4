Integer Circ, Sqrr, i, h, ns, nc, traydif
Function pickandplace
Motor On
Power High
Speed 100
Accel 30, 30
SpeedS 500
AccelS 5000
Tool 1
h = 6					'height of tokens
ns = 3					'amount of rectangular tokens
nc = 3					'amount of circular tokens
traydif = 127			'distance between tray origins

Go Origen1

	For Sqrr = 0 To 2
        FeedS() 			'pick rectangular token from feeder
		FixS() 				'fix rectangular token
		PlaceS() 			'place token on tray 1

	Next Sqrr

	For Circ = 0 To 2
		FeedC() 			'pick circular token from feeder
		FixC() 				'fix circular token
		PlaceC()			'place token on tray 1

	Next Circ
	
Go Origen1

Fend
Function FeedC
    Go FeedCir -Z(50) /2
	Wait 0.1
	Go FeedCir -Z((nc - Circ - 1) * h) /2
	On 8
	Wait 0.2
    Go FeedCir -Z((nc - Circ - 1) * h + 15) -X(10) /2
	Wait 0.1
	
Fend
Function FixC
		
    Go FixCir -Z(15) /2
    Go FixCir -Z(5) -X(10) /2
	Wait 0.1
    Go FixCir -X(5) /2
    Go FixCir +X(5) /2
	Off 8
	Wait 0.1
    Go FixCir -Z(10) +X(5) /2
	
    Go FixCir -Z(10) /2
    Go FixCir /2
	On 8
    Go FixCir -Z(20) /2
    
Fend
Function PlaceC
    Go TrayOrigin -Z(20) +Y(Circ * 30) /2
	Wait 0.1
    Go TrayOrigin +Y(Circ * 30) /2
	Off 8
    Go TrayOrigin -Z(20) +Y(Circ * 30) /2

Fend
Function FeedS
    Go FeedSqr -Z(50) /2
	Wait 0.1
    Go FeedSqr -Z((ns - Sqrr - 1) * h) /2
	On 8
	Wait 0.2
    Go FeedSqr -Z((ns - Sqrr - 1) * h + 15) -X(10) -Y(5) /2
	Wait 0.1

Fend
Function FixS
		
    Go FixSqr -Z(15) -Y(5) /2
    Go FixSqr -Z(5) -X(10) -Y(5) /2
	Wait 0.1
    Go FixSqr -X(15) -Y(5) /2
    Go FixSqr +X(5) +Y(5) /2
	Off 8
	Wait 0.1
    Go FixSqr +X(5) +Y(5) -Z(10) /2
	
    Go FixSqr -Z(10) /2
    Go FixSqr /2
	On 8
    Go FixSqr -Z(20) /2

Fend
Function PlaceS

    Go TrayOrigin -Z(20) +X(30) +Y(Sqrr * 30) /2
	Wait 0.1
    Go TrayOrigin +X(30) +Y(Sqrr * 30) /2
	Off 8
	Go TrayOrigin -Z(20) +X(30) +Y(Sqrr * 30) /2

Fend

