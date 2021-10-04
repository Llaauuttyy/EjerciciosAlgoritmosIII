!classDefinition: #NPC category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #NPC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NPC class' category: 'Ejercicio1-PNJ-Episodio2'!
NPC class
	instanceVariableNames: 'frasesAResponderSegunLaOpinionDelPueblo cantidadDeInteraccionesRealizadasSegunPersonaje'!

!NPC class methodsFor: 'interacciones - privado' stamp: 'LD 10/3/2021 21:20:25'!
recordarInteraccionDe: unPersonajeJugador
	| cantidadDeInteraccionesDeUnPersonajeJugador | 
	
	cantidadDeInteraccionesDeUnPersonajeJugador  := cantidadDeInteraccionesRealizadasSegunPersonaje at: unPersonajeJugador ifAbsent: [0].
	
	cantidadDeInteraccionesRealizadasSegunPersonaje at: unPersonajeJugador put: cantidadDeInteraccionesDeUnPersonajeJugador  + 1.	! !

!NPC class methodsFor: 'interacciones - privado' stamp: 'LD 10/3/2021 21:19:43'!
responderSegunCantidadDeInteraccionesYOpinionDelPuebloDe: unPersonajeJugador
	| fraseAResponderSegunLaCantidadDeInteraccionesYLaOpinionDelPueblo frasesSegunLaCalificacionDeUnPeronsajeJugador calificacionDeUnPersonajeJugador numeroDeFraseAResponderSegunLaInteraccion |
	
	calificacionDeUnPersonajeJugador := PuebloDeRiverwood reconocerCalificacionDe: unPersonajeJugador.
	
	frasesSegunLaCalificacionDeUnPeronsajeJugador := frasesAResponderSegunLaOpinionDelPueblo at: calificacionDeUnPersonajeJugador.
	
	numeroDeFraseAResponderSegunLaInteraccion := (cantidadDeInteraccionesRealizadasSegunPersonaje at: unPersonajeJugador) min: 	frasesSegunLaCalificacionDeUnPeronsajeJugador size.
	
	fraseAResponderSegunLaCantidadDeInteraccionesYLaOpinionDelPueblo := frasesSegunLaCalificacionDeUnPeronsajeJugador at: 	numeroDeFraseAResponderSegunLaInteraccion.
	
	^ fraseAResponderSegunLaCantidadDeInteraccionesYLaOpinionDelPueblo.! !


!NPC class methodsFor: 'interacciones' stamp: 'LD 10/3/2021 21:20:44'!
olvidarCantidadDeInteraccionesCon: unPersonajeJugador
	cantidadDeInteraccionesRealizadasSegunPersonaje at: unPersonajeJugador put: 0.! !

!NPC class methodsFor: 'interacciones' stamp: 'LD 10/3/2021 21:05:40'!
olvidarTodasLasInteracciones
	cantidadDeInteraccionesRealizadasSegunPersonaje  := Dictionary new.! !


!NPC class methodsFor: 'as yet unclassified' stamp: 'LD 10/3/2021 21:24:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesAResponderSegunLaOpinionDelPueblo := nil.
	cantidadDeInteraccionesRealizadasSegunPersonaje := nil.! !


!classDefinition: #CarolinaLaCuranderaDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
NPC subclass: #CarolinaLaCuranderaDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeRiverwood class
	instanceVariableNames: ''!

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'LD 9/30/2021 18:00:50'!
esAptoParaSerPrometedor: unPersonajeJugador
	
	^ (self llegoAlMaximoDeInteraccionesCon: unPersonajeJugador) & (	self esDesconocidoPorElPueblo: unPersonajeJugador).! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'LD 9/30/2021 17:46:28'!
esDesconocidoPorElPueblo: unPersonajeJugador
	| calificacionDeUnPersonajeJugador |
	
	calificacionDeUnPersonajeJugador := (PuebloDeRiverwood reconocerCalificacionDe: unPersonajeJugador).
	
	^ calificacionDeUnPersonajeJugador = 'desconocido'.
	! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'LD 9/30/2021 18:00:50'!
llegoAlMaximoDeInteraccionesCon: unPersonajeJugador
	| cantidadDeInteraccionesDeUnPersonajeJugador calificacionDeUnPersonajeJugador cantidadDeInteraccionesRequeridasDeUnPersonajeJugador |
	
	cantidadDeInteraccionesDeUnPersonajeJugador := cantidadDeInteraccionesRealizadasSegunPersonaje at: unPersonajeJugador.
	
	calificacionDeUnPersonajeJugador := PuebloDeRiverwood reconocerCalificacionDe: unPersonajeJugador.
	
	cantidadDeInteraccionesRequeridasDeUnPersonajeJugador := (frasesAResponderSegunLaOpinionDelPueblo at: calificacionDeUnPersonajeJugador) size.
	
	^ cantidadDeInteraccionesRequeridasDeUnPersonajeJugador  = cantidadDeInteraccionesDeUnPersonajeJugador.
	! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'LD 10/3/2021 21:21:09'!
