!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'aPortfolio aSecondPortfolio aThirdPortfolio anAccount anotherAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'valid portfolios' stamp: 'SS 11/28/2021 17:29:16'!
test12PortfolioCannotRegisterTheSameAccountTwice 
	
	aPortfolio register: anAccount.
	
	self 
		should: [aPortfolio register: anAccount.]  
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio invalidPortfolioErrorDescription.]! !

!PortfolioTest methodsFor: 'valid portfolios' stamp: 'SS 11/28/2021 17:37:57'!
test13PortfolioCannotRegisterAnAccountThatWasRegisteredInAPortfolioInsideOfIt 
	
	aThirdPortfolio register: anAccount. 
	
	aSecondPortfolio register: aThirdPortfolio.
	
	aPortfolio register: aSecondPortfolio. 
	
	self 
		should: [aPortfolio register: anAccount.]  
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio invalidPortfolioErrorDescription.]! !

!PortfolioTest methodsFor: 'valid portfolios' stamp: 'SS 11/28/2021 17:38:17'!
test14PortfolioCannotRegisterAnAccountAlreadyIncludedInAPortfiolioPreviouslyRegistered 
	
	aSecondPortfolio register: anAccount.
	
	aPortfolio register: aSecondPortfolio. 
	
	self 
		should: [aPortfolio register: anAccount.]  
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio invalidPortfolioErrorDescription.]! !

!PortfolioTest methodsFor: 'valid portfolios' stamp: 'SS 11/28/2021 17:38:26'!
test15PortfolioCannotRegisterItself
	
	self 
		should: [aPortfolio register: aPortfolio.]  
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio invalidPortfolioErrorDescription.]! !

!PortfolioTest methodsFor: 'valid portfolios' stamp: 'SS 11/28/2021 17:40:14'!
test16PortfolioCannotRegisterAPortfolioThatAlreadyRegisteredOneOfItsAccounts

	aPortfolio register: anAccount.
	aSecondPortfolio register: anAccount.
	
	self 
		should: [aPortfolio register: aSecondPortfolio.]  
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio invalidPortfolioErrorDescription.]
! !

!PortfolioTest methodsFor: 'valid portfolios' stamp: 'SS 11/28/2021 17:43:19'!
test17PortfolioCannotRegisterAPortfolioThatHasAPortfolioThatAlreadyRegisteredOneOfItsAccounts

	aPortfolio register: anAccount. 
	aSecondPortfolio register: aThirdPortfolio.
	aThirdPortfolio register: anAccount. 
	
	self 
		should: [aPortfolio register: aSecondPortfolio.]  
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio invalidPortfolioErrorDescription.]! !

!PortfolioTest methodsFor: 'valid portfolios' stamp: 'SS 11/28/2021 17:39:34'!
test18PortfolioCannotRegisterAnAccountWhenItsFatherAlreadyHasRegisteredThatAccount
	
	aPortfolio register: anAccount.
	aPortfolio register: aSecondPortfolio.
	
	self 
		should: [aSecondPortfolio register: anAccount.]  
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio invalidPortfolioErrorDescription.]
		! !

!PortfolioTest methodsFor: 'valid portfolios' stamp: 'SS 11/28/2021 17:44:40'!
test19PortfolioCannotRegisterAnAccountWhenItsGrandFatherAlreadyHasRegisteredThatAccount
	
	aPortfolio register: anAccount. 
	aSecondPortfolio register: aThirdPortfolio.
	aPortfolio register: aSecondPortfolio. 
	
	self 
		should: [aThirdPortfolio register: anAccount.]  
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio invalidPortfolioErrorDescription.]
		
		! !


!PortfolioTest methodsFor: 'functionality testing' stamp: 'SS 11/28/2021 17:28:43'!
test01NewPortfolioDoesNotHaveBalance 
	
	self assert: 0 * peso equals: aPortfolio balance.
	 ! !

!PortfolioTest methodsFor: 'functionality testing' stamp: 'SS 11/28/2021 17:29:16'!
test02PortfolioWithOneAccountHasBalanceOfThatAccount

	
	Deposit register: 100 * peso on: anAccount . 
	
	aPortfolio register: anAccount . 
	
	self assert: 100 * peso equals: aPortfolio balance.
	 ! !

