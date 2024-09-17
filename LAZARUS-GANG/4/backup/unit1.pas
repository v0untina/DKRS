unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  a, b, h, x, y: Integer;
begin
  // Получаем значения a, b и h из полей ввода
  a := StrToInt(Edit1.Text);
  b := StrToInt(Edit2.Text);
  h := StrToInt(Edit3.Text);

  // Очищаем Memo перед выводом новых значений
  Memo1.Clear;

  // Вычисляем значения функции и выводим их в Memo
  x := a; // Начальное значение x
  while x <= b do
  begin
    y := x * x; // Вычисляем значение функции y = x^2
    Memo1.Lines.Add(Format('x = %d, y = %d', [x, y])); // Добавляем строку с результатом в Memo
    x := x + h; // Увеличиваем x на шаг h
  end;
end;

end.

