Integer tray1
Integer tray2
Integer traydif

Function stack
Motor On
Power High
Speed 50
Accel 30, 30
traydif = 127
Tool 1
Go Origen1
	For tray1 = 0 To 2
		PickS1()
		StackS1()
		PickC1()
		StackC1()
	Next tray1

	For tray2 = 0 To 2
		PickS2()
		StackS2()
		PickC2()
		StackC2()
	Next tray2
Go Origen1

Fend
Function PickS1
	Go TrayOrigin -Z(20 + tray1 * 12) +X(30) +Y(tray1 * 30) /2
	Wait 0.1
	Go TrayOrigin +X(30) +Y(tray1 * 30) /2
	On 8
	Wait 0.1
	Go TrayOrigin -Z(20 + tray1 * 12) +X(30) +Y(tray1 * 30) /2
	Wait 0.1
Fend
Function StackS1
	Go FeedSqr -Z(12 * tray1 + 5) -X(5) -Y(5) /2
	Go FeedSqr -Z(12 * tray1) -X(5) -Y(5) /2
	Off 8
	Wait 0.1
	Go FeedSqr -Z(12 * tray1 + 5) -X(5) -Y(5) /2
	Wait 0.1
Fend
Function PickC1
	Go TrayOrigin -Z(20 + tray1 * 12) +Y(tray1 * 30) /2
	Wait 0.1
	Go TrayOrigin +Y(tray1 * 30) /2
	On 8
	Wait 0.1
	Go TrayOrigin -Z(20 + tray1 * 12) +Y(tray1 * 30) /2
	Wait 0.1
Fend
Function StackC1
	Go FeedSqr -Z(12 * tray1 + 11) -X(5) -Y(5) /2
	Go FeedSqr -Z(12 * tray1 + 6) -X(5) -Y(5) /2
	Off 8
	Wait 0.1
	Go FeedSqr -Z(12 * tray1 + 11) -X(5) -Y(5) /2
	Wait 0.1
Fend
Function PickS2
	Go TrayOrigin -Z(50) +X(30) +Y(tray2 * 30 - traydif) /2
	Wait 0.1
	Go TrayOrigin +X(30) +Y(tray2 * 30 - traydif) /2
	On 8
	Wait 0.1
	Go TrayOrigin -Z(50) +X(30) +Y(tray2 * 30 - traydif) /2
	Wait 0.1
Fend
Function StackS2
	Go FeedSqr -Z(12 * tray2 + 5 + 36) -X(5) -Y(5) /2
	Go FeedSqr -Z(12 * tray2 + 36) -X(5) -Y(5) /2
	Off 8
	Wait 0.1
	Go FeedSqr -Z(12 * tray2 + 5 + 36) -X(5) -Y(5) /2
	Wait 0.1
Fend
Function PickC2
	Go TrayOrigin -Z(50) +Y(tray2 * 30 - traydif) /2
	Wait 0.1
	Go TrayOrigin +Y(tray2 * 30 - traydif) /2
	On 8
	Wait 0.1
	Go TrayOrigin -Z(50) +Y(tray2 * 30 - traydif) /2
	Wait 0.1
Fend
Function StackC2
	Go FeedSqr -Z(12 * tray2 + 11 + 36) -X(5) -Y(5) /2
	Go FeedSqr -Z(12 * tray2 + 6 + 36) -X(5) -Y(5) /2
	Off 8
	Wait 0.1
	Go FeedSqr -Z(12 * tray2 + 11 + 36) -X(5) -Y(5) /2
	Wait 0.1
Fend