!PortfolioTest methodsFor: 'functionality testing' stamp: 'SS 11/28/2021 17:30:00'!
test03PortfolioWithMoreThanOneAccountHasBalanceOfThoseAccounts
	
	
	Deposit register: 100 * peso on: anAccount . 
	Deposit register: 50 * peso on: anotherAccount. 
	
	aPortfolio register: anAccount. 
	aPortfolio register: anotherAccount. 
	
	self assert: 150 * peso equals: aPortfolio balance.
	 ! !

!PortfolioTest methodsFor: 'functionality testing' stamp: 'SS 11/28/2021 17:29:44'!
test04PortfolioWithAnAccountWithoutTransactionsDoesNotHaveTransactions

	aPortfolio register: anAccount . 

	self deny: aPortfolio hasAccountsWithTransactions. 
	 ! !

!PortfolioTest methodsFor: 'functionality testing' stamp: 'SS 11/28/2021 17:29:16'!
test05PortfolioWithAnAccountWithTransactionsHasTransactions

	Deposit register: 50 * peso on: anAccount . 
	
	aPortfolio register: anAccount. 

	self assert: aPortfolio hasAccountsWithTransactions. 
	 ! !

!PortfolioTest methodsFor: 'functionality testing' stamp: 'SS 11/28/2021 17:29:25'!
test06PortfolioWithAtLeastOneAccountWithTransactionsHasTransactions
	
	Deposit register: 50 * peso on: anAccount. 
	
	aPortfolio register: anAccount. 
	aPortfolio register: anotherAccount.
	 
	self assert: aPortfolio hasAccountsWithTransactions. 
	 ! !

!PortfolioTest methodsFor: 'functionality testing' stamp: 'SS 11/28/2021 17:28:43'!
test07NewPortfolioDoesNotHaveTransactions
	 
	self assert: aPortfolio transactions isEmpty. 
	 ! !

!PortfolioTest methodsFor: 'functionality testing' stamp: 'SS 11/28/2021 17:29:16'!
test08PortfolioWithAnAccountWithTransactionsHasThatAccountTransactions

	Deposit register: 2 * peso on: anAccount.
	
	aPortfolio register: anAccount. 
	
	self assert: aPortfolio transactions equals: anAccount transactions. 
	 ! !

!PortfolioTest methodsFor: 'functionality testing' stamp: 'SS 11/28/2021 17:29:25'!
test09PortfolioWithMultipleAccountsWithTransactionsHasThoseAccountsTransactions
	
	| allTransactions |
	
	Deposit register: 2 * peso on: anAccount.
	Deposit register: 5 * peso on: anotherAccount.
	
	aPortfolio register: anAccount. 
	aPortfolio register: anotherAccount. 
	
	allTransactions := OrderedCollection new. 
	allTransactions addAll: anAccount transactions. 
	allTransactions addAll: anotherAccount transactions. 	 	
	
	self assert: aPortfolio transactions equals: allTransactions. 
	 ! !

!PortfolioTest methodsFor: 'functionality testing' stamp: 'SS 11/28/2021 17:35:59'!
test10PortfolioBalanceIsAffectedAfterMakingTransactionsInItsAccounts
	
	Deposit register: 100 * peso on: anAccount. 
	
	aPortfolio register: anAccount. 
	
	Withdraw register: 50 * peso on: anAccount. 
	
	self assert: 50 * peso equals: aPortfolio balance.! !

!PortfolioTest methodsFor: 'functionality testing' stamp: 'SS 11/28/2021 17:36:08'!
test11PortfolioTransactionsChangeAfterATransactionIsMadeInOneOfItsAccounts

	Deposit register: 100 * peso on: anAccount. 
	
	aPortfolio register: anAccount. 
	
	Withdraw register: 50 * peso on: anAccount. 
	
	self assert: aPortfolio transactions equals: anAccount transactions.! !


!PortfolioTest methodsFor: 'setUp' stamp: 'SS 11/28/2021 17:29:25'!
setUp

	aPortfolio := Portfolio new.

	aSecondPortfolio := Portfolio new.
	
	aThirdPortfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	
	anotherAccount := ReceptiveAccount new.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'originAccount destinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'testing' stamp: 'SS 11/28/2021 16:06:30'!
test01TransferChangesBalanceOfBothAccountsCorrectly
	
	Transfer from: originAccount to: destinationAccount for: 100 * peso.
	
	self assert: originAccount balance equals: -100 * peso.
	self assert: destinationAccount balance equals: 100 * peso.! !

