
% SIMULATE ---------------------------------------------------------------------

block(b).


#program initial.

h(bl(b),pos(0,2)).

% Sequence of performed actions
&tel{
    &true
    ;> o(m(b,1))
}.


#show h/2.
#show o/1.

