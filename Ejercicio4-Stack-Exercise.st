!classDefinition: #OOLimitedStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOLimitedStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStackTest methodsFor: 'tests' stamp: 'SS 11/3/2021 21:57:28'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOLimitedStack withLimit: 1.
	
	self assert: stack isEmpty! !

!OOLimitedStackTest methodsFor: 'tests' stamp: 'SS 11/3/2021 21:57:28'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOLimitedStack withLimit: 1.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOLimitedStackTest methodsFor: 'tests' stamp: 'SS 11/3/2021 21:57:28'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOLimitedStack withLimit: 1.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOLimitedStackTest methodsFor: 'tests' stamp: 'SS 11/3/2021 21:57:28'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOLimitedStack withLimit: 1.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOLimitedStackTest methodsFor: 'tests' stamp: 'LD 11/3/2021 22:37:23'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOLimitedStack withLimit: 2. 
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty ! !

!OOLimitedStackTest methodsFor: 'tests' stamp: 'SS 11/3/2021 21:57:28'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOLimitedStack withLimit: 1.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOLimitedStackTest methodsFor: 'tests' stamp: 'SS 11/3/2021 21:57:28'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOLimitedStack withLimit: 1.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.! !

!OOLimitedStackTest methodsFor: 'tests' stamp: 'SS 11/3/2021 21:57:28'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOLimitedStack withLimit: 1.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOUnlimitedStack stackEmptyErrorDescription ]! !

!OOLimitedStackTest methodsFor: 'tests' stamp: 'SS 11/3/2021 21:57:28'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOLimitedStack withLimit: 1.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOUnlimitedStack stackEmptyErrorDescription ]
		
! !

!OOLimitedStackTest methodsFor: 'tests' stamp: 'SS 11/3/2021 21:57:28'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOLimitedStack withLimit: 1.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOUnlimitedStack stackEmptyErrorDescription ]
		
! !

!OOLimitedStackTest methodsFor: 'tests' stamp: 'SS 11/3/2021 21:57:28'!
test11CanNotPushWhenLimitIsReached

	| stack |
	
	stack := OOLimitedStack withLimit: 2.
	stack push: 'something'.	
	stack push: 'nothing'.	


	self
		should: [ stack push: 'bananas' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackLimitReachedErrorDescription ]
		
! !


!classDefinition: #OOUnlimitedStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOUnlimitedStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'SS 11/3/2021 20:02:18'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOUnlimitedStack new.
	
	self assert: stack isEmpty! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'SS 11/3/2021 20:02:19'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOUnlimitedStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'SS 11/3/2021 20:02:18'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOUnlimitedStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'SS 11/3/2021 20:02:19'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOUnlimitedStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'SS 11/3/2021 20:02:19'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOUnlimitedStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'SS 11/3/2021 20:02:19'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOUnlimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'SS 11/3/2021 20:02:19'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOUnlimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'SS 11/3/2021 20:02:18'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOUnlimitedStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOUnlimitedStack stackEmptyErrorDescription ]
		
! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'SS 11/3/2021 20:02:19'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOUnlimitedStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOUnlimitedStack stackEmptyErrorDescription ]
		
! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'SS 11/3/2021 20:21:55'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOUnlimitedStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOUnlimitedStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'aStack anotherStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SS 11/3/2021 20:02:19'!
setUp

	aStack := OOUnlimitedStack new. 
	aStack push: 'winter is coming' ; push: 'winning is everything'; push: 'The winds of Winter'; push: 'Winter is here'. 
	
	anotherStack := OOUnlimitedStack new.
	anotherStack push: 'winter is coming' ; push: 'winning is everything'; push: 'The winds of Winter'; push: 'Winter is here'. 
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SS 11/3/2021 21:58:34'!
test01SentenceFinderFindsAPrefixInAStackOfSentences

	| aSenteceFinderByPrefix sentencesFound |
	
	aSenteceFinderByPrefix := SentenceFinderByPrefix new.
	
	sentencesFound := aSenteceFinderByPrefix find: 'Wint' in: aStack.
	
	self assert: sentencesFound equals: (OrderedCollection with: 'Winter is here').  


	
	 	

	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SS 11/3/2021 19:27:59'!
