function point=Random_Point(m,n)

i = randi([2 m-1]);
j = randi([2 n-1]);

point=[i;j];

end