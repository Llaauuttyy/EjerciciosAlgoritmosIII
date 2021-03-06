!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LD 10/24/2021 17:59:48'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de N�mero Inv�lido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'LD 10/24/2021 16:27:22'!
* aMultiplier 

	^aMultiplier beMultipliedToAnEntero: self
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LD 10/24/2021 16:19:33'!
+ anAdder 

	^anAdder beAddedToAnEntero: self


! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LD 10/24/2021 16:48:57'!
- aSubstrahend 

	^aSubstrahend substractFromAnEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LD 10/24/2021 17:26:41'!
/ aDivisor 

	^aDivisor divideAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LD 10/24/2021 18:13:40'!
fibonacci

	self subclassResponsibility.
		! !


!Entero methodsFor: 'comparing' stamp: 'LD 10/24/2021 20:45:24'!
= anObject

	^(anObject isKindOf: self class) and: [ self integerValue = anObject integerValue ].! !

!Entero methodsFor: 'comparing' stamp: 'SS 10/25/2021 12:27:18'!
hash

	^self integerValue hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'LD 10/24/2021 18:48:21'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	self subclassResponsibility.! !


!Entero methodsFor: 'printing' stamp: 'LD 10/24/2021 20:27:33'!
printOn: aStream

	aStream print: self integerValue. ! !


!Entero methodsFor: 'testing' stamp: 'LD 10/25/2021 17:50:56'!
canBeADenominator

	self subclassResponsibility.! !

!Entero methodsFor: 'testing' stamp: 'LD 10/25/2021 17:51:47'!
canBeANumerator

	self subclassResponsibility.! !

!Entero methodsFor: 'testing' stamp: 'LD 10/24/2021 20:37:56'!
isNegative
	
	^self integerValue < 0! !

!Entero methodsFor: 'testing' stamp: 'LD 10/24/2021 20:37:47'!
isOne
	
	^self integerValue = 1.! !

!Entero methodsFor: 'testing' stamp: 'LD 10/24/2021 20:37:08'!
isZero
	
	^self integerValue = 0.! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'LD 10/24/2021 20:29:24'!
// aDivisor 
	
	^self class with: self integerValue // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LD 10/22/2021 02:47:41'!
beAddedToAFraccion: anAugend

	^((anAugend denominator * self) + anAugend numerator) / anAugend denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LD 10/24/2021 18:15:36'!
beAddedToAnEntero: anAugend

	^self class with: (anAugend integerValue + self integerValue).! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LD 10/24/2021 16:59:14'!
beMultipliedToAFraccion: aMultiplicand

	^(aMultiplicand numerator * self) / aMultiplicand denominator.

	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LD 10/24/2021 18:15:10'!
beMultipliedToAnEntero: aMultiplicand

	^self class with: aMultiplicand integerValue * self integerValue

	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LD 10/24/2021 17:22:59'!
divideAFraccion: aDividend

	^aDividend numerator / (aDividend denominator * self).! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'SS 10/25/2021 12:10:48'!
divideAnEntero: aDividend
	
	^self class instanceWith: aDividend over: self. ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LD 10/24/2021 20:34:30'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (self integerValue gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LD 10/24/2021 16:56:51'!
substractFromAFraccion: aMinuend

	^((aMinuend numerator) - aMinuend denominator * self) / aMinuend denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LD 10/24/2021 16:49:15'!
substractFromAnEntero: aMinuend

	^self class with: aMinuend integerValue - self integerValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation - private' stamp: 'SS 10/25/2021 12:06:27'!
createANumeroWith: aDividend over: aDivisor

	self subclassResponsibility.! !

!Entero class methodsFor: 'instance creation - private' stamp: 'SS 10/25/2021 12:07:03'!
instanceWith: aDividend over: aDivisor

	self subclassResponsibility.! !

!Entero class methodsFor: 'instance creation - private' stamp: 'LD 10/24/2021 23:21:01'!
with: aNumerator over: aDenominator

	self subclassResponsibility.! !


!Entero class methodsFor: 'instance creation' stamp: 'LD 10/24/2021 21:08:35'!
instanceWith: aValue

	self subclassResponsibility.! !

!Entero class methodsFor: 'instance creation' stamp: 'LD 10/24/2021 21:12:12'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	| aSubClassToInstance |
	
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].

	aSubClassToInstance := ((Entero subclasses) detect: [:aSubclass | aSubclass isAbleToInstanceWith: aValue]).
	
	^aSubClassToInstance instanceWith: aValue.
	! !


!Entero class methodsFor: 'instance validation' stamp: 'LD 10/24/2021 21:11:02'!
isAbleToInstanceWith: aValue

	self subclassResponsibility.

	! !


