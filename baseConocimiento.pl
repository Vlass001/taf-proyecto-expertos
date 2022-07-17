
:- use_module(library(jpl)).

start:-
	nl.

	requisitos(Postulante, areaMatematicas) :- verificar(Postulante, "postula a area de matematicas (si/no)?").
	requisitos(Postulante, areaInformatica) :- verificar(Postulante, "postula a area de informatica (si/no)?").
	requisitos(Postulante, areaEstadistica) :- verificar(Postulante, "postula a area de estadistica (si/no)?").
	requisitos(Postulante, areaFisica) :- verificar(Postulante, "postula a area de fisica (si/no)?").

	
	requisitos(Postulante, sistemas) :- verificar(Postulante, "postula a ing. sistemas (si/no)?").
	requisitos(Postulante, minas) :- verificar(Postulante, "postula a ing. minas (si/no)?").
	requisitos(Postulante, civil) :- verificar(Postulante, "postula a ing. civil (si/no)?").
	requisitos(Postulante, fisma) :- verificar(Postulante, "postula a cs. fisma (si/no)?").

	requisitos(Postulante, pam1) :- verificar(Postulante, "tiene titulo profesional en Matematica o ciencias fisico Matematicas?").
	requisitos(Postulante, pam2) :- verificar(Postulante, "tiene ttulo profesional en Matematica o ciencias fisico Matematicas?").
	requisitos(Postulante, pam3) :- verificar(Postulante, "tiene 5 annos o mas ejerciendo esta profesion?").

    requisitos(Postulante, pai1) :- verificar(Postulante,"tiene titulo profesional de ingeniero de sistemas o afin (si/no)?").
	requisitos(Postulante, pai2) :- verificar(Postulante, "tiene grado de maestro para la formacion en el nivel de pregrado (si/no)?").
	requisitos(Postulante, pai3) :- verificar(Postulante, "tiene 5 annos o mas ejerciendo esa profesion (si/no)?").
	
    requisitos(Postulante, pae1) :- verificar(Postulante,"tiene titulo profesional en Ciencias Fisico Matematicas o afines (si/no)?").
	requisitos(Postulante, pae2) :- verificar(Postulante, "tiene grado de maestro para la formacion en el nivel de pregrado (si/no)?").
	requisitos(Postulante, pae3) :- verificar(Postulante, "tiene 5 annos o mas ejerciendo esa profesion (si/no)?").
	
    requisitos(Postulante, paf1) :- verificar(Postulante,"tiene titulo profesional en Fisica o afines (si/no)?").
	requisitos(Postulante, paf2) :- verificar(Postulante, "tiene grado de maestro para la formacion en el nivel de pregrado (si/no)?").
	requisitos(Postulante, paf3) :- verificar(Postulante, "tiene 5 annos o mas ejerciendo esa profesion (si/no)?").

	hipotesis(Postulante, area_Matematicas) :- 
		requisitos(Postulante, areaMatematicas),
		((requisitos(Postulante, sistemas),
		(requisitos(Postulante, pam1),
		requisitos(Postulante, pam2),
		requisitos(Postulante, pam3), undo));

		(requisitos(Postulante, minas),
		(requisitos(Postulante, pam1),
		requisitos(Postulante, pam2),
		requisitos(Postulante, pam3), undo));
		
		(requisitos(Postulante, civil),
        (requisitos(Postulante, pam1),
		requisitos(Postulante, pam2),
		requisitos(Postulante, pam3), undo));

		(requisitos(Postulante, fisma),
        (requisitos(Postulante, pam1),
		requisitos(Postulante, pam2),
		requisitos(Postulante, pam3), undo))); fail.

	hipotesis(Postulante, area_Informatica) :- 
		requisitos(Postulante, areaInformatica),
		((requisitos(Postulante, sistemas),
		(requisitos(Postulante, pai1),
		requisitos(Postulante, pai2),
		requisitos(Postulante, pai3), undo));

		(requisitos(Postulante, minas),
		(requisitos(Postulante, pai1),
		requisitos(Postulante, pai2),
		requisitos(Postulante, pai3), undo));
		
		(requisitos(Postulante, civil),
        (requisitos(Postulante, pai1),
		requisitos(Postulante, pai2),
		requisitos(Postulante, pai3), undo));

		(requisitos(Postulante, fisma),
        (requisitos(Postulante, pai1),
		requisitos(Postulante, pai2),
		requisitos(Postulante, pai3), undo))); fail.

		
	hipotesis(Postulante, area_Estadistica) :- 
		requisitos(Postulante, areaEstadistica),
		((requisitos(Postulante, sistemas),
		(requisitos(Postulante, pae1),
		requisitos(Postulante, pae2),
		requisitos(Postulante, pae3), undo));

		(requisitos(Postulante, minas),
		(requisitos(Postulante, pae1),
		requisitos(Postulante, pae2),
		requisitos(Postulante, pae3), undo));
		
		(requisitos(Postulante, civil),
        (requisitos(Postulante, pae1),
		requisitos(Postulante, pae2),
		requisitos(Postulante, pae3), undo));

		(requisitos(Postulante, fisma),
        (requisitos(Postulante, pae1),
		requisitos(Postulante, pae2),
		requisitos(Postulante, pae3), undo))); fail.

	hipotesis(Postulante, area_Fisica) :- 
		requisitos(Postulante, areaFisica),
		((requisitos(Postulante, sistemas),
		(requisitos(Postulante, paf1),
		requisitos(Postulante, paf2),
		requisitos(Postulante, paf3), undo));

		(requisitos(Postulante, minas),
		(requisitos(Postulante, paf1),
		requisitos(Postulante, paf2),
		requisitos(Postulante, paf3), undo));
		
		(requisitos(Postulante, civil),
        (requisitos(Postulante, paf1),
		requisitos(Postulante, paf2),
		requisitos(Postulante, paf3), undo));

		(requisitos(Postulante, fisma),
        (requisitos(Postulante, paf1),
		requisitos(Postulante, paf2),
		requisitos(Postulante, paf3), undo))); fail.

	hipotesis(_,"Lo sentimos, Ud. no puede ser contratado"), fail.

    response(Reply) :-
        read(Reply),
        write(Reply),nl.

preguntar(Postulante, Pregunta) :-
	interface(', ', Postulante, Pregunta),
    nl.

:- dynamic si/1,no/1.

verificar(P, S) :-
   (si(S) -> true ;
    (si(S) -> fail ;
     preguntar(P, S))).

undo :- retract(si(_)),fail.
undo :- retract(no(_)),fail.
undo.


pt(Postulante) :-
        hipotesis(Postulante, Profesion),
		interface3(Postulante,', puede contratarse para ', Profesion,'.'),undo.

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['ss'], F),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N,'INFORMATION_MESSAGE'),
	jpl_call(F, dispose, [], _),
	write(N),nl,
	( (N == si ; N == s) ->
       assert(si(Z)) ;
       assert(no(Z)), fail).

help :- write("To start the expert system please type 'start.' and press Enter key").
