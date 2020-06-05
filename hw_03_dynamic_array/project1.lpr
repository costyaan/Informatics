program project1;

var
  cur,i, j, N, M, vitok, mv, aht:integer;
  upyes:boolean;

  mas:array of array of integer;


procedure updo;
begin
  if cur = 9 then upyes:=false;
  if cur = 1 then upyes:=true;
  if upyes = true then
  begin
    cur:=cur+1;
  end
  else
  begin
    cur:=cur-1;
  end;
end;

begin
  write('enter height: ');
  readln(N);
  write('enter width: ');
  readln(M);

  setlength(mas,N);
  for i:=0 to N-1 do
     Setlength(mas[i],M);

  i:=0;
  j:=0;
  cur:=1;

  if N<M then
     mv:=N div 2
  else
     mv:=M div 2;

  if (N mod 2 = 1) and (M mod 2 = 1) then aht:=1;

  for vitok:=0 to mv-1 do
  begin

     for j:=vitok to M-1-vitok do              //по верхнему ряду
       begin
         mas[i,j]:=cur;
         updo;
       end;

write('.');

     for i:=1+vitok to N-1-vitok do                //по правому ряду
       begin
         mas[i,j]:=cur;
         updo;
       end;

write('.');

      for j:=M-2-vitok downto vitok do                //по нижнему ряду
       begin
         mas[i,j]:=cur;
         updo;
       end;

write('.');

      for i:=N-2-vitok downto vitok+1 do                    //по левому ряду
       begin
         mas[i,j]:=cur;
         updo;
       end;

write('.');
  end;
vitok:=vitok+1;
if aht = 1 then
   mas[vitok,vitok]:=cur;

 writeln;

  for i:=0 to N-1 do
   begin
   for j:=0 to M-1 do
      write(mas[i,j],' ');
   writeln;
   end;
  readln;
end.
