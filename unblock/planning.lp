% Constants
#const size=6.
#const blockGoal=b.
#const locGoal=4.

% Blocks
block(a).
block(b).
block(c).
block(d).
block(e).


% Initial state
#program initial.

h(bl(a,2,ver,3), 0).
h(bl(b,1,hor,2), 0).
h(bl(c,1,ver,0), 4).
h(bl(d,2,hor,4), 2).
h(bl(e,1,hor,5), 3).

% Goal
#program final.

goal :- h(bl(blockGoal,_,_,_), locGoal).
:- not goal.


#show move/2.
% #show usedBy/3.
% #show unused/2.
% #show reachable/2.


%*
...a..   a -> p: 3,0  d: 2  h(3,0)
...a..   b -> p: 0,2  d: 1  h(2,0)
bb.a..   c -> p: 0,4  d: 1  h(0,4)
......   d -> p: 2,4  d: 2  h(4,2)
c.ddd.   e -> p: 3,5  d: 1  h(5,3)
c..ee.
b=4
*%