test02SenteceFinderDoesNotChangeStack

	| aSenteceFinderByPrefix |

	aSenteceFinderByPrefix := SentenceFinderByPrefix new.
	
	aSenteceFinderByPrefix find: 'Wint' in: aStack. 
	
	self assertThat: aStack equals: anotherStack.  


	
	 	

	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SS 11/3/2021 22:00:46'!
test03SentecesFindsMoreThanOneSentenceWithACommonPrefix

	| aSenteceFinderByPrefix sentencesFound |
	
	aSenteceFinderByPrefix := SentenceFinderByPrefix new.
	
	sentencesFound := aSenteceFinderByPrefix find: 'win' in: aStack.
	
	self assert: sentencesFound equals: (OrderedCollection with: 'winning is everything' with: 'winter is coming').  

	
	 	

	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SS 11/3/2021 19:29:19'!
test04SentenceFinderDoesNotFindAPrefixInAStackOfSentences

	| aSenteceFinderByPrefix sentencesFound |
	
	aSenteceFinderByPrefix := SentenceFinderByPrefix new.
	
	sentencesFound := aSenteceFinderByPrefix find: 'Summer' in: aStack.
	
	self assert: sentencesFound equals: OrderedCollection new.  

	
	 	

	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SS 11/3/2021 21:59:50'!
test05CannotFindAPrefixWhichIsEmpty

	| aSenteceFinderByPrefix |
	
	aSenteceFinderByPrefix := SentenceFinderByPrefix new.
	
	self 
		should: [aSenteceFinderByPrefix find: '' in: aStack] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError| self assert: anError messageText equals: SentenceFinderByPrefix emptyPrefixErrorDescription]. 

	
	 	

	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SS 11/3/2021 21:59:39'!
test06CannotFindAPrefixWhichHasWhiteSpaces

	| aSenteceFinderByPrefix |
	
	aSenteceFinderByPrefix := SentenceFinderByPrefix new.
	
	self 
		should: [aSenteceFinderByPrefix find: 'Winter ' in: aStack] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError| self assert: anError messageText equals: SentenceFinderByPrefix whiteSpaceErrorDescription]. 

	
	 	

	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SS 11/3/2021 19:32:27'!
test07SentenceFinderIsCaseSensitive

	| aSenteceFinderByPrefix sentencesFound |
	
	aSenteceFinderByPrefix := SentenceFinderByPrefix new.
	
	sentencesFound := aSenteceFinderByPrefix find: 'WiNt' in: aStack.
	
	self assert: sentencesFound equals: OrderedCollection new.  


	
	 	

	! !


!SentenceFinderByPrefixTest methodsFor: 'assertions' stamp: 'SS 11/3/2021 19:56:27'!
assertThat: aStackInstance equals: anotherStackInstance

	self assert: aStackInstance size equals: anotherStackInstance size.
	
	[aStackInstance isNotEmpty] whileTrue: [
			
			self assert: aStackInstance pop equals: anotherStackInstance pop.
		
		].
	 ! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'private' stamp: 'SS 11/3/2021 20:11:58'!
popWhenStackIsEmpty

	^self error: OOStack stackEmptyErrorDescription.

	! !

!OOStack methodsFor: 'private' stamp: 'SS 11/3/2021 20:09:50'!
popWhenStackIsNotEmpty

	^content removeLast. ! !

!OOStack methodsFor: 'private' stamp: 'SS 11/3/2021 20:41:23'!
pushWhenStackIsNotFull: anElement

	content add: anElement. ! !

!OOStack methodsFor: 'private' stamp: 'SS 11/3/2021 20:07:38'!
state

	^StackState for: self.  ! !

!OOStack methodsFor: 'private' stamp: 'SS 11/3/2021 20:12:05'!
topWhenStackIsEmpty

	self error: OOStack stackEmptyErrorDescription! !

!OOStack methodsFor: 'private' stamp: 'SS 11/3/2021 20:10:23'!
topWhenStackIsNotEmpty

	^content at: content size.
! !


!OOStack methodsFor: 'interactions' stamp: 'SS 11/3/2021 20:03:54'!
isEmpty

	^self size = 0. ! !

!OOStack methodsFor: 'interactions' stamp: 'LD 11/3/2021 22:51:35'!
isFull

	self subclassResponsibility.! !

!OOStack methodsFor: 'interactions' stamp: 'SS 11/3/2021 21:41:56'!
isNotEmpty

	self subclassResponsibility.! !

!OOStack methodsFor: 'interactions' stamp: 'SS 11/3/2021 20:07:01'!
pop

	^self state pop. ! !

