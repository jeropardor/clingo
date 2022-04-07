

% SIMULATE ---------------------------------------------------------------------

#const size=6.
#const blockGoal=b.
#const locGoal=4.

% Blocks
block(a).
block(b).
block(c).
block(d).
block(e).

#program initial.

h(bl(a,2,ver,3), 0).
h(bl(b,1,hor,2), 0).
h(bl(c,1,ver,0), 4).
% h(bl(d,2,hor,4), 2).
% h(bl(e,1,hor,5), 3).

% Sequence of performed actions
&tel{
    &true
    ;> o(move(a,3))
    ;> o(move(b,4))
}.


% #show h/2.
% #show o/1.
#show move/2.

#show usedBy/3.
% #show reached/2.
% #show validFor/2.
% #show reachable/2.
% #show unused/2.

%*
...a..   a -> p: 3,0  d: 1,3
...a..   b -> p: 0,2  d: 2,1
bb.a..   c -> p: 0,4  d: 1,2
......   d -> p: 2,4  d: 3,1
c.ddd.   e -> p: 3,5  d: 2,1
c..ee.
b=4
*%