pensarSiPuedeSerPrometedor: unPersonajeJugador

	(self esAptoParaSerPrometedor: unPersonajeJugador ) 
	ifTrue: [
		PuebloDeRiverwood verPrometedorA: unPersonajeJugador.
		self olvidarCantidadDeInteraccionesCon: unPersonajeJugador.
		].
	! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'LD 9/30/2021 18:14:03'!
interactuarCon: unPersonajeJugadorAInteractuar
	| respuestaSegunCantidadDeInteraccionesDeUnPersonajeJugadorAInteractuar |
	
	self recordarInteraccionDe: unPersonajeJugadorAInteractuar.
	
	respuestaSegunCantidadDeInteraccionesDeUnPersonajeJugadorAInteractuar := self responderSegunCantidadDeInteraccionesYOpinionDelPuebloDe: 	unPersonajeJugadorAInteractuar.
	
	self pensarSiPuedeSerPrometedor: unPersonajeJugadorAInteractuar.
	
	^ respuestaSegunCantidadDeInteraccionesDeUnPersonajeJugadorAInteractuar.! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'LD 10/3/2021 21:24:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesAResponderSegunLaOpinionDelPueblo := ((Dictionary new) add: ('desconocido'->#('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' )); add: ('prometedor'->#('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' )); yourself).
	cantidadDeInteraccionesRealizadasSegunPersonaje := ((Dictionary new) add: (#Hamilton->0); yourself).! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
NPC subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: ''!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'LD 9/30/2021 18:05:22'!
interactuarCon: unPersonajeJugadorAInteractuar
	self recordarInteraccionDe: unPersonajeJugadorAInteractuar.
	^ self responderSegunCantidadDeInteraccionesYOpinionDelPuebloDe: unPersonajeJugadorAInteractuar.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'LD 10/3/2021 21:24:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesAResponderSegunLaOpinionDelPueblo := ((Dictionary new) add: ('desconocido'->#('Hola forastero' '¿Todo bien?' '¿Algún problema?' )); add: ('prometedor'->#('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' )); yourself).
	cantidadDeInteraccionesRealizadasSegunPersonaje := ((Dictionary new) add: (#Hamilton->3); add: (#Tirion->3); yourself).! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'LD 10/3/2021 20:41:45'!
carolinaLaCurandera
	^ CarolinaLaCuranderaDeRiverwood.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'LD 10/3/2021 20:41:39'!
hamilton
	^ #Hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'LD 10/3/2021 20:41:33'!
tirion
	^ #Tirion.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'LD 9/28/2021 22:44:17'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	| visionPorElPuebloDeUnPersonaje |
	
	visionPorElPuebloDeUnPersonaje := PuebloDeRiverwood reconocerCalificacionDe: unPersonaje.
	
	^ (visionPorElPuebloDeUnPersonaje = 'prometedor').! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'LD 9/30/2021 17:58:32'!
hacerQueLaCuranderaOlvideSusInteracciones
	CarolinaLaCuranderaDeRiverwood olvidarTodasLasInteracciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'LD 9/28/2021 20:54:27'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloDeRiverwood olvidarTodasLasCalificaciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'LD 10/3/2021 20:41:20'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloDeRiverwood verPrometedorA: self hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'LD 9/30/2021 17:58:32'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidarTodasLasInteracciones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'ld 9/27/2021 21:22:54'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'LD 10/3/2021 20:40:44'!
hamilton
	^ #Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'LD 10/3/2021 20:40:36'!
tirion
	^ #Tirion.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'LD 9/30/2021 17:58:32'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidarTodasLasInteracciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'LD 9/28/2021 23:14:17'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloDeRiverwood olvidarTodasLasCalificaciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'LD 10/3/2021 20:40:19'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloDeRiverwood verPrometedorA: self hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PuebloDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PuebloDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuebloDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
PuebloDeRiverwood class
	instanceVariableNames: 'opinionesDelPueblo'!

!PuebloDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'LD 10/3/2021 21:24:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	opinionesDelPueblo := ((Dictionary new)).! !

!PuebloDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'LD 9/28/2021 20:35:17'!
olvidarTodasLasCalificaciones
 	opinionesDelPueblo := Dictionary new.! !

!PuebloDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'LD 9/28/2021 20:35:03'!
reconocerCalificacionDe: unPersonajeJugadorAReconocer
	^opinionesDelPueblo at: unPersonajeJugadorAReconocer ifAbsent: ['desconocido'].! !

!PuebloDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'LD 9/30/2021 18:19:46'!
verPrometedorA: unPersonajeJugadorACalificar

	opinionesDelPueblo at: unPersonajeJugadorACalificar put: 'prometedor'.
	
	TreborElGuardiaDeSkyrim olvidarCantidadDeInteraccionesCon: unPersonajeJugadorACalificar.! !

NPC initializeAfterFileIn!
CarolinaLaCuranderaDeRiverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!
PuebloDeRiverwood initializeAfterFileIn!