!TransferTest methodsFor: 'testing' stamp: 'SS 11/28/2021 16:06:30'!
test02TransferKnowsItsValue
	
	| aTransfer |
	
	aTransfer := Transfer from: originAccount to: destinationAccount for: 100 * peso.
	
	self assert: aTransfer value equals: 100 * peso.! !

!TransferTest methodsFor: 'testing' stamp: 'SS 11/28/2021 16:06:30'!
test03TransferLegKnowsItsCounterpart
	
	| aTransfer aTransferWithdrawPart |
	
	aTransfer := Transfer from: originAccount to: destinationAccount for: 100 * peso.
	
	aTransferWithdrawPart := aTransfer withdrawLeg.
	
	self assert: aTransferWithdrawPart counterpart equals: aTransfer depositLeg.! !

!TransferTest methodsFor: 'testing' stamp: 'SS 11/28/2021 16:06:30'!
test04TransferCannotBeDoneWithAValueOfZeroPesos
	
	
	self  
		should: [Transfer from: originAccount to: destinationAccount for: 0 * peso.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError| self assert: anError messageText equals: Transfer cannotTransferZeroPesosErrorDescription.]

! !

!TransferTest methodsFor: 'testing' stamp: 'SS 11/28/2021 16:06:30'!
test05TransferCannotBeDoneWithANegativeValue
	
	self  
		should: [Transfer from: originAccount to: destinationAccount for: -10 * peso.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError| self assert: anError messageText equals: Transfer cannotTransferNegativePesosErrorDescription.]

! !

!TransferTest methodsFor: 'testing' stamp: 'SS 11/28/2021 16:02:27'!
test06TransferCannotBeDoneBetweenTheSameAccount
	
	| anAccount |
	
	anAccount := ReceptiveAccount new.
	
	self  
		should: [Transfer from: anAccount to: anAccount for: 10 * peso.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError| self assert: anError messageText equals: Transfer cannotTransferToYourselfErrorDescription.]

! !


!TransferTest methodsFor: 'setUp' stamp: 'SS 11/28/2021 16:06:30'!
setUp

	originAccount := ReceptiveAccount new. 
	destinationAccount := ReceptiveAccount new. ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'private' stamp: 'SS 11/26/2021 00:23:51'!
affectBalance: aBalance

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'private' stamp: 'SS 11/26/2021 00:24:14'!
affectBalance: aBalance

	^aBalance + self value. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLeg methodsFor: 'main protocol' stamp: 'SS 11/23/2021 20:31:56'!
counterpart

	self subclassResponsibility.! !


!TransferLeg methodsFor: 'initialization' stamp: 'SS 11/23/2021 20:33:06'!
initializeWithTransfer: aTransfer and: anAmount

	transfer := aTransfer.
	value := anAmount. ! !


!TransferLeg methodsFor: 'private' stamp: 'SS 11/28/2021 17:02:59'!
affectBalance: aBalance

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'SS 11/23/2021 20:33:37'!
register: anAmountToTransfer on: anAccount ofTransfer: aTransfer
	
	| transferPart |
	
	transferPart := self new initializeWithTransfer: aTransfer and: anAmountToTransfer.
	
	anAccount register: transferPart.
	
	^transferPart. ! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDepositLeg methodsFor: 'private' stamp: 'SS 11/26/2021 00:24:26'!
affectBalance: aBalance

	^aBalance + self value. ! !


!TransferDepositLeg methodsFor: 'value' stamp: 'SS 11/23/2021 19:39:55'!
value

	^value! !


!TransferDepositLeg methodsFor: 'main protocol' stamp: 'SS 11/26/2021 00:12:21'!
counterpart

	^transfer withdrawLeg.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdrawLeg methodsFor: 'private' stamp: 'SS 11/26/2021 00:24:35'!
affectBalance: aBalance

	^aBalance - self value. ! !


!TransferWithdrawLeg methodsFor: 'main protocol' stamp: 'SS 11/26/2021 00:11:55'!
counterpart

	^transfer depositLeg. ! !


!TransferWithdrawLeg methodsFor: 'value' stamp: 'SS 11/23/2021 19:40:35'!
value

	^value.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'private' stamp: 'SS 11/26/2021 00:24:42'!
affectBalance: aBalance

	^aBalance - self value. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #BankAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #BankAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BankAccount methodsFor: 'private' stamp: 'SS 11/28/2021 16:32:58'!
