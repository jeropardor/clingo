% There are one lady and 2 tigers, At most, one sign tells the truth. Which door shall we open?
% P1: there is a tiger in this room.
% P2: there is a lady in this room.
% P3: there is a tiger in room 2.

2 {t1; t2; t3} 2. % 2 tigers
0 {p1; p2; p3} 1. % 0 or 1 door tell the truth

% P1: p1 <-> t1
:- p1, not t1.
:- t1, not p1.

% P2: p2 <-> -t2
:- p2, t2.
:- not t2, not p2.

% P3: p3 <-> t2
:- p3, not t2.
:- t2, not p3.

