
% -- Exercise 1: HITORI PUZZLE -------------------------------------------------
% -- author1: Jeronimo Pardo Rodriguez -  j.pardor@udc.es 
% -- author2: Maria Martinez Sotelo    -  maria.martinezs@udc.es 

row(0..n). 
col(0..n).
digit(1..9;a;b;c).


% removed cells
color(black; white).
1 { type(X, Y, T) : color(T)} 1 :- col(X), row(Y).


% rules:

% 1. non repeating white cells with the same number in any row or column
:- cell(X,Y,D), cell(X,Y',D), type(X,Y,white), type(X,Y',white), Y!=Y'. % same column
:- cell(X,Y,D), cell(X',Y,D), type(X,Y,white), type(X',Y,white), X!=X'. % same row

% 2. Black (removed) cells cannot be horizontally or vertically adjacent
:- type(X,Y,black), type(X,Y+1,black). % same column
:- type(X,Y,black), type(X,Y-1,black). 
:- type(X,Y,black), type(X,Y-1,black). % same row
:- type(X,Y,black), type(X-1,Y,black). 

% 3. All white cells must be connected altogether: we must be able to reach any 
%    white cell from another by vertical or horizontal movements through white cells.
:- type(X,Y,white), not type(X,Y+1,white), not type(X,Y-1,white), 
    not type(X+1,Y,white), not type(X-1,Y,white).

% #show col/1.
#show cell/3.
#show type/3.