wrote(crichton, jurassic_park).
wrote(crichton, sphere).
wrote(coupland, microserfs).

/* 
| ?- wrote(crichton, What). 
What = jurassic_park ? a

What = sphere

yes
*/

position(manning, quarterback).
position(brady, quarterback).
position(zetterberg, center).
position(datsyuk, left_wing).
position(owens, receiver).

has_position(football, quarterback).
has_position(football, receiver).
has_position(hockey, left_wing).
has_position(hockey, right_wing).
has_position(hockey, center).

plays(X, Z) :- position(X, Y), has_position(Z, Y). 

/* 
| ?- plays(Who, football). 
Who = manning ? a

Who = brady

Who = owens

yes

| ?- plays(zetterberg, What). 

What = hockey

yes
*/