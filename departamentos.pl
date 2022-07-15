:- use_module(library(pce)).
:- use_module(library(pce_style_item)).

main:-
	new(Menu, dialog('Sistema experto de hospital', size(500,500))),
	new(L, label(nombre, 'Bienvenidos a su diagnostico')),
	new(@texto, label(nombre, 'Segun la respuestas dadas tendra su resultado:')),
	new(@respl, label(nombre, '')),
	new(Salir, button('Salir', and(message(Menu,destroy), message(Menu, free)))),
	new(@boton, button('Realizar test', message(@prolog, botones))),
	send(Menu, append(L)), new(@btncarrera, button('¿Diagnostico?')),
	send(Menu,display,L,point(100,20)),
	send(Menu,display,@boton,point(130,150)),
	send(Menu,display,@texto,point(50,100)),
	send(Menu,display,Salir,point(20,400)),
	send(Menu,display,@respl,point(20,130)),
	send(Menu,open_centered).

enfermedades(depMatematicas):- depMatematicas,!.
enfermedades(escSistemas):- escSistemas,!.
enfermedades(escMinas):- escMinas,!.
enfermedades('hhhh').

depMatematicas :-
	contrata_depMatematicas,
    contrata_escSistemas,
	pregunta('¿aaa?'),
	pregunta('¿aaa1?').

depMatematicas :-
	contrata_depMatematicas,
    contrata_escMinas,
	pregunta('¿bbb?').

%desconocido :- se_desconoce_enfermedad.
contrata_depMatematicas:-	pregunta('¿Postula a dep mate?').
contrata_escSistemas:-	pregunta('¿Postula a es Sistemas?').
contrata_escMinas:-	pregunta('¿Postula a es Minas?').


:-dynamic si/1,no/1.

preguntar(Problema):-new(Di, dialog('Examen Medico')),
	new(L2, label(texto,'Responde las siguientes preguntas')),
	new(La, label(prob,Problema)),

	new(B1,button(si,and(message(Di,return,si)))),
	new(B2,button(no,and(message(Di,return,no)))),

	send(Di,append(L2)),
	send(Di,append(La)),
	send(Di,append(B1)),
	send(Di,append(B2)),

	send(Di,default_button,si),
	send(Di,open_centered),
	get(Di,confirm,Answer),
	write(Answer),send(Di,destroy),


	((Answer==si)->assert(si(Problema)); assert(no(Problema)),fail).

pregunta(S):- (si(S)->true; (no(S)->fail;preguntar(S))).
limpiar:- retract(si(_)),fail.
limpiar:- retract(no(_)),fail.
limpiar.


botones :-lim,
	send(@boton,free),
	send(@btncarrera,free),
	enfermedades(Enter),
	send(@texto, selection('De acuerdo con sus respuestas,usted padece de:')),
	send(@respl, selection(Enter)),
	new(@boton, button('Iniciar su evaluación', message(@prolog, botones))),
	send(Menu,display,@boton,point(40,50)),
	send(Menu,display,@btncarrera,point(20,50)),
	limpiar.

lim:- send(@respl, selection('')).

limpiar2:-
	send(@texto,free),
	send(@respl,free),
	send(@boton,free).
