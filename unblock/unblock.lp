

% -- Exercise 2: UNBLOCK PUZZLE ------------------------------------------------
% -- author1: Jeronimo Pardo Rodriguez -  j.pardor@udc.es 
% -- author2: Maria Martinez Sotelo    -  maria.martinezs@udc.es 



orientation(ver;hor).
n(0..(size-1)).

action(mo(X,N)) :- block(X), N=-size..size.



#program always.

% cell (X,Y) used by block B 
usedBy(B, DirN,N..(N+Dim)) :- h(bl(B,Dim,ver,DirN), N).
usedBy(B, N..(N+Dim),DirN) :- h(bl(B,Dim,hor,DirN), N).
unused(X,Y) :- not usedBy(_,X,Y), _n(X), _n(Y).

% neighbour numbers
nh(Y, Y') :- _n(Y), _n(Y'), Y=Y'+1.
nh(Y, Y') :- _n(Y), _n(Y'), Y=Y'-1. 

% reachable column X by horizontal block B 
reachable(B, X)   :- h(bl(B,_,hor,DirN),_), usedBy(B,X,DirN), _n(X).
reachable(B, X') :- h(bl(B,_,hor,DirN),_), reachable(B, X), unused(X',DirN), nh(X,X').
% reachable row num Y by vertical block B 
reachable(B, Y)   :- h(bl(B,_,ver,DirN),_), usedBy(B,DirN,Y), _n(Y).
reachable(B, Y') :- h(bl(B,_,ver,DirN),_), reachable(B, Y), unused(DirN,Y'), nh(Y,Y').



#program dynamic.

% Auxiliar
move(B,N) :- o(mo(B,N)).

% Effect axioms
h(bl(B,Dim,Dir,DirN), N+N') :- 'h(bl(B,Dim,Dir,DirN), N'), move(B,N), N>0, 'reachable(B,N+N'+Dim).
h(bl(B,Dim,Dir,DirN), N+N') :- 'h(bl(B,Dim,Dir,DirN), N'), move(B,N), N<0, 'reachable(B,N+N').

% Inertia:
h(F,V) :- 'h(F,V), not c(F).
c(F) :- 'h(F,V), h(F,W), V!=W.

% Action generation
1 { o(A): _action(A) } 1.



#show move/2.