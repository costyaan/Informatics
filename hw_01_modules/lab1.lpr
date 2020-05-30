program lab1;

uses geometry;

var
  ty:integer;
  A,B,C:point;
  L:real;
  T:Triangle;
  L1:line;
  Cr:circle;

procedure  EntP(out A:point);
begin
  write('enter point x and y: ');
  readln(A.x,A.y);
end;

procedure EntT;
begin
  writeln('       ---point A---');
  EntP(A);
  T.A:=A;
  writeln('       ---point B---');
  EntP(B);
  T.B:=B;
  writeln('       ---point C---');
  EntP(C);
  T.C:=C;
end;

procedure EntL;
begin
  writeln('enter lines m1 and m2');
  EntP(A);
  L1.m1:=A;
  EntP(B);
  L1.m2:=B;
end;

procedure EntC;
begin
  WriteLn('Enter center and radius');
  EntP(Cr.O);
  write('radius: ');
  readln(Cr.R);
end;

procedure GetD;
begin
  writeln('---getting distance from A to B---');
  writeln('enter A');
  EntP(A);
  writeln('enter B');
  EntP(B);
  L:=GetDistance(A,B);
  Writeln('distance is ',L:4);
  writeln;
end;


begin
  Writeln('===Program Start===');
  WriteLn;
  Writeln('first of all, set a triangle, a line and a circle');
  EntT;
  EntL;
  EntC;
  while 1 > 0 do
  begin
       Writeln('choose action');
       Writeln('1) find a distance');
       Writeln('2) get triangle perimetr');
       Writeln('3) get a triangle square');
       Writeln('4) if triangle and line crossing?');
       Writeln('5) reset triangle, line and circle');
       Writeln('6) find circle perimetr');
       Writeln('7) find circle square');
       Writeln('8) exit?');
       Write('>>>>>');
       readln(ty);
       case ty of
       1: GetD;
       2: Writeln('current triangle perimeter is ',GetTrPer(T):2:2);
       3: Writeln('current triangle square is ',GetTrSq(T):2:2);
       4: if crossing(T,L1)=true then writeln('--true--') else writeln('--false--');
       5: begin EntT; EntL; EntC; end;
       6: writeln('length of circle is: ',GetClPer(Cr):2:2);
       7: writeln('square of circle is: ',GetClSqr(Cr):2:2);
       8: break;
       end;
       writeln;
  end;
  writeln('===To close a program press "Enter"===');
  readln;
end.
