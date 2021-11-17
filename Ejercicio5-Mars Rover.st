!classDefinition: #MarsRoverTest category: 'Mars Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'north south east west marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverTest methodsFor: 'assertions' stamp: 'LD 11/16/2021 19:51:21'!
makeMarsRoverReceive: aStringCommandSet andAssertItsCardinalIs: aCardinal

	marsRover recieveCommandSet: aStringCommandSet.
	
	self assert: marsRover currentCardinal equals: aCardinal.! !

!MarsRoverTest methodsFor: 'assertions' stamp: 'LD 11/16/2021 19:58:16'!
makeMarsRoverReceive: aStringCommandSet andAssertItsCardinalIs: aCardinal andItsPositionIs: aPosition

	self makeMarsRoverReceive: aStringCommandSet  andAssertItsCardinalIs: aCardinal.
	
	self assert: aPosition equals: marsRover currentPosition.! !

!MarsRoverTest methodsFor: 'assertions' stamp: 'LD 11/16/2021 19:46:42'!
makeMarsRoverReceive: aStringCommandSet andAssertItsPositionIs: aPosition

	marsRover recieveCommandSet: aStringCommandSet.

	self assert: aPosition equals: marsRover currentPosition.! !


!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 23:10:25'!
setUp
	
	| startPosition |
	startPosition := (1 @ 1).
	
	north := NorthDirection new.
	south := SouthDirection new.
	east := EastDirection new.
	west := WestDirection new.
	
	marsRover := MarsRover at: startPosition withCardinal: north.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 19:46:42'!
test01WhenMarsRoverReceivesAForwardCommandItMovesForward
	
	self makeMarsRoverReceive: 'f' andAssertItsPositionIs: 1 @ 2. 
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 19:46:42'!
test02WhenMarsRoverReceivesABackwardsCommandItMovesBackwards
	
	self makeMarsRoverReceive: 'b' andAssertItsPositionIs: 1 @ 0. 
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 19:51:00'!
test03WhenMarsRoverReceivesALeftRotationCommandItRotatesToTheLeft
	
	self makeMarsRoverReceive: 'l' andAssertItsCardinalIs: west. 
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 19:51:00'!
test04WhenMarsRoverReceivesARightRotationCommandItRotatesToTheRight

	self makeMarsRoverReceive: 'r' andAssertItsCardinalIs: east. 
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 19:46:42'!
test05WhenMarsRoverReceivesAForwardCommandTwiceItMovesForwardTwice
	
	self makeMarsRoverReceive: 'ff' andAssertItsPositionIs: 1 @ 3. ! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 19:46:42'!
test06WhenMarsRoverReceivesABackwardsCommandTwiceItMovesBackwardsTwice

	self makeMarsRoverReceive: 'bb' andAssertItsPositionIs: 1 @ -1. ! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 19:51:00'!
test07WhenMarsRoverReceivesALeftRotationTwiceCommandItRotatesToTheLeftTwice
	
	self makeMarsRoverReceive: 'll' andAssertItsCardinalIs: south. 
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 19:51:00'!
test08WhenMarsRoverReceivesARightRotationCommandTwiceItRotatesToTheRightTwice
	
	self makeMarsRoverReceive: 'rr' andAssertItsCardinalIs: south. 
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 19:51:00'!
test09WhenMarsRoverReceivesALeftRotationThreeTimesCommandItRotatesToTheLeftThreeTimes
	
	self makeMarsRoverReceive: 'lll' andAssertItsCardinalIs: east. 
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 19:51:00'!
test10WhenMarsRoverReceivesARightRotationCommandThreeTimesItRotatesToTheRightThreeTimes
	
	self makeMarsRoverReceive: 'rrr' andAssertItsCardinalIs: west. ! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 23:13:16'!
test11WhenMarsRoverReceivesALeftRotationCommandMultipleTimesItRotatesToTheLeftMultipleTimes
	
	self makeMarsRoverReceive: 'llll' andAssertItsCardinalIs: north. 
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 23:13:38'!
test12WhenMarsRoverReceivesARightRotationCommandMultipleTimesItRotatesToTheRightMultipleTimes
	
	self makeMarsRoverReceive: 'rrrr' andAssertItsCardinalIs: north. 
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 19:59:28'!
test13WhenMarsRoverReceivesALeftRotationAndAForwardCommandItMovesFollowingTheCommands
	
	self makeMarsRoverReceive: 'lf'  andAssertItsCardinalIs: west  andItsPositionIs: 0 @ 1.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 19:57:49'!