!OOStack methodsFor: 'interactions' stamp: 'SS 11/3/2021 20:12:40'!
push: anElement

	self subclassResponsibility. ! !

!OOStack methodsFor: 'interactions' stamp: 'SS 11/3/2021 20:06:33'!
size

	^content size. ! !

!OOStack methodsFor: 'interactions' stamp: 'SS 11/3/2021 20:07:47'!
top

	^self state top. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'SS 11/3/2021 20:11:30'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOLimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOLimitedStack
	instanceVariableNames: 'limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStack methodsFor: 'initializing' stamp: 'SS 11/3/2021 20:14:54'!
initialize

	content := OrderedCollection new. 
	
	 ! !

!OOLimitedStack methodsFor: 'initializing' stamp: 'SS 11/3/2021 20:28:07'!
initializeWith: aSize

	limit := aSize. ! !


!OOLimitedStack methodsFor: 'interactions' stamp: 'LD 11/3/2021 22:47:21'!
isFull

	^limit <= self size.! !

!OOLimitedStack methodsFor: 'interactions' stamp: 'SS 11/3/2021 21:23:14'!
isNotEmpty

	^self size > 0 and: [self size < limit]. ! !

!OOLimitedStack methodsFor: 'interactions' stamp: 'SS 11/3/2021 21:06:56'!
push: anElement

	self state push: anElement. 
	
	
	
	! !


!OOLimitedStack methodsFor: 'private' stamp: 'SS 11/3/2021 20:42:51'!
pushWhenStackIsFull: anElement

	self error: OOLimitedStack stackLimitReachedErrorDescription. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStack class' category: 'Stack-Exercise'!
OOLimitedStack class
	instanceVariableNames: ''!

!OOLimitedStack class methodsFor: 'error descriptions' stamp: 'SS 11/3/2021 20:25:03'!
stackLimitReachedErrorDescription

	^'Limit has been reached'.! !


!OOLimitedStack class methodsFor: 'instance creation' stamp: 'SS 11/3/2021 21:57:47'!
withLimit: aLimit

	^self new initializeWith: aLimit. ! !


!classDefinition: #OOUnlimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOUnlimitedStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOUnlimitedStack methodsFor: 'initializing' stamp: 'SS 11/3/2021 20:13:47'!
initialize

	content := OrderedCollection new.
	! !


!OOUnlimitedStack methodsFor: 'interactions' stamp: 'SS 11/3/2021 21:42:12'!
isNotEmpty

	^self size > 0. ! !

!OOUnlimitedStack methodsFor: 'interactions' stamp: 'SS 11/1/2021 20:42:51'!
push: anElement

	content add: anElement. ! !


!OOUnlimitedStack methodsFor: 'as yet unclassified' stamp: 'LD 11/3/2021 22:43:20'!
isFull

	^false.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'auxiliarStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'SS 11/3/2021 19:22:38'!
find: aPrefix in: aStack andAddTo: aSentenceCollection

	[aStack isNotEmpty] whileTrue: [ | aSentence |
			
			aSentence := aStack pop.
			auxiliarStack push: aSentence. 
			(aSentence beginsWith: aPrefix) ifTrue: [aSentenceCollection add: aSentence].
			
		]! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'SS 11/2/2021 20:37:30'!
refill: aStack with: anotherStack

	[anotherStack isNotEmpty] whileTrue: [
			
			aStack push: anotherStack pop.
			
		].! !


!SentenceFinderByPrefix methodsFor: 'validations - private' stamp: 'SS 11/3/2021 21:54:53'!
aPrefixContainsAWhiteSpace: aPrefix

	^ (aPrefix findString: ' ') > 0! !


!SentenceFinderByPrefix methodsFor: 'assertions - private' stamp: 'SS 11/3/2021 22:03:08'!
assertAPrefixIsValid: aPrefix

	"Estos ifs no los sacamos porque consideramos que son casos muy especificos e iban a generar abstracciones muy puntuales"

	aPrefix isEmpty ifTrue: [self error: SentenceFinderByPrefix emptyPrefixErrorDescription ]. 
	
	(self aPrefixContainsAWhiteSpace: aPrefix) ifTrue: [self error: SentenceFinderByPrefix whiteSpaceErrorDescription]! !


