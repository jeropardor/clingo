% python3 display.py einstein.lp drawpuzzle.lp  

house(1..5).

type(pet, (dog;fish;bird;horse;cat)).
type(person, (dane;swede;brit;german;norw)).
type(color, (blue;red;white;green;yellow)).
type(tobaco, (pall;dunhill;bluemast;prince;blends)).
type(drink, (tea;water;milk;beer;coffee)).

1 {at(T,V,H) : house(H)} 1 :- type(T,V). % para cada casa y tipo escoge 1 y solo 1 persona
:- at(T,V,H), at(T,V',H), V!=V'.

%  1: The Brit lives in the red house.
:- at(person,brit,X), not at(color,red,X).
%  2: The Swede keeps dogs as pets.
:- at(person,swede,X), not at(pet,dog,X).
%  3: The Dane drinks tea.
:- at(person,dane,X), not at(drink,tea,X).
%  4: The green house is on the immediate left of the white house.
:- at(color,green,X), not at(color,white,X+1).
%  5: The green house’s owner drinks coffee.
:- at(color,green,X), not at(drink,coffee,X).
%  6: The owner who smokes Pall Mall rears birds.
:- at(tobaco,pall,X), not at(pet,bird,X).
%  7: The owner of the yellow house smokes Dunhill.
:- at(color, yellow,X), not at(tobaco,dunhill,X).
%  8: The owner living in the center house drinks milk.
at(drink,milk,3).
%  9: The Norwegian lives in the first house.
at(person,norw,1).
% 10: The Blends smoker is neighbor of the one who keeps cats.
:- at(tobaco,blends,X), not at(pet,cat,X-1), not at(pet,cat,X+1).
% 11: The horse keeper is neighbor of the one who smokes Dunhill.
:- at(pet,horse,X), not at(tobaco,dunhill,X-1), not at(tobaco,dunhill,X+1).
% 12: The owner who smokes Bluemasters drinks beer.
:- at(tobaco,bluemast,X), not at(drink,beer,X).
% 13: The German smokes Prince.
:- at(person,german,X), not at(tobaco,prince,X).
% 14: The Norwegian lives next to the blue house.
:- at(color,blue,X), not at(person,norw,X-1), not at(person,norw,X+1).
% 15: The Blends smoker lives next to the one who drinks water.
:- at(tobaco,blends,X), not at(drink,water,X-1), not at(drink,water,X+1).




#show at/3.