beRegisteredTo: aPortfolio

	self subclassResponsibility. ! !

!BankAccount methodsFor: 'private' stamp: 'SS 11/28/2021 15:53:18'!
knows: aBankAccount

	self subclassResponsibility.! !


!BankAccount methodsFor: 'main protocol' stamp: 'SS 11/26/2021 21:44:35'!
balance

	self subclassResponsibility. ! !

!BankAccount methodsFor: 'main protocol' stamp: 'SS 11/26/2021 21:44:29'!
transactions

	self subclassResponsibility. ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
BankAccount subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'SS 11/26/2021 22:48:03'!
initialize 
	
	accounts := OrderedCollection new. 
	
	parents := OrderedCollection new. 
	! !


!Portfolio methodsFor: 'private' stamp: 'SS 11/28/2021 15:37:38'!
addIntoAccounts: aBankAccount

	accounts add: aBankAccount.
	
	
	
! !

!Portfolio methodsFor: 'private' stamp: 'SS 11/28/2021 16:52:47'!
assertABankAccountCanBeRegistered: aBankAccount
	
	self assertABankAccountIsNotKnown: aBankAccount. 
	
	self assertABankAccountIsNotKnownByParents: aBankAccount.! !

!Portfolio methodsFor: 'private' stamp: 'SS 11/28/2021 16:51:19'!
assertABankAccountIsNotKnown: aBankAccount

	accounts select: [:anAccount| anAccount knows: aBankAccount] thenDo: [:anAccount| self error: self class invalidPortfolioErrorDescription].! !

!Portfolio methodsFor: 'private' stamp: 'SS 11/28/2021 16:51:54'!
assertABankAccountIsNotKnownByParents: aBankAccount

	parents select: [:aPortfolioParent| (aPortfolioParent parentHasRegistered: aBankAccount)] thenDo: [:aPortfolioParent| self error: self class invalidPortfolioErrorDescription]! !

!Portfolio methodsFor: 'private' stamp: 'SS 11/28/2021 16:55:06'!
assertAPortfolioCanBeRegistered: aPortfolio

	(self canRegister: aPortfolio) ifTrue: [ 		self error: self class invalidPortfolioErrorDescription]

	
	
	
	
! !

!Portfolio methodsFor: 'private' stamp: 'SS 11/26/2021 22:50:11'!
beChildOf: aPortfolio

	parents add: aPortfolio. ! !

!Portfolio methodsFor: 'private' stamp: 'SS 11/28/2021 16:35:01'!
beRegisteredTo: aPortfolio

	aPortfolio assertAPortfolioCanBeRegistered: self.

	self beChildOf: aPortfolio.
	
	aPortfolio addIntoAccounts: self. 
	
	
	
! !

!Portfolio methodsFor: 'private' stamp: 'SS 11/28/2021 16:55:06'!
canRegister: aPortfolio

	^ (aPortfolio hasAnyAccountIn: accounts) or: [self = aPortfolio]! !

!Portfolio methodsFor: 'private' stamp: 'SS 11/28/2021 15:53:18'!
hasAnyAccountIn: aListOfAccounts
	
	accounts do: [:anAccount| aListOfAccounts do: [:anotherAccount| (anAccount knows: anotherAccount) ifTrue: [^true]]].
	
	^false.  
	
	

	! !

!Portfolio methodsFor: 'private' stamp: 'SS 11/28/2021 15:53:35'!
knows: aBankAccount 
	
	accounts do: [:anAccount| (anAccount knows: aBankAccount) ifTrue: [^true]].
	^false.! !

!Portfolio methodsFor: 'private' stamp: 'SS 11/28/2021 16:53:46'!
parentHasRegistered: aBankAccount

	(self knows: aBankAccount) ifTrue: [^true].
	
	parents do: [:aPortfolioParent | (aPortfolioParent parentHasRegistered: aBankAccount) ifTrue: [^true]].
	
	^false.! !


!Portfolio methodsFor: 'main protocol' stamp: 'SS 11/25/2021 23:27:21'!
balance
	
	^accounts sum: [:anAccount| anAccount balance] ifEmpty: [^0].! !

!Portfolio methodsFor: 'main protocol' stamp: 'SS 11/25/2021 20:47:33'!
hasAccountsWithTransactions
	
	accounts do: [:anAccount| anAccount transactions isEmpty ifFalse: [^true]].
	^false.  	
