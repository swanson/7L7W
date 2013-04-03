"---" println; "Fib(10)" println;
Math := Object clone;
Math fib := method(n, if(n <= 2) then(return 1) else(return Math fib(n-1) + Math fib(n-2)));

Math fib(10) println; // 55

"---" println; "Divide by zero" println;

Number divide_it := Number getSlot("/");
Number / := method(d, if(d == 0, 
                          "stop dividing by zero!!" println; return 0,
                          return self divide_it(d)));

(10 / 2) println;
(10 / 0) println;

"---" println; "2d list summing" println; 

List sum2d := method(
  return self flatten reduce(+);
);

list(1, 2, 4) sum2d println;
list(list(1, 2), list(3, 4)) sum2d println;

"---" println; "myAverage" println;

List myAverage := method(
  count := self reduce(+);
  size := self size;

  return (count / size);
);

list(10, 5, 5) myAverage println;

"---" println; "2d list" println;

Matrix := Object clone;
Matrix contents := list();
Matrix dim := method(x, y, 
  for(i, 0, x, 1,
    inner := list();

    for(j, 0, y, 1,
      inner append("Uninitialized");
    );

    (self contents) append(inner);
  );
  return self;
);

Matrix set := method(x, y, value,
  ((self contents) at(x)) atPut(y, value);
);

Matrix get := method(x, y,
  ((self contents) at(x)) at(y);
);

m := Matrix dim(2, 3);
m set(1, 1, "lawl");
m set(2, 2, 1337);
m get(1, 1) println;
m get(2, 2) println;
m get(0, 0) println;

"---" println; "Write/read matrix to file" println;

(File openForUpdating("foo.txt")) write (m serialized);

n := doFile("foo.txt");
n get(2, 2) println;