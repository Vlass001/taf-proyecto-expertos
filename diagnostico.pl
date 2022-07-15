
:- use_module(library(jpl)).

start:-
		write('-----------------------------------------------------------------'),nl,
		write('*****************************************************************'),nl,
		write("###################||| EXPERT SYSTEM |||#########################"),nl,
		write('*****************************************************************'),nl,
		write('-----------------------------------------------------------------'),nl,nl,nl,
        /*write("Hola. �Como estas? Primero que nada dime tu nombre por favor : "),
        read(Postulante),*/

		interface2.

		%Areas de postulacion
	requisitos(Postulante, areaMatematicas) :- verificar(Postulante, "postula a area de matematicas (si/no)?").
	requisitos(Postulante, areaInformatica) :- verificar(Postulante, "postula a area de informatica (si/no)?").
	requisitos(Postulante, areaEstadistica) :- verificar(Postulante, "postula a area de estadistica (si/no)?").
	requisitos(Postulante, areaFisica) :- verificar(Postulante, "postula a area de fisica (si/no)?").

	%Escuelas de postulacion
	requisitos(Postulante, sistemas) :- verificar(Postulante, "postula a ing. sistemas (si/no)?").
	requisitos(Postulante, minas) :- verificar(Postulante, "postula a ing. minas (si/no)?").
	requisitos(Postulante, civil) :- verificar(Postulante, "postula a ing. civil (si/no)?").
	requisitos(Postulante, fisma) :- verificar(Postulante, "postula a cs. fisma (si/no)?").


	requisitos(Postulante, ps1) :- verificar(Postulante, "tiene titulo profesional en Matemática o ciencias fisico Matemáticas?").
	requisitos(Postulante, ps2) :- verificar(Postulante, "tiene título profesional en Matemática o ciencias fisico Matemáticas?").
	requisitos(Postulante, ps3) :- verificar(Postulante, "tiene 5 años o más ejerciendo esta profesión?").


	hipotesis(Postulante, area_Matematicas) :- 
		requisitos(Postulante, areaMatematicas),
		((requisitos(Postulante, sistemas),
		(requisitos(Postulante, ps1),
		requisitos(Postulante, ps2),
		requisitos(Postulante, ps3), undo));

		(requisitos(Postulante, minas),
		(requisitos(Postulante, ps1),
		requisitos(Postulante, ps2),
		requisitos(Postulante, ps3), undo));
		
		requisitos(Postulante, civil);
		requisitos(Postulante, fisma)); fail.

	hipotesis(Postulante, area_Informatica) :- 
		requisitos(Postulante, areaInformatica),
		(requisitos(Postulante, sistemas);
		requisitos(Postulante, minas);
		requisitos(Postulante, civil);
		requisitos(Postulante, fisma)).
		
	hipotesis(Postulante, area_Estadistica) :- 
		requisitos(Postulante, areaEstadistica),
		(requisitos(Postulante, minas);
		requisitos(Postulante, sistemas);
		requisitos(Postulante, civil);
		requisitos(Postulante, fisma)).

	hipotesis(Postulante, area_Fisica) :- 
		requisitos(Postulante, areaFisica),
		(requisitos(Postulante, sistemas);
		requisitos(Postulante, minas);
		requisitos(Postulante, civil);
		requisitos(Postulante, fisma)).


	hipotesis(_," enfermedad. Pero lo siento, parece que no puedo diagnosticar la dicha enfermedad").

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


pt(Postulante):-
        hipotesis(Postulante, Profesion),
		interface3(Postulante,', puede contratarse para ', Profesion,'.'),
        write(Postulante),write(', tu probablemente tengas '),write(Profesion),write('.'),undo,end.
end :-
		nl,
		write('*****************************************************************'),
		nl.

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['Contratacion de docentes'], F),
	jpl_new('javax.swing.JLabel',['---Sistema test de Contratacion de docentes ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _),
	write(N),nl,
	( (N == si ; N == s) ->
       assert(si(Z)) ;
       assert(no(Z)), fail).

interface2 :-
	jpl_new('javax.swing.JFrame', ['Contratacion de docentes'], F),
	jpl_new('javax.swing.JLabel',['--- Sistema test de Contratacion de docentes ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Por favor, ingrese el nombre de postulante'], N),
	jpl_call(F, dispose, [], _),
	/*write(N),nl,*/
	(	N == @(null)
		->	write('cancelaste'),interface3('cancelaste. ','gracias ','por ','postular.'),end,fail
		;	write("Hola. Como estas? Primero que nada dime tu nombre por favor : "),write(N),nl,pt(N)
	).


interface3(P, W1, D, W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['Contratacion de docentes'], F),
	jpl_new('javax.swing.JLabel',['--- Sistema test de Contratacion de docentes ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _),
	
	(	N == @(void)
		->	write('')
		;	write("")
	).

help :- write("To start the expert system please type 'start.' and press Enter key").