!SentenceFinderByPrefix methodsFor: 'finding' stamp: 'SS 11/3/2021 21:52:36'!
find: aPrefix in: aStack  
	
	| aSentenceCollection |
	
	self assertAPrefixIsValid: aPrefix.
	
	auxiliarStack := OOUnlimitedStack new.  
	aSentenceCollection := OrderedCollection new. 
	
	self find: aPrefix in: aStack andAddTo: aSentenceCollection. 
	self refill: aStack with: auxiliarStack.  
	
	^aSentenceCollection. 

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'SS 11/2/2021 21:00:55'!
emptyPrefixErrorDescription

	^ 'Prefix cannot be empty'. ! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'SS 11/2/2021 21:11:03'!
whiteSpaceErrorDescription

	^ 'Prefix cannot contain white spaces'. ! !


!classDefinition: #StackState category: 'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'initializing' stamp: 'SS 11/1/2021 21:10:50'!
initializeWith: aStack

	stack := aStack. ! !


!StackState methodsFor: 'private' stamp: 'SS 11/1/2021 21:11:50'!
pop

	self subclassResponsibility. ! !

!StackState methodsFor: 'private' stamp: 'SS 11/3/2021 21:36:48'!
push: anElement

	self subclassResponsibility.! !

!StackState methodsFor: 'private' stamp: 'SS 11/1/2021 21:12:01'!
top

	self subclassResponsibility. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackState class' category: 'Stack-Exercise'!
StackState class
	instanceVariableNames: ''!

!StackState class methodsFor: 'validations' stamp: 'SS 11/2/2021 19:26:50'!
isStateClassOf: aStack

	self subclassResponsibility. ! !


!StackState class methodsFor: 'instance creation' stamp: 'SS 11/2/2021 19:26:50'!
for: aStack

	| aStackStateClass |
	
	aStackStateClass := StackState subclasses detect: [:aSubClass| aSubClass isStateClassOf: aStack].
	
	^aStackStateClass new initializeWith: aStack. 
	! !


!classDefinition: #EmptyState category: 'Stack-Exercise'!
StackState subclass: #EmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyState methodsFor: 'private' stamp: 'SS 11/1/2021 21:12:46'!
pop

	^stack popWhenStackIsEmpty.
	! !

!EmptyState methodsFor: 'private' stamp: 'SS 11/3/2021 20:40:25'!
push: anElement

	stack pushWhenStackIsNotFull: anElement.! !

!EmptyState methodsFor: 'private' stamp: 'SS 11/1/2021 21:12:33'!
top

	^stack topWhenStackIsEmpty.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyState class' category: 'Stack-Exercise'!
EmptyState class
	instanceVariableNames: ''!

!EmptyState class methodsFor: 'validations' stamp: 'SS 11/2/2021 19:26:50'!
isStateClassOf: aStack

	^aStack isEmpty. ! !


!classDefinition: #FullState category: 'Stack-Exercise'!
StackState subclass: #FullState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FullState methodsFor: 'private' stamp: 'SS 11/3/2021 21:32:08'!
pop

	^stack popWhenStackIsNotEmpty.! !

!FullState methodsFor: 'private' stamp: 'SS 11/3/2021 20:44:03'!
push: anElement

	stack pushWhenStackIsFull: anElement. ! !

!FullState methodsFor: 'private' stamp: 'SS 11/3/2021 21:34:25'!
top

	^stack topWhenStackIsNotEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FullState class' category: 'Stack-Exercise'!
FullState class
	instanceVariableNames: ''!

!FullState class methodsFor: 'validations' stamp: 'SS 11/3/2021 20:45:48'!
isStateClassOf: aStack

	^aStack isFull. ! !


!classDefinition: #NotEmptyState category: 'Stack-Exercise'!
StackState subclass: #NotEmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyState methodsFor: 'private' stamp: 'SS 11/1/2021 21:13:01'!
pop

	^stack popWhenStackIsNotEmpty.! !

!NotEmptyState methodsFor: 'private' stamp: 'SS 11/3/2021 20:43:30'!
push: anElement

	stack pushWhenStackIsNotFull: anElement.! !

!NotEmptyState methodsFor: 'private' stamp: 'SS 11/1/2021 21:13:11'!
top

	^stack topWhenStackIsNotEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyState class' category: 'Stack-Exercise'!
NotEmptyState class
	instanceVariableNames: ''!

!NotEmptyState class methodsFor: 'validations' stamp: 'SS 11/2/2021 19:26:50'!
isStateClassOf: aStack

	^aStack isNotEmpty. ! !
