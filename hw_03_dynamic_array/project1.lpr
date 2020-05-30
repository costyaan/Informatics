program project1;

uses Unit1;

var
  cur,i, j, N, M, vitok, mv:integer;
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
  for i:=1 to N do
     Setlength(mas[i],M);

  i:=1;
  j:=1;
  cur:=1;
  if N<M then
     mv:=N div 2
  else
     mv:=M div 2;
  for vitok:=0 to mv-1 do
  begin
     for j:=1+vitok to M-vitok-1 do
       begin
         mas[i,j]:=cur;
         updo;
       end;

     for i:=1+vitok to N-vitok-1 do
       begin
         mas[i,j]:=cur;
         updo;
       end;

      for j:=M-vitok downto 1+vitok+1 do
       begin
         mas[i,j]:=cur;
         updo;
       end;

      for i:=N-vitok to 1+vitok+1 do
       begin
         mas[i,j]:=cur;
         updo;
       end;
  end;


  for i:=1 to N do
   begin
   for j:=1 to M do
      write(mas[i,j],' ');
   writeln;
   end;
  readln;
end.
