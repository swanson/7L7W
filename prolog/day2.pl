my_reverse([], []).
my_reverse([Head|Tail], Reverse) :- my_reverse(Tail, TailR), append(TailR, [Head], Reverse).

min(X, Y, What) :- X < Y, What is X.
min(Y, X, What) :- Y < X, What is Y.

smallest([Head|[]], Head).
smallest([Head|Tail], Answer) :- 
  smallest(Tail, What),
  min(What, Head, Answer).

sort(List, Sorted) :- perm(List, Sorted), is_sorted(Sorted).
is_sorted([]).
is_sorted([Head]).
is_sorted([First,Second|Tail]) :- First =< Second, is_sorted([Second|Tail]).