!Entero class methodsFor: 'error descriptions' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est� definido aqu� para Enteros Negativos'! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'accessing' stamp: 'LD 10/24/2021 18:48:34'!
integerValue

	^0.! !


!Cero methodsFor: 'arithmetic operations' stamp: 'LD 10/24/2021 18:20:59'!
fibonacci

	^Entero with: 1.

	! !


!Cero methodsFor: 'testing' stamp: 'LD 10/25/2021 17:51:04'!
canBeADenominator

	^False.! !

!Cero methodsFor: 'testing' stamp: 'LD 10/25/2021 17:51:52'!
canBeANumerator
	
	Fraccion error: 'una fraccion no puede ser cero'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'instance creation' stamp: 'LD 10/24/2021 21:08:35'!
instanceWith: aValue

	^Cero new.! !


!Cero class methodsFor: 'instance validation' stamp: 'LD 10/24/2021 21:11:02'!
isAbleToInstanceWith: aValue

	^aValue = 0.! !


!Cero class methodsFor: 'instance creation - private' stamp: 'SS 10/25/2021 11:59:35'!
createANumeroWith: aDividend over: aDivisor
	
	^aDividend.! !

!Cero class methodsFor: 'instance creation - private' stamp: 'SS 10/25/2021 11:59:50'!
instanceWith: aDividend over: aDivisor

	Fraccion error: Fraccion canNotDivideByZeroErrorDescription! !

!Cero class methodsFor: 'instance creation - private' stamp: 'LD 10/24/2021 23:23:44'!
with: aNumerator over: aDenominator

	^Fraccion with: aNumerator over: aDenominator.! !


!classDefinition: #NaturalDesdeDos category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #NaturalDesdeDos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NaturalDesdeDos methodsFor: 'arithmetic operations' stamp: 'LD 10/24/2021 17:54:19'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci
	
	! !


!NaturalDesdeDos methodsFor: 'accessing' stamp: 'LD 10/24/2021 18:49:04'!
integerValue

	^value.! !


!NaturalDesdeDos methodsFor: 'testing' stamp: 'LD 10/25/2021 17:51:15'!
canBeADenominator

	^True.! !

!NaturalDesdeDos methodsFor: 'testing' stamp: 'LD 10/25/2021 17:51:57'!
canBeANumerator

	^True.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NaturalDesdeDos class' category: 'Numeros-Parte2-Ejercicio'!
NaturalDesdeDos class
	instanceVariableNames: ''!

!NaturalDesdeDos class methodsFor: 'instance validation' stamp: 'LD 10/24/2021 21:11:02'!
isAbleToInstanceWith: aValue

	^aValue > 1.! !


!NaturalDesdeDos class methodsFor: 'instance creation' stamp: 'LD 10/24/2021 21:08:35'!
instanceWith: aValue

	^NaturalDesdeDos new initalizeWith: aValue.! !


!NaturalDesdeDos class methodsFor: 'instance creation - private' stamp: 'SS 10/25/2021 11:58:16'!
createANumeroWith: aDividend over: aDivisor

	| denominator greatestCommonDivisor numerator |

	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	^denominator class with: numerator over: denominator.

	! !

!NaturalDesdeDos class methodsFor: 'instance creation - private' stamp: 'SS 10/25/2021 11:59:04'!
instanceWith: aDividend over: aDivisor

	^aDividend class createANumeroWith: aDividend over: aDivisor.
				
	! !

!NaturalDesdeDos class methodsFor: 'instance creation - private' stamp: 'LD 10/24/2021 23:21:33'!
with: aNumerator over: aDenominator

	^Fraccion with: aNumerator over: aDenominator.


	! !


!classDefinition: #Negativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'arithmetic operations' stamp: 'LD 10/24/2021 18:30:39'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription.! !


!Negativo methodsFor: 'accessing' stamp: 'LD 10/24/2021 18:48:56'!
integerValue

	^value.! !


!Negativo methodsFor: 'testing' stamp: 'LD 10/25/2021 17:51:21'!
canBeADenominator

	^True.! !

!Negativo methodsFor: 'testing' stamp: 'LD 10/25/2021 17:52:05'!
canBeANumerator

	^True.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativo class' category: 'Numeros-Parte2-Ejercicio'!
Negativo class
	instanceVariableNames: ''!

!Negativo class methodsFor: 'instance validation' stamp: 'LD 10/24/2021 21:11:02'!
isAbleToInstanceWith: aValue

	^aValue < 0.! !


!Negativo class methodsFor: 'instance creation - private' stamp: 'SS 10/25/2021 12:00:43'!
createANumeroWith: aDividend over: aDivisor

	| denominator greatestCommonDivisor numerator |

	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	^denominator class with: numerator over: denominator.! !

!Negativo class methodsFor: 'instance creation - private' stamp: 'SS 10/25/2021 12:00:58'!
instanceWith: aDividend over: aDivisor

	^aDividend negated / aDivisor negated.! !