! !

!Portfolio methodsFor: 'main protocol' stamp: 'SS 11/28/2021 16:53:09'!
register: aBankAccount
	
	self assertABankAccountCanBeRegistered: aBankAccount.
	
	aBankAccount beRegisteredTo: self.

	! !

!Portfolio methodsFor: 'main protocol' stamp: 'SS 11/25/2021 23:32:28'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	
	accounts do: [:anAccount| transactions addAll: anAccount transactions].
	
	^transactions.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error descriptions' stamp: 'SS 11/26/2021 21:54:44'!
invalidPortfolioErrorDescription

	^'Invalid operation!!'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
BankAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'SS 11/26/2021 00:13:51'!
initialize

	transactions := OrderedCollection new.
	! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SS 11/26/2021 00:25:23'!
balance 
	
	| balance |
	
	balance := 0.
	
	transactions do: [ :aTransaction | balance := aTransaction affectBalance: balance ]. 
	
	^balance. 
	! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'SS 11/28/2021 16:32:58'!
beRegisteredTo: aPortfolio

	aPortfolio addIntoAccounts: self. 

	! !

!ReceptiveAccount methodsFor: 'private' stamp: 'SS 11/28/2021 15:53:18'!
knows:  aBankAccount

	^self = aBankAccount.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'SS 11/26/2021 00:31:26'!
initializeWithOrigin: anOriginAccount ToDestination: aDestinationAccount for: anAmountToTransfer
	
	
	value := anAmountToTransfer.
	
	withdrawLeg := TransferWithdrawLeg register: anAmountToTransfer on: anOriginAccount ofTransfer: self.

	depositLeg := TransferDepositLeg register: anAmountToTransfer on: 			aDestinationAccount ofTransfer: self.
	
	
	
	! !


!Transfer methodsFor: 'main protocol' stamp: 'SS 11/26/2021 00:12:08'!
depositLeg

	^depositLeg.
	! !

!Transfer methodsFor: 'main protocol' stamp: 'LD 11/22/2021 20:02:46'!
value

	^value.! !

!Transfer methodsFor: 'main protocol' stamp: 'SS 11/26/2021 00:12:32'!
withdrawLeg

	^withdrawLeg. 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'assertions' stamp: 'SS 11/28/2021 17:08:04'!
assert: anOriginAccount isNotEqualTo: aDestinationAccount

	(anOriginAccount = aDestinationAccount ) ifTrue: [self error: self cannotTransferToYourselfErrorDescription].! !

!Transfer class methodsFor: 'assertions' stamp: 'SS 11/28/2021 17:09:02'!
assertAnAmountIsValid: anAmountToTransfer

	(anAmountToTransfer  = (0 * peso)) ifTrue: [self error: self cannotTransferZeroPesosErrorDescription].
	(anAmountToTransfer  < (0 * peso)) ifTrue: [self error: self cannotTransferNegativePesosErrorDescription].! !

!Transfer class methodsFor: 'assertions' stamp: 'SS 11/28/2021 17:11:19'!
assertTransferIsValidWith: anOriginAccount to: aDestinationAccount for: anAmountToTransfer

	self assert: anOriginAccount isNotEqualTo: aDestinationAccount.
	self assertAnAmountIsValid: anAmountToTransfer. 
! !


!Transfer class methodsFor: 'instance creation' stamp: 'SS 11/28/2021 17:11:44'!
from: anOriginAccount to: aDestinationAccount for: anAmountToTransfer


	self assertTransferIsValidWith: anOriginAccount to: aDestinationAccount  for: anAmountToTransfer.

 	^self new initializeWithOrigin: anOriginAccount ToDestination: aDestinationAccount for: anAmountToTransfer.
! !


!Transfer class methodsFor: 'error descriptions' stamp: 'SS 11/23/2021 20:44:20'!
cannotTransferNegativePesosErrorDescription

	^'Transfer cannot be negative!!'! !

!Transfer class methodsFor: 'error descriptions' stamp: 'SS 11/23/2021 20:48:02'!
cannotTransferToYourselfErrorDescription

	^'Cannot transfer to yourself!!'! !

!Transfer class methodsFor: 'error descriptions' stamp: 'SS 11/23/2021 20:44:45'!
cannotTransferZeroPesosErrorDescription

	^'Cannot transfer zero pesos!!'! !