test14WhenMarsRoverReceivesALeftRotationTwiceAndAForwardCommandItMovesFollowingTheCommands
	
	self makeMarsRoverReceive: 'llf'  andAssertItsCardinalIs: south andItsPositionIs: 1 @ 0. 
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 23:17:12'!
test15WhenMarsRoverReceivesALeftRotationTwiceAndABackwardsCommandItMovesFollowingTheCommands

	self makeMarsRoverReceive: 'llb'  andAssertItsCardinalIs: south andItsPositionIs: 1 @ 2. ! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 23:16:03'!
test16WhenMarsRoverReceivesALeftRotationCommandMultipleTimesAndAForwardsCommandItMovesFollowingTheCommands
	
	self makeMarsRoverReceive: 'lllf'  andAssertItsCardinalIs: east andItsPositionIs: 2 @ 1. ! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 23:15:43'!
test17WhenMarsRoverReceivesALeftRotationCommandMultipleTimesAndABackwardsCommandItMovesFollowingTheCommands

	self makeMarsRoverReceive: 'lllb'  andAssertItsCardinalIs: east andItsPositionIs: 0 @ 1. ! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 23:11:53'!
test18WhenMarsRoverReceivesAnUnknownCommandItRaisesAnUnknownCommandException

	self 
		should: [marsRover recieveCommandSet: 'x'.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | self assert: anError messageText equals: MarsRover unknownCommandErrorDescription.].! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LD 11/16/2021 23:11:44'!
test19WhenMarsRoverReceivesAnUnknownCommandAfterReceivingKnownCommandsItAccomplishesThemAndItRaisesAnUnknownCommandExceptionAfterwards
	
	self 
		should: [marsRover recieveCommandSet: 'ffy'.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: MarsRover unknownCommandErrorDescription.
			self assert: (1 @ 3) equals: marsRover currentPosition.
		].! !


!classDefinition: #CardinalDirection category: 'Mars Rover'!
Object subclass: #CardinalDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!CardinalDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:02:17'!
makeMarsRoverMoveBackwards: aMarsRover

	self subclassResponsibility.! !

!CardinalDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:02:07'!
makeMarsRoverMoveForward: aMarsRover

	self subclassResponsibility.! !

!CardinalDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:03:42'!
makeMarsRoverRotateToTheLeft: aMarsRover

	self subclassResponsibility.! !

!CardinalDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:03:27'!
makeMarsRoverRotateToTheRight: aMarsRover

	self subclassResponsibility.! !


!CardinalDirection methodsFor: 'comparing' stamp: 'LD 11/16/2021 20:24:21'!
= anotherCardinal

	^self class = anotherCardinal class.

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalDirection class' category: 'Mars Rover'!
CardinalDirection class
	instanceVariableNames: ''!

!CardinalDirection class methodsFor: 'instance creation' stamp: 'LD 11/16/2021 20:20:34'!
isAbleToInstanceWith: aStringCardinal

	self subclassResponsibility.! !

!CardinalDirection class methodsFor: 'instance creation' stamp: 'LD 11/16/2021 20:22:11'!
with: aStringCardinal

	| subClassAbleToInstance |
	subClassAbleToInstance := self subclasses detect: [:aSubclass | aSubclass isAbleToInstanceWith: aStringCardinal].

	^subClassAbleToInstance new.! !


!classDefinition: #EastDirection category: 'Mars Rover'!
CardinalDirection subclass: #EastDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!EastDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:02:17'!
makeMarsRoverMoveBackwards: aMarsRover

	aMarsRover moveTowardsWest.! !

!EastDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:02:07'!
makeMarsRoverMoveForward: aMarsRover

	aMarsRover moveTowardsEast.! !

!EastDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:03:42'!
makeMarsRoverRotateToTheLeft: aMarsRover

	aMarsRover rotateToCardinal: 'N'.! !

!EastDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:03:27'!
makeMarsRoverRotateToTheRight: aMarsRover

	aMarsRover rotateToCardinal: 'S'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EastDirection class' category: 'Mars Rover'!
EastDirection class
	instanceVariableNames: ''!

!EastDirection class methodsFor: 'instance creation' stamp: 'LD 11/16/2021 20:21:05'!
isAbleToInstanceWith: aStringCardinal

	^aStringCardinal = 'E'.! !


!classDefinition: #NorthDirection category: 'Mars Rover'!
CardinalDirection subclass: #NorthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!NorthDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:02:17'!
makeMarsRoverMoveBackwards: aMarsRover

	aMarsRover moveTowardsSouth.! !

!NorthDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:02:07'!
makeMarsRoverMoveForward: aMarsRover

	aMarsRover moveTowardsNorth.! !

!NorthDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:03:42'!
makeMarsRoverRotateToTheLeft: aMarsRover

	aMarsRover rotateToCardinal: 'O'.! !

!NorthDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:03:27'!
makeMarsRoverRotateToTheRight: aMarsRover

	aMarsRover rotateToCardinal: 'E'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NorthDirection class' category: 'Mars Rover'!
NorthDirection class
	instanceVariableNames: ''!

!NorthDirection class methodsFor: 'instance creation' stamp: 'LD 11/16/2021 20:21:23'!
isAbleToInstanceWith: aStringCardinal

	^aStringCardinal = 'N'.! !


!classDefinition: #SouthDirection category: 'Mars Rover'!
CardinalDirection subclass: #SouthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!SouthDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:02:17'!
makeMarsRoverMoveBackwards: aMarsRover

	aMarsRover moveTowardsNorth.! !

!SouthDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:02:07'!
makeMarsRoverMoveForward: aMarsRover

	aMarsRover moveTowardsSouth.! !

!SouthDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:03:42'!
makeMarsRoverRotateToTheLeft: aMarsRover

	aMarsRover rotateToCardinal: 'E'.! !

!SouthDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:03:27'!
makeMarsRoverRotateToTheRight: aMarsRover

	aMarsRover rotateToCardinal: 'O'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SouthDirection class' category: 'Mars Rover'!
SouthDirection class
	instanceVariableNames: ''!

!SouthDirection class methodsFor: 'instance creation' stamp: 'LD 11/16/2021 20:21:28'!
isAbleToInstanceWith: aStringCardinal

	^aStringCardinal = 'S'.! !


!classDefinition: #WestDirection category: 'Mars Rover'!
CardinalDirection subclass: #WestDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!WestDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:02:17'!
makeMarsRoverMoveBackwards: aMarsRover

	aMarsRover moveTowardsEast.! !

!WestDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:02:07'!
makeMarsRoverMoveForward: aMarsRover

	aMarsRover moveTowardsWest.! !

!WestDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:03:42'!
makeMarsRoverRotateToTheLeft: aMarsRover

	aMarsRover rotateToCardinal: 'S'.! !

!WestDirection methodsFor: 'private' stamp: 'LD 11/16/2021 23:03:27'!
makeMarsRoverRotateToTheRight: aMarsRover

	aMarsRover rotateToCardinal: 'N'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WestDirection class' category: 'Mars Rover'!
WestDirection class
	instanceVariableNames: ''!

!WestDirection class methodsFor: 'instance creation' stamp: 'LD 11/16/2021 20:21:39'!
isAbleToInstanceWith: aStringCardinal

	^aStringCardinal = 'O'.! !


!classDefinition: #MarsRover category: 'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition currentCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'accessing' stamp: 'LD 11/14/2021 17:10:34'!
currentCardinal
	^currentCardinal.! !

!MarsRover methodsFor: 'accessing' stamp: 'LD 11/16/2021 23:06:50'!
currentPosition
	^currentPosition.! !


!MarsRover methodsFor: 'private' stamp: 'LD 11/16/2021 23:17:26'!
accomplishCommand: aCommand
	
	aCommand beAccomplishedBy: self.! !

!MarsRover methodsFor: 'private' stamp: 'LD 11/16/2021 23:02:17'!
moveBackwards

	self currentCardinal makeMarsRoverMoveBackwards: self.! !

!MarsRover methodsFor: 'private' stamp: 'LD 11/16/2021 23:02:07'!
moveForward

	self currentCardinal makeMarsRoverMoveForward: self.! !

!MarsRover methodsFor: 'private' stamp: 'LD 11/16/2021 22:52:24'!
moveTowardsEast

	^self updatePosition: self currentPosition + (1 @ 0).! !

