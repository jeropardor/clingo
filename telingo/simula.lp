% test

#program initial.
h(light,off).
h(sw(X),up) :- switch(X).

% &... secuencia de acciones
% ;> = operador de secuencia
&tel { 
    &true
    ;> o(tog(1)) 
    ;> o(tog(3))
    ;> o(tog(1))
}.

