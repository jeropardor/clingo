
%* 
Genero una acción
action(move(Id,B)) :- block(Id, _), B=-6..6.
Tengo un único bloque horizontal
h(block("b",pos(0,2,1,2))).
h(horizontal("b")).
% Action generation
1 {o(A) : _action(A) } 1.
% Auxiliary (action attributes)
moved(Id,B) :- o(move(Id,B)).

% Inertia: 
h(block(Id1, pos(X1,Y1,X2,Y2))) :- 'h(block(Id1, pos(X1,Y1,X2,Y2))), not moved(Id1,_).
Y lo muevo
% Effect axioms (no inertia needed)
h(block(Id1, pos(X1+B,Y1,X2+B,Y2))) :- 'h(block(Id1, pos(X1,Y1,X2,Y2))), moved(Id1,B), horizontal(Id1).

El goal es este
#program final.
:- not goal.
goal :- h(block("b",pos(1,2,2,2))).
*%




% ------------------------------------------------------------------------------


% block(a..z).
action(move(B,N)) :- block(B, _, _), N=-n..n.


% ------------------------------------------------------------------------------


#program dynamic. % Transition from t-1 to 

% Axiomas de efecto
% h(sw(1),up) h(F,V) el fluente F tiene valor V
% o(A) = la accion A ha ocurrido

%* h(block(B,DX,DY),pos(X+N,Y)) :- o(move(B, N)), 'h(block(B,DX,DY),pos(X,Y)), DX > DY, X+N >= 0, X+N < n.
h(block(B,DX,DY),pos(X,Y+N)) :- o(move(B, N)), 'h(block(B,DX,DY),pos(X,Y)), DX > DY, X+N >= 0, X+N < n. *%

% h(block(B,Dx,Dy,R), N'+N) :- o(move(B, N)), 'h(block(B,Dx,Dy,R), N').
h(block(B,_,_,_), N'+N) :- o(move(B, N)), 'h(block(B,_,_,_), N').

% Inercia
h(F,V) :- 'h(F,V), not cambio(F).
cambio(F) :- 'h(F,V), h(F,W), V!=W. 


% una accion por instante
1 { o(A) : _accion(A) } 1.


#show h/2.
#show o/1.


% ------------------------------------------------------------------------------


#program initial. % At timepoint t=0

#const n=6.
#const goalY=4.
#const goalB=b.

%* h(block(a, 1, 3), pos(3,0)).
h(block(b, 2, 1), pos(0,2)). % h(block(b, 2, 1), pos(0,2)). 
h(block(c, 1, 2), pos(0,4)).
h(block(d, 3, 1), pos(2,4)).
h(block(e, 2, 1), pos(3,5)). *%

% h(block(a, 1, 3, 3), 0).
h(block(b, 2, 1, 2), 0). 
% h(block(c, 1, 2, 0), 4).
% h(block(d, 3, 1, 4), 2).
% h(block(e, 2, 1, 5), 3).

%*

...a..
...a..
bb.a..
......
c.ddd.
c..ee.
b=4

*%


% ------------------------------------------------------------------------------


#program final. % Last timepoint t=n-1

:- not goal.
goal :- h(block(goalB,_,_,_), goalY).