!MarsRover methodsFor: 'private' stamp: 'LD 11/16/2021 22:52:07'!
moveTowardsNorth

	^self updatePosition: self currentPosition + (0 @ 1).! !

!MarsRover methodsFor: 'private' stamp: 'LD 11/16/2021 22:51:43'!
moveTowardsSouth

	^self updatePosition: self currentPosition + (0 @ -1).! !

!MarsRover methodsFor: 'private' stamp: 'LD 11/16/2021 22:51:04'!
moveTowardsWest

	^self updatePosition: self currentPosition + (-1 @ 0).! !

!MarsRover methodsFor: 'private' stamp: 'LD 11/16/2021 20:58:10'!
rotateToCardinal: aStringCardinal

	^self updateCardinal: aStringCardinal.! !

!MarsRover methodsFor: 'private' stamp: 'LD 11/16/2021 23:03:42'!
rotateToTheLeft

	self currentCardinal makeMarsRoverRotateToTheLeft: self.! !

!MarsRover methodsFor: 'private' stamp: 'LD 11/16/2021 23:03:27'!
rotateToTheRight

	self currentCardinal makeMarsRoverRotateToTheRight: self.! !

!MarsRover methodsFor: 'private' stamp: 'LD 11/16/2021 20:22:42'!
updateCardinal: aStringCardinal 

	currentCardinal := CardinalDirection with: aStringCardinal.! !

!MarsRover methodsFor: 'private' stamp: 'LD 11/16/2021 23:06:49'!
updatePosition: aPoint 
	currentPosition := aPoint.! !


!MarsRover methodsFor: 'initialization' stamp: 'LD 11/16/2021 23:07:46'!
initializeWith: aPosition andCardinal: aCardinalDirection

	currentPosition := aPosition.
	currentCardinal  := aCardinalDirection.! !


!MarsRover methodsFor: 'public' stamp: 'LD 11/14/2021 20:33:12'!
recieveCommandSet: aStringCommandSet

	aStringCommandSet do: [:aStringCommand |
		| aCommand |
		aCommand := MarsRoverCommand with: aStringCommand.
		self accomplishCommand: aCommand.

	].	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'error descriptions' stamp: 'LD 11/14/2021 19:19:14'!
unknownCommandErrorDescription
	^'Unknown command'.! !


!MarsRover class methodsFor: 'instance creation' stamp: 'LD 11/16/2021 23:07:22'!
at: aPosition withCardinal: aCardinalDirection

	^self new initializeWith: aPosition andCardinal: aCardinalDirection.! !


!classDefinition: #MarsRoverCommand category: 'Mars Rover'!
Object subclass: #MarsRoverCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverCommand methodsFor: 'private' stamp: 'LD 11/14/2021 20:34:14'!
beAccomplishedBy: aMarsRover

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommand class' category: 'Mars Rover'!
MarsRoverCommand class
	instanceVariableNames: ''!

!MarsRoverCommand class methodsFor: 'instance creation' stamp: 'LD 11/14/2021 20:34:51'!
isAbleToInstanceWith: aStringCommand

	self subclassResponsibility.! !

!MarsRoverCommand class methodsFor: 'instance creation' stamp: 'LD 11/16/2021 22:41:25'!
with: aStringCommand

	| subClassAbleToInstance |
	subClassAbleToInstance := self subclasses detect: [:aSubclass | aSubclass isAbleToInstanceWith: aStringCommand] 
		ifNone: [
			self error: MarsRover unknownCommandErrorDescription.
		].
	
	^subClassAbleToInstance new.! !


!classDefinition: #BackwardsCommand category: 'Mars Rover'!
MarsRoverCommand subclass: #BackwardsCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!BackwardsCommand methodsFor: 'private' stamp: 'LD 11/16/2021 20:30:37'!
beAccomplishedBy: aMarsRover

	"aMarsRover currentCardinal = 'N' ifTrue: [
		^aMarsRover updatePosition: aMarsRover currentPosition + (0 @ -1).
	].
		
	aMarsRover currentCardinal = 'O' ifTrue: [
		^aMarsRover updatePosition: aMarsRover currentPosition + (1 @ 0).
	].
		
	aMarsRover currentCardinal = 'S' ifTrue: [
		^aMarsRover updatePosition: aMarsRover currentPosition + (0 @ 1).
	].	
		
	aMarsRover currentCardinal = 'E' ifTrue: [
		^aMarsRover updatePosition: aMarsRover currentPosition + (-1 @ 0).
	]."

	aMarsRover moveBackwards.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BackwardsCommand class' category: 'Mars Rover'!
