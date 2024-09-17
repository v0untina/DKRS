unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  edit1.clear;
  edit2.clear;
  edit3.clear;
  edit4.clear;
  edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
 var r, n,a,b,d,S: real;
begin
  r:=strtofloat(edit1.text);
  n:=strtofloat(edit2.text);
  d:=2*r;
  a:=sqrt(d*d/(1+n*n));
  b:=a*n;
  S:=a*b;
  edit3.Text:= floattostr(d);
  edit4.Text:= floattostr(S);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.

