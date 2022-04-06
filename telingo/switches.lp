
switch(1..3).
action(tog(X)) :- switch(X).
opp(on,off). opp(up,down).
opp(X,Y) :- opp(Y,X).

#program dynamic.

% Axiomas de efecto
% h(sw(1),up) h(F,V) el fluente F tiene valor V
% o(A) = la accion A ha ocurrido

h(sw(X), W) :- o(tog(X)), 'h(sw(X), V), _opp(V,W). % si el interruptor X tenía el valor up y togle, entonces ahora está down
h(light, W) :- o(tog(_)), 'h(light, V), _opp(V,W). % _pred() = estado inicial, atemporal


% Inercia
h(F,V) :- 'h(F,V), not cambio(F). % si en el estado anterior tenia V y no cambio sigue en V
cambio(F) :- 'h(F,V), h(F,W), V!=W. 


1 {o(A) : _accion(A) } 1.


#show h/2.
#show o/1.