BackwardsCommand class
	instanceVariableNames: ''!

!BackwardsCommand class methodsFor: 'instance creation' stamp: 'LD 11/14/2021 20:34:58'!
isAbleToInstanceWith: aStringCommand

	^aStringCommand = $b.! !


!classDefinition: #ForwardCommand category: 'Mars Rover'!
MarsRoverCommand subclass: #ForwardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!ForwardCommand methodsFor: 'private' stamp: 'LD 11/16/2021 20:30:46'!
beAccomplishedBy: aMarsRover
	
	"aMarsRover currentCardinal = 'N' ifTrue: [
		^aMarsRover updatePosition: aMarsRover currentPosition + (0 @ 1).
	].
		
	aMarsRover currentCardinal = 'O' ifTrue: [
		^aMarsRover updatePosition: aMarsRover currentPosition + (-1 @ 0).
	].
		
	aMarsRover currentCardinal = 'S' ifTrue: [
		^aMarsRover updatePosition: aMarsRover currentPosition + (0 @ -1).
	].	
		
	aMarsRover currentCardinal = 'E' ifTrue: [
		^aMarsRover updatePosition: aMarsRover currentPosition + (1 @ 0).
	]."

	aMarsRover moveForward.	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ForwardCommand class' category: 'Mars Rover'!
ForwardCommand class
	instanceVariableNames: ''!

!ForwardCommand class methodsFor: 'instance creation' stamp: 'LD 11/14/2021 20:35:02'!
isAbleToInstanceWith: aStringCommand

	^aStringCommand = $f.! !


!classDefinition: #LeftRotationCommand category: 'Mars Rover'!
MarsRoverCommand subclass: #LeftRotationCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!LeftRotationCommand methodsFor: 'private' stamp: 'LD 11/16/2021 20:30:56'!
beAccomplishedBy: aMarsRover

	"| futureCardinal |
			
	aMarsRover currentCardinal = 'N' ifTrue: [
		futureCardinal := 'O'.
	].
		
	aMarsRover currentCardinal = 'O' ifTrue: [
		futureCardinal := 'S'.
	].
		
	aMarsRover currentCardinal = 'S' ifTrue: [
		futureCardinal := 'E'.
	].
		
	aMarsRover currentCardinal = 'E' ifTrue: [
		futureCardinal := 'N'.
	].
		
	^aMarsRover updateCardinal: futureCardinal."
	
	aMarsRover rotateToTheLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LeftRotationCommand class' category: 'Mars Rover'!
LeftRotationCommand class
	instanceVariableNames: ''!

!LeftRotationCommand class methodsFor: 'instance creation' stamp: 'LD 11/14/2021 20:35:07'!
isAbleToInstanceWith: aStringCommand

	^aStringCommand = $l.! !


!classDefinition: #RightRotationCommand category: 'Mars Rover'!
MarsRoverCommand subclass: #RightRotationCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!RightRotationCommand methodsFor: 'private' stamp: 'LD 11/16/2021 20:31:06'!
beAccomplishedBy: aMarsRover

	"| futureCardinal |
		
	aMarsRover currentCardinal = 'N' ifTrue: [
		futureCardinal := 'E'.
	].
		
	aMarsRover currentCardinal = 'E' ifTrue: [
		futureCardinal := 'S'.
	].
	
	aMarsRover currentCardinal = 'S' ifTrue: [
		futureCardinal := 'O'.
	].
		
	aMarsRover currentCardinal = 'O' ifTrue: [
		futureCardinal := 'N'.
	].
		
	^aMarsRover updateCardinal: futureCardinal."
	
	aMarsRover rotateToTheRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RightRotationCommand class' category: 'Mars Rover'!
RightRotationCommand class
	instanceVariableNames: ''!

!RightRotationCommand class methodsFor: 'instance creation' stamp: 'LD 11/14/2021 20:35:11'!
isAbleToInstanceWith: aStringCommand

	^aStringCommand = $r.! !
