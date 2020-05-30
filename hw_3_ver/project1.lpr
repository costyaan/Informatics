program project1;
var i,N,j,num:integer;
  A,B:REAL;
  mas:array of real;

begin
   write('enter N ');
   readln(N);
   setlength(mas,N);

   writeln('enter A and B');
   readln(A,B);

   writeln('enter elements');
   for i:=0 to length(mas)-1 do
     readln(mas[i]);
   writeln('...');

   j:=0;
   num:=0;

   for i:=0 to N-1 do
   begin
     if mas[i]<=(B+0.001) then
       if mas[i]>(A-0.001) then
         begin
         mas[j]:=mas[i];
         j:=j+1;
         num:=num+1;
         end;
   end;
   setlength(mas,num);


   for i:=0 to length(mas)-1 do
     write(mas[i]:4:4,' ');
   readln;
end.
