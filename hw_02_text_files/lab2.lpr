program lab2;

Uses SysUtils;
type
  inf = record
    t:integer;
    id:integer;
    ac:integer;
  end;

var
  T:array[1..30] of text;
  mas:array[1..90] of inf;
  TF:text;
  j,i,n,NUM,imax:integer;
  s:string;
  ennd:boolean;
  max:inf;

function take(ss:string):inf;
var
  i:integer;
  s1:string;
begin
  s1:=ss;
  for i:=1 to length(ss) do
    if ss[i] = ' ' then break;
  take.t:=strtoint(copy(s1,1,i-1));
  delete(s1,1,i);

  for i:=1 to length(ss) do
    if ss[i] = ' ' then break;
  take.id:=strtoint(copy(s1,1,i));
  delete(s1,1,i);
  writeln('...');
  take.ac:=strtoint(copy(s1,2,length(s1)-1));
end;

procedure clear(out per:inf);
begin
   per.t:=0;
   per.id:=0;
   per.ac:=0;
end;

begin
   writeln('enter number of files');
   readln(NUM);

   for i:=1 to NUM do
   begin
     s:='txt'+inttostr(i)+'.txt';
     assign(T[i],s);
     reset(T[i]);
     writeln(s);
   end;

   assign(TF,'txtf.txt');
   rewrite(TF);
   n:=1;
   ennd:=false;
   writeln;

   for i:=1 to NUM do
   begin
     readln(T[i],s);
     mas[i]:=take(s);
   end;

   while ennd = false do
   begin
   clear(max);
   for i:=1 to NUM do
   if mas[i].ac > max.ac then
     begin
     max:=mas[i];
     imax:=i;
     end;
   s:= inttostr(max.t)+' '+inttostr(max.id)+' '+inttostr(max.ac);
   writeln(s);
   write(TF,s);

   if eof(T[imax])=true then
     begin
     closefile(T[imax]);
     clear(mas[imax]);
     end
   else
     begin
     readln(T[imax],s);
     mas[imax]:=take(s);
     end;

   for j:=1 to NUM do
     if mas[j].ac >0 then n:=n+1;
   if n = 0 then ennd:=true;
   n:=0;
   if ennd = false then writeln(TF);
   end;



   closefile(TF);
   writeln('done');
   Readln;
end.
