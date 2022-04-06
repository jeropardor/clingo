

digit(1..9).
row(0..8).
col(0..8).

% cell(X, Y, D) % row, column, digit
1 { cell(X, Y, D) : digit(D) } 1 :- col(X), row(Y). % for each pair X,Y -> one solution 


% rules
:- cell(X,Y,D), cell(X,Z,D), Y!=Z. % not the same number in the same row
:- cell(X,Y,D), cell(Z,Y,D), X!=Z. % not the same number in the same column
:- cell(X,Y,D), cell(Z,T,D), X/3=Z/3, Y/3=T/3, X!=Z, Y!=T. % not in the same region


#show cell/3.
