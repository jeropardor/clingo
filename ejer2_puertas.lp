% which door shall we open? one truth, one lie:
% door 1:  a lasy is in this room and a tiger is in the other.
% door 2:  there is a lady in one room and a tiger in the other.

% t1: tiger in room 1.



% R1:                 s1 <-> (-t1 ^ t2)
%      s1 -> (-t1 ^ t2)        ^      (-t1 ^ t2) -> s1
%     -s1 v (-t1 ^ t2)         ^      -(-t1 ^ t2) v s1
%   (-s1 v -t1) ^ (-s1 v t2)   ^     (t1 v -t2 v s1)
%  :- s1, t1.    :- s1, not t2.    :- not t1, t2, not s1  


% R2:               s2 <-> (t1 ^ -t2) v (-t1 ^ t2)                    == (t1 v t2) ^ (-t2 v -t1)
%     s2 -> (t1 v t2)  ^  s2 -> (-t1 v -t2)   ^    ...
%     (-s2 v t1 v t2)  ^ `(-s2 v -t1 v -t2)   ^    ...
%     


{s1; s2; t1; t2}.

:- s1, t1.             % R1
:- s1, not t2.
:- not t1, t2, not s1.

:- s2, not t1, not t2. % R2
:- s2, t1, t2.
:- t1, not t2, not s2.
:- t2, not t1, not s2.

:- s1, s2.
:- not s1, not s2.   % R3: one truth, one lie
