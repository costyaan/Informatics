unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    AX: TEdit;
    Button4: TButton;
    Button5: TButton;
    BX: TEdit;
    AY: TEdit;
    CX: TEdit;
    BY: TEdit;
    CY: TEdit;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  A,B,C,O: Tpoint;

implementation

{$R *.lfm}


{ TForm1 }
 function GetDist(P1: TPoint; P2: TPoint): Real;
begin
  GetDist := sqrt(sqr(P1.X - P2.X) + sqr(P1.Y - P2.Y));
end;

procedure findToc;
var
  mab,mbc,mca,Vab,Vbc,Vca,T1,T2,T3,T4:TPoint;
  T:real;
begin
    mab.x:=(B.x+A.x)div 2;
    mab.y:=(B.y+A.y)div 2;
    mbc.x:=(C.x+B.x)div 2;
    mbc.y:=(C.y+B.y)div 2;
    mca.x:=(A.x+C.x)div 2;
    mca.y:=(A.y+C.y)div 2;

    Vab.y:=-(B.x-A.x);
    Vab.x:=(B.y-A.y);
    Vbc.y:=-(C.x-B.x);
    Vbc.x:=(C.y-B.y);
    {Vca.y:=-(A.x-C.x);
    Vca.x:=(A.y-C.y);}

    T1.x:=mab.x+Vab.x;
    T1.y:=mab.y+Vab.y;
    T2.x:=mab.x-Vab.x;
    T2.y:=mab.y-Vab.y;
    T3.x:=mbc.x+Vbc.x;
    T3.y:=mbc.y+Vbc.y;
    T4.x:=mbc.x-Vbc.x;
    T4.y:=mbc.y-Vbc.y;

    T:=((T1.x-T3.x)*(T3.y-T4.y)-(T1.y-T3.y)*(T3.x-T4.x))/((T1.x-T2.x)*(T3.y-T4.y)-(T1.y-T2.y)*(T3.x-T4.x));
    O.x:=round(T1.x+T*(T2.x-T1.x));
    O.y:=round(T1.y+T*(T2.y-T1.y));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   A.x:=strtoint(AX.Text);
   A.y:=strtoint(AY.Text);
   B.x:=strtoint(BX.Text);
   B.y:=strtoint(BY.Text);
   C.x:=strtoint(CX.Text);
   C.y:=strtoint(CY.Text);


   {Image1.Canvas.Brush.Style := bsSolid;
  Image1.Canvas.Pen.Style := psSolid;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Pen.Width := 1;
  }
  with Image1.Canvas do
  begin
    Pen.Color := clBlue;
    Pen.Width := 3;

    MoveTo(A);
    LineTo(B);
    LineTo(C);
    LineTo(A);

    Pen.Width := 1;
    Brush.Color := RGBToColor(220, 20, 60);

    Ellipse(A.X - 5, A.Y - 5, A.X + 5, A.Y + 5);
    Ellipse(B.X - 5, B.Y - 5, B.X + 5, B.Y + 5);
    Ellipse(C.X - 5, C.Y - 5, C.X + 5, C.Y + 5);

    Brush.Style := bsClear;
    TextOut(A.X, A.Y, 'A');
    TextOut(B.X, B.Y, 'B');
    TextOut(C.X, C.Y, 'C');
end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  mab,mbc,mca,Vab,Vbc,Vca,T1,T2,T3,T4:TPoint;
  T:real;
begin
  with Image1.Canvas do
  begin
    A.x:=strtoint(AX.Text);
    A.y:=strtoint(AY.Text);
    B.x:=strtoint(BX.Text);
    B.y:=strtoint(BY.Text);
    C.x:=strtoint(CX.Text);
    C.y:=strtoint(CY.Text);

    begin               //нахождение середины отрезка
    mab.x:=(B.x+A.x)div 2;
    mab.y:=(B.y+A.y)div 2;
    mbc.x:=(C.x+B.x)div 2;
    mbc.y:=(C.y+B.y)div 2;
    mca.x:=(A.x+C.x)div 2;
    mca.y:=(A.y+C.y)div 2;

    Pen.Width := 1;
    Brush.Color := RGBToColor(20, 220, 60);

    Ellipse(mab.X - 5, mab.Y - 5, mab.X + 5, mab.Y + 5);
    Ellipse(mbc.X - 5, mbc.Y - 5, mbc.X + 5, mbc.Y + 5);
    Ellipse(mca.X - 5, mca.Y - 5, mca.X + 5, mca.Y + 5);
    end;

    Vab.y:=-(B.x-A.x);
    Vab.x:=(B.y-A.y);
    Vbc.y:=-(C.x-B.x);
    Vbc.x:=(C.y-B.y);
    {Vca.y:=-(A.x-C.x);
    Vca.x:=(A.y-C.y);}

    T1.x:=mab.x+Vab.x;
    T1.y:=mab.y+Vab.y;
    T2.x:=mab.x-Vab.x;
    T2.y:=mab.y-Vab.y;
    T3.x:=mbc.x+Vbc.x;
    T3.y:=mbc.y+Vbc.y;
    T4.x:=mbc.x-Vbc.x;
    T4.y:=mbc.y-Vbc.y;

    T:=((T1.x-T3.x)*(T3.y-T4.y)-(T1.y-T3.y)*(T3.x-T4.x))/((T1.x-T2.x)*(T3.y-T4.y)-(T1.y-T2.y)*(T3.x-T4.x));
    O.x:=round(T1.x+T*(T2.x-T1.x));
    O.y:=round(T1.y+T*(T2.y-T1.y));

    Ellipse(O.X - 5, O.Y - 5, O.X + 5, O.Y + 5);
    moveto(O);
    lineto(mab);
    moveto(O);
    lineto(mbc);
    moveto(O);
    lineto(mca);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  R:real;
begin
   A.x:=strtoint(AX.Text);
   A.y:=strtoint(AY.Text);
   B.x:=strtoint(BX.Text);
   B.y:=strtoint(BY.Text);
   C.x:=strtoint(CX.Text);
   C.y:=strtoint(CY.Text);
   findToc;

   R:=GetDist(A,O);

   with Image1.Canvas do
  begin
    Pen.Width := 1;
    Pen.Color := RGBToColor(8, 80, 0);
    Image1.Canvas.Brush.Style :=bsClear;
    Ellipse(O.X + round(R), O.Y + round(R), O.X - round(R), O.Y - round(R));
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   Image1.Canvas.Brush.Color := clWhite;
   Image1.Canvas.Rectangle(0, 0, 540, 596);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   Image1.Canvas.Brush.Color := clWhite;
   Image1.Canvas.Rectangle(0, 0, 540, 596);
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

end.

