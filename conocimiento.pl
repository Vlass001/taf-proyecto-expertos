:- use_module(library(pce)).
:- use_module(library(pce_style_item)).

main:-
	new(Menu, dialog('Sistema experto de contratación', size(500,500))),
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

contrata(areaMatematicas):- areaMatematicas,!.
contrata(areaInformatica):- areaInformatica,!.
contrata(areaFisica):- areaFisica,!.
contrata(areaEstadistica):- areaEstadistica,!.

contrata(escSistemas):- escSistemas,!.
contrata(escMinas):- escMinas,!.
contrata(escCivil):- escCivil,!.
contrata(escFisma):- escFisma,!.
contrata('abc').

%________________DEPARTAMENTO ACADEMICO DE MATEMATICA Y FISICA________________________

%AREA DE MATEMATICAS__________________________________________________________________
%SISTEMAS -- Cálculo II
areaMatematicas :-
	contrata_areaMatematicas,
    contrata_escSistemas,
	pregunta('¿Tiene título profesional en Matemática o Ciencias Físico Matemáticas?'),
	pregunta('¿Tiene grado de maestro para la formación en el nivel de pregrado?'),
	pregunta('¿Tiene 5 años o más ejerciendo esa profesión?').
	
%MINAS - ANALISIS MATEMATICO I
areaMatematicas :-
	contrata_areaMatematicas,
    contrata_escMinas,
	pregunta('¿Tiene título profesional en Ciencias Físico Matematicas o afines?'),
	pregunta('¿Tiene grado de maestro para la formación en el nivel de pregrado?'),
	pregunta('¿Tiene 5 años o más ejerciendo esa profesión?').

%CIVIL - Analisis estructural II
areaMatematicas :-
	contrata_areaMatematicas,
    contrata_escCivil,
	pregunta('¿Tiene título profesional en Ciencias Físico Matematicas o afines?'),
	pregunta('¿Tiene grado de maestro para la formación en el nivel de pregrado?'),
	pregunta('¿Tiene 5 años o más ejerciendo esa profesión?').

%FISMA - Análisis Numérico II 
areaMatematicas :-
	contrata_areaMatematicas,
    contrata_escFisma,
	pregunta('¿Tiene título profesional en Ciencias Físico Matematicas o afines?'),
	pregunta('¿Tiene grado de maestro para la formación en el nivel de pregrado?'),
    pregunta('¿Tiene 5 años o más ejerciendo esa profesión?').


%AREA DE INFORMATICA_______________________________________________________ FALTA.....
%SISTEMAS -- 
areaInformatica :-
	contrata_areaInformatica,
    contrata_escSistemas,
	pregunta('¿Tiene título profesional en Matemática o Ciencias Físico Matemáticas?'),
	pregunta('¿Tiene grado de maestro para la formación en el nivel de pregrado?'),
	pregunta('¿Tiene 5 años o más ejerciendo esa profesión?').
	
%MINAS - 
areaInformatica :-
	contrata_areaInformatica,
    contrata_escMinas,
	pregunta('¿Tiene título profesional en Ciencias Físico Matematicas o afines?'),
	pregunta('¿Tiene grado de maestro para la formación en el nivel de pregrado?'),
	pregunta('¿Tiene 5 años o más ejerciendo esa profesión?').

%CIVIL - 
areaInformatica :-
	contrata_areaInformatica,
    contrata_escCivil,
	pregunta('¿Tiene título profesional en Ciencias Físico Matematicas o afines?'),
	pregunta('¿Tiene grado de maestro para la formación en el nivel de pregrado?'),
	pregunta('¿Tiene 5 años o más ejerciendo esa profesión?').

%FISMA - 
areaInformatica :-
	contrata_areaInformatica,
    contrata_escFisma,
	pregunta('¿Tiene título profesional en Ciencias Físico Matematicas o afines?'),
	pregunta('¿Tiene grado de maestro para la formación en el nivel de pregrado?'),
    pregunta('¿Tiene 5 años o más ejerciendo esa profesión?').


%AREA DE FISICA____________________________________________________________


%AREA DE ESTADISTICA____________________________________________________________



%desconocido :- se_desconoce_escuela.
contrata_areaMatematicas:-	pregunta('¿Postula a Área de matemáticas?').
contrata_areaFisica:-	pregunta('¿Postula a Área de física?').
contrata_areaEstadistica:-	pregunta('¿Postula a Área de estadística?').
contrata_areaInformatica:-	pregunta('¿Postula a Área de informática?').

contrata_escSistemas:-	pregunta('¿Postula a ing. Sistemas?').
contrata_escMinas:-	pregunta('¿Postula a ing. Minas?').
contrata_escCivil:-	pregunta('¿Postula a ing. Civil?').
contrata_escFisma:-	pregunta('¿Postula a Cs. Fisico matematicas?').


:-dynamic si/1,no/1.

preguntar(Problema):-new(Di, dialog('Contrata de Docente')),
	new(L2, label(texto, 'Responde las siguientes preguntas')),
	new(La, label(prob, Problema)),

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

pregunta(S):- (si(S)->true; (no(S)->fail; preguntar(S))).
limpiar:- retract(si(_)),fail.
limpiar:- retract(no(_)),fail.
limpiar.


botones :- lim,
	send(@boton,free),
	send(@btncarrera,free),
	contrata(Enter),
	send(@texto, selection('De acuerdo con las respuestas, el postulante, debe ser contratado para: ')),
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