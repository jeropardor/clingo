
#program initial.

h(light,on).
h(sw(X),up) :- switch(X).


#program final.

goal :- h(light,on),h(sw(1),down), h(sw(2),up),h(sw(3),down).
:- not goal.