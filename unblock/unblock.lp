



orientation(ver;hor).
n(0..(size-1)).

action(move(X,N)) :- block(X), N=-size..size.



#program always.

% casilla usada por el bloque B
usedBy(B, DirN,N..(N+Dim)) :- h(bl(B,Dim,ver,DirN), N).
usedBy(B, N..(N+Dim),DirN) :- h(bl(B,Dim,hor,DirN), N).
unused(X,Y) :- not usedBy(_,X,Y), _n(X), _n(Y).

reachable(B, Y)   :- h(bl(B,_,hor,DirN),_), usedBy(B,Y,DirN), _n(Y).
reachable(B, Y+1) :- h(bl(B,_,hor,DirN),_), reachable(B, Y), unused(Y+1,DirN).
reachable(B, Y-1) :- h(bl(B,_,hor,DirN),_), reachable(B, Y), unused(Y-1,DirN).

reachable(B, Y)   :- h(bl(B,_,ver,DirN),_), usedBy(B,DirN,Y), _n(Y).
reachable(B, Y+1) :- h(bl(B,_,ver,DirN),_), reachable(B, Y), unused(DirN,Y+1).
reachable(B, Y-1) :- h(bl(B,_,ver,DirN),_), reachable(B, Y), unused(DirN,Y-1).



#program dynamic.

% Auxiliar
move(B,N) :- o(move(B,N)).

% Effect axioms
h(bl(B,Dim,Dir,DirN), N+N') :- 'h(bl(B,Dim,Dir,DirN), N'), move(B,N), N>0, 'reachable(B,N+N'+Dim).
h(bl(B,Dim,Dir,DirN), N+N') :- 'h(bl(B,Dim,Dir,DirN), N'), move(B,N), N<0, 'reachable(B,N+N').

% Executability constraints: none in this case

% Inertia: c(F)= fluent F has changed
h(F,V) :- 'h(F,V), not c(F).
c(F) :- 'h(F,V), h(F,W), V!=W.

% Action generation
1 { o(A): _action(A) } 1.




#show move/2.