!Negativo class methodsFor: 'instance creation - private' stamp: 'LD 10/24/2021 23:23:37'!
with: aNumerator over: aDenominator

	^Fraccion with: aNumerator over: aDenominator.! !


!Negativo class methodsFor: 'instance creation' stamp: 'LD 10/24/2021 21:08:35'!
instanceWith: aValue

	^Negativo new initalizeWith: aValue.! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'accessing' stamp: 'LD 10/24/2021 18:48:41'!
integerValue

	^1.! !


!Uno methodsFor: 'arithmetic operations' stamp: 'LD 10/24/2021 18:18:41'!
fibonacci

	^self class with: 1.! !


!Uno methodsFor: 'testing' stamp: 'LD 10/25/2021 17:51:26'!
canBeADenominator

	Fraccion error: 'una fraccion no puede tener denominador 1 porque sino es un entero'.! !

!Uno methodsFor: 'testing' stamp: 'LD 10/25/2021 17:52:10'!
canBeANumerator
	
	^True.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'instance validation' stamp: 'LD 10/24/2021 21:11:02'!
isAbleToInstanceWith: aValue

	^aValue = 1.! !


!Uno class methodsFor: 'instance creation - private' stamp: 'SS 10/25/2021 12:01:17'!
createANumeroWith: aDividend over: aDivisor

	| denominator greatestCommonDivisor numerator |

	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	^denominator class with: numerator over: denominator.! !

!Uno class methodsFor: 'instance creation - private' stamp: 'SS 10/25/2021 12:01:47'!
instanceWith: aDividend over: aDivisor

	^aDividend class createANumeroWith: aDividend over: aDivisor.! !

!Uno class methodsFor: 'instance creation - private' stamp: 'LD 10/24/2021 23:21:01'!
with: aNumerator over: aDenominator

	^aNumerator.! !


!Uno class methodsFor: 'instance creation' stamp: 'LD 10/24/2021 21:08:35'!
instanceWith: aValue

	^Uno new.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LD 10/24/2021 16:30:09'!
* aMultiplier 
	
	^aMultiplier beMultipliedToAFraccion: self
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LD 10/24/2021 16:19:51'!
+ anAdder 
	
	^anAdder beAddedToAFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LD 10/24/2021 17:10:33'!
- aSubtrahend 
	
	^aSubtrahend substractFromAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LD 10/24/2021 17:26:26'!
/ aDivisor 

	^aDivisor divideAFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'SS 10/25/2021 12:23:50'!
= anObject

	^(anObject isKindOf: self class) and: [ (self numerator * anObject denominator) = (self denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'SS 10/25/2021 12:24:59'!
hash

	^(self numerator hash / self denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'LD 10/25/2021 17:52:47'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator canBeANumerator.
	aDenominator canBeADenominator.
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'SS 10/25/2021 12:25:33'!
isNegative
	
	^self numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'SS 10/25/2021 12:26:15'!
printOn: aStream

	aStream 
		print: self numerator;
		nextPut: $/;
		print: self denominator ! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'SS 10/25/2021 12:24:27'!
beAddedToAFraccion: anAugend

	| newDenominator newNumerator |
	
	newNumerator := (anAugend denominator * self numerator) + (anAugend numerator * self denominator).
	newDenominator := anAugend denominator * self denominator.
	
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LD 10/25/2021 17:55:29'!
beAddedToAnEntero: anAugend
	
	^anAugend beAddedToAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LD 10/24/2021 16:58:23'!
beMultipliedToAFraccion: aMultiplicand

	^(aMultiplicand numerator * self numerator) / (aMultiplicand denominator * self denominator)! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LD 10/25/2021 17:55:22'!
beMultipliedToAnEntero: aMultiplicand
	
	^aMultiplicand beMultipliedToAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LD 10/24/2021 17:26:03'!
divideAFraccion: aDividend

	^(aDividend numerator * self denominator) / (aDividend denominator * self numerator)! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LD 10/24/2021 17:24:46'!
divideAnEntero: aDividend

	^(aDividend * self denominator) / self numerator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LD 10/24/2021 17:09:05'!
substractFromAFraccion: aMinuend

	| newNumerator newDenominator |

	newNumerator := (aMinuend numerator * self denominator) - (aMinuend denominator * self numerator).
	newDenominator := aMinuend denominator * self denominator.
	
	^newNumerator / newDenominator 

	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LD 10/25/2021 17:55:11'!
substractFromAnEntero: aMinuend
	
	^(aMinuend substractFromAFraccion: self) negated.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation - private' stamp: 'LD 10/24/2021 23:23:19'!
with: aDividend over: aDivisor

	^Fraccion new initializeWith: aDividend over: aDivisor.

	! !
