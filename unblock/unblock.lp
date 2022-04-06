

% ------------------------------------------------------------------------------


% block(a..z).
action(m(B,N)) :- block(B), N=-6..6.


% ------------------------------------------------------------------------------

#program dynamic. % Transition from t-1 to 

% Auxiliar
% moved(B,N) :- o(m(B,N)).

% Axiomas de efecto
h(bl(B),pos(X+N,Y)) :- o(m(B,N)), 'h(bl(B),pos(X,Y)).
% h(block(B, ver), pos(X,Y+N)) :- moved(B,N), 'h(block(B, ver), pos(X,Y)).


% Action generation
1 { o(A) : _accion(A) } 1.

% Inertia: c(F)= fluent F has changed
h(F,V) :- 'h(F,V), not c(F).
c(F) :- 'h(F,V), h(F,W), V!=W.

















% PLANNING ---------------------------------------------------------------------
%* 
#program initial. % At timepoint t=0

h(block(b,2,1,hor), pos(0,2)).

#program final. % Last timepoint t=n-1

:- not goal.
goal :- h(block(b,2,1), pos(4,2)).

#show moved/2. *%





%*
...a..
...a..
bb.a..
......
c.ddd.
c..ee.
b=4
*%
