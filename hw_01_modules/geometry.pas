unit Geometry;



interface
type
Point = record
x : Real;
y : Real;
end;

Triangle = record
A : Point;
B : Point;
C : Point;
end;

Line = record
  m1:point;
  m2:point;
end;

Circle = record
  O:point;
  R:real;
end;

function GetDistance(A,B:Point):Real;
function GetTrPer(T:Triangle):Real;
function GetTrSq(T:Triangle):Real;
function crossing(T:triangle;L1:line):boolean;
function GetClSqr(C:circle):real;
function GetClPer(C:circle):real;

implementation
function GetDistance(A,B:Point):Real;
begin
  GetDistance:=sqrt(sqr(A.x-B.x)+sqr(A.y-B.y));
end;

function GetTrPer(T:Triangle):Real;
var
  a1,a2,a3:real;
begin
  a1:=GetDistance(T.A,T.B);
  a2:=GetDistance(T.B,T.C);
  a3:=GetDistance(T.A,T.C);
  GetTrPer:=a1+a2+a3;
end;

function GetTrSq(T:Triangle):Real;
var
  a1,a2,a3,p:real;
begin
  a1:=GetDistance(T.A,T.B);
  a2:=GetDistance(T.B,T.C);
  a3:=GetDistance(T.A,T.C);
  p:=(a1+a2+a3)/2;
  GetTrSq:=sqrt(p*(p-a1)*(p-a2)*(p-a3));
end;

function crossing(T:triangle;L1:line):boolean;
var
  plus,minus:boolean;
  La,Lb,Lc,Ll,n:point;       // 4-й вектор Ll - эль эль
begin
  La.x:=L1.m1.x-T.A.x;
  La.y:=L1.m1.y-T.A.y;
  Lb.x:=L1.m1.x-T.B.x;
  Lb.y:=L1.m1.y-T.B.y;
  Lc.x:=L1.m1.x-T.C.x;
  Lc.y:=L1.m1.y-T.C.y;

  Ll.x:=L1.m2.x-L1.m1.x;
  Ll.y:=L1.m2.y-L1.m1.y;
  n.x:=1;
  n.y:=Ll.x/Ll.y;

 { if La.x*n.x+La.y*n.y < 0 then
    if Lb.x*n.x+Lb.y*n.y < 0 then
      if Lc.x*n.x+Lc.y*n.y < 0 then
        pr:=false
      else
        pr:=true
    else
      pr:=true
  else
  if La.x*n.x+La.y*n.y >= 0 then
    if Lb.x*n.x+Lb.y*n.y >= 0 then
      if Lc.x*n.x+Lc.y*n.y >= 0 then
        pr:=false
      else
        pr:=true
    else
      pr:=true;}

minus:=false;
plus:=false;

if La.x*n.x+La.y*n.y < 0 then
   minus:=true
else
   plus:=true;
if Lb.x*n.x+Lb.y*n.y < 0 then
   minus:=true
else
   plus:=true;
if Lc.x*n.x+Lc.y*n.y < 0 then
   minus:=true
else
   plus:=true;

if minus = plus then crossing:=true
else
crossing:=false;
end;

function GetClSqr(C:circle):real;
begin
  GetClSqr:=pi*sqr(C.R);
end;

function GetClPer(C:circle):real;
begin
   GetClPer:=2*C.R*pi;
end;













end.

