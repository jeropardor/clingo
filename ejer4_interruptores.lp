% ejercicio de bombillas de diapositivas tema 1.
% problema de frame¿? de logica.

%{upA_0; upB_0; upC_0; light_0}. % state 0
%{upA_1; upB_1; upC_1; light_1}. % state 1 (next state)
%{toggleA; toggleB; toggleC} 1. % light switches

{ up(X, I) : switch(X), sit(I) }.
{ light(I) : sit(I) }.
{ toggle(X, I) : switch(X) } 1 :- sit(I), I!=0.

switch(a; b; c).
sit(0..1).


% toggleA ^ upA_0 -> not upA_1
:- switch(X), sit(I), toggle(X, I+1), up(X, I), up(X, I+1).
:- switch(X), sit(I), toggle(X, I+1), not up(X, I), not up(X, I+1).

:- switch(X), sit(I), toggle(X, I+1), light(I), light(I+1).
:- switch(X), sit(I), toggle(X, I+1), not light(I), not light(I+1).


% Axiomas de frame
:- switch(X), switch(Y), sit(I), toggle(X, I+1), X!=Y, up(Y, I), not up(Y, I+1).
:- switch(X), switch(Y), sit(I), toggle(X, I+1), X!=Y, not up(Y, I), up(Y, I+1).


%initial state
up(X, 0) :- switch(X).
light(0).
toggle(a, 1).

#show up/2.
#show light/1.