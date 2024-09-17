unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    zakr: TBitBtn;
    prost: TButton;
    sbros: TButton;
    sloj: TButton;
    sum: TEdit;
    proc: TEdit;
    kollet: TEdit;
    p2: TEdit;
    p3: TEdit;
    res: TEdit;
    p4: TEdit;
    p1: TLabel;
    pervsum: TLabel;
    proc1: TLabel;
    let: TLabel;
    name1: TStaticText;
    procedure letClick(Sender: TObject);
    procedure name1Click(Sender: TObject);
    procedure zakrClick(Sender: TObject);
    procedure prostClick(Sender: TObject);
    procedure sbrosClick(Sender: TObject);
    procedure slojClick(Sender: TObject);
    procedure sumChange(Sender: TObject);

    procedure sumKeyPress(Sender: TObject; var Key: char);
    procedure procChange(Sender: TObject);
    procedure procKeyPress(Sender: TObject; var Key: char);
    procedure kolletChange(Sender: TObject);
    procedure kolletKeyPress(Sender: TObject; var Key: char);
    procedure p2Change(Sender: TObject);
    procedure resChange(Sender: TObject);
    procedure p1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.p1Click(Sender: TObject);
begin

end;

procedure TForm1.p2Change(Sender: TObject);
begin

end;

procedure TForm1.resChange(Sender: TObject);
begin

end;

procedure TForm1.zakrClick(Sender: TObject);
begin
  form1.close
end;

procedure TForm1.name1Click(Sender: TObject);
begin

end;

procedure TForm1.letClick(Sender: TObject);
begin

end;

procedure TForm1.prostClick(Sender: TObject);
var x,z,q:real;
  y: Real;

begin
  x:=strtofloat(sum.text);
  y:=strtofloat(proc.text)/100;
  z:=strtofloat(kollet.text);
  q := ((1+y*z/100)**x);
  res.text := SimpleRoundTo(q,-2);
  res.text:=floattostr(res.text)
end;

procedure TForm1.sbrosClick(Sender: TObject);
begin
  sum.text:='';
  proc.text:='';
  kollet.text:='';
end;

procedure TForm1.slojClick(Sender: TObject);
var x,z:real;
  y: Real;
begin
   x:=strtofloat(sum.text);
  y:=strtofloat(proc.text)/100;
  z:=strtofloat(kollet.text);
  res.text := floattostr(x*(1+y/100)**z)

end;

procedure TForm1.sumChange(Sender: TObject);
begin

end;


procedure TForm1.sumKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TForm1.procChange(Sender: TObject);
begin

end;

procedure TForm1.procKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TForm1.kolletChange(Sender: TObject);
begin

end;

procedure TForm1.kolletKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8])then Key:=#0;
end;

end.

