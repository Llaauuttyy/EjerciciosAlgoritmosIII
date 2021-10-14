!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'SS 10/11/2021 21:04:25'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assert: (self isExecutionTimeInMillisecondsOf: [customerBook addCustomerNamed: 'John Lennon'] lowerThan: 50)
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'SS 10/11/2021 21:04:25'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney. 
	
	self assert: (self isExecutionTimeInMillisecondsOf: [customerBook removeCustomerNamed: paulMcCartney] lowerThan: 100). 
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'SS 10/11/2021 20:32:52'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
			
	self executeAndIfNotErrorFail: [ customerBook addCustomerNamed: ''.] 
	ifError: Error 
	thenDo: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty]. 
		
	

! !

!CustomerBookTest methodsFor: 'tests' stamp: 'SS 10/11/2021 22:53:54'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self executeAndIfNotErrorFail: [ customerBook removeCustomerNamed: 'Paul McCartney'.]
	ifError: NotFound 
	thenDo: [:anError| self assertThat: customerBook hasSizeOf: 1 andIncludes: johnLennon]. 
		
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'SS 10/13/2021 22:41:01'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self addAndSuspendACustomerNamed: paulMcCartney to: customerBook.  
	
	self assertThat: customerBook 
	hasATotalCustomersAmountMadeOutOfACertainActiveCustomersAmountOf: 0
	andACertainSuspendedCustomersAmountOf: 1. 
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'SS 10/13/2021 22:41:18'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self addAndSuspendACustomerNamed: paulMcCartney to: customerBook. 
	customerBook removeCustomerNamed: paulMcCartney. 
	
	self assertThat: customerBook 
	hasATotalCustomersAmountMadeOutOfACertainActiveCustomersAmountOf: 0
	andACertainSuspendedCustomersAmountOf: 0. 
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).
	
	
	 


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'SS 10/12/2021 23:15:31'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self executeAndIfNotErrorFail: [customerBook suspendCustomerNamed: 'Ringo Starr'.]
	ifError: CantSuspend 
	thenDo: [:anError| self assertThat: customerBook hasSizeOf: 1 andIncludes: johnLennon]. ! !

!CustomerBookTest methodsFor: 'tests' stamp: 'SS 10/12/2021 23:46:30'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	self addAndSuspendACustomerNamed: johnLennon to: customerBook. 
	
	self executeAndIfNotErrorFail: [customerBook suspendCustomerNamed: johnLennon .]
	ifError: CantSuspend 
	thenDo: [:anError| self assertThat: customerBook hasSizeOf: 1  andIncludes: johnLennon].
	
! !


!CustomerBookTest methodsFor: 'tests - private' stamp: 'SS 10/12/2021 23:45:00'!
addAndSuspendACustomerNamed: aName to: aCustomerBook
	
	aCustomerBook addCustomerNamed: aName.
	aCustomerBook suspendCustomerNamed: aName.! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'SS 10/13/2021 00:03:05'!
assertThat: aCustomerBook hasATotalCustomersAmountMadeOutOfACertainActiveCustomersAmountOf: anAmountOfActiveCustomers andACertainSuspendedCustomersAmountOf: anAmountOfSuspendedCustomers

	self assert: anAmountOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: anAmountOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: (anAmountOfActiveCustomers + anAmountOfSuspendedCustomers) equals: aCustomerBook numberOfCustomers.
	

	
! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'SS 10/12/2021 23:14:20'!
assertThat: aCustomerBook hasSizeOf: anAmount andIncludes: aCostumerName

	self assert: aCustomerBook numberOfCustomers = anAmount.
	self assert: (aCustomerBook includesCustomerNamed: aCostumerName).
	
! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'SS 10/11/2021 20:28:52'!
executeAndIfNotErrorFail: aCodeToExecute ifError: anError thenDo: aCodeAsResponse 
	
	[ aCodeToExecute value.
	self fail ]
		on: anError 
		do: aCodeAsResponse.
! !

!CustomerBookTest methodsFor: 'tests - private' stamp: 'SS 10/11/2021 21:04:25'!
isExecutionTimeInMillisecondsOf: aCodeBlock lowerThan: maxTime 
	| millisecondsAfterRunning millisecondsBeforeRunning |
	
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aCodeBlock value. 
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfterRunning - millisecondsBeforeRunning) < (maxTime * millisecond)! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'SS 10/11/2021 19:42:17'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'SS 10/13/2021 22:44:12'!
removeCustomerNamed: aName

	active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^NotFound signal.]]. 
	 ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !

