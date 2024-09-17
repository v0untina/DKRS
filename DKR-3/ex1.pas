uses crt;
var a,b,nint,npryam,d,n:real;ch:char;sint,spr:boolean;h,f:integer;
//левые прямоугольники
function lpr(it:real):real;
begin
Result:=((it*it*it)+(it*it)-2*it-17);
end;
//интеграл
function integral(jt:real):real;
begin
Result:=(((jt*jt*jt*jt)/4)-(jt*jt)-17*jt);
end;
//enter
procedure enter;
begin
  writeln('Для выхода в основное меню нажмите <Enter>');
  repeat
    ch:=readkey;
  until ch= #13;
end;
//интеграловчкая площадь
procedure ssint;
begin
  nint:=integral(b)-integral(a);
  writeln('Площадь фигуры ограниченной прямой, вычисленная с помощью интеграла равна ',nint);
  sint:=True;
  enter;
end;
//прямоугольническая площадь
procedure sspryam;
begin
  var i:integer;
  npryam:=0;
  writeln('Введите кол-во прямоугольников:');
  read(h);
  d := (b-a)/h;
  n := a;
  for i:=0 to h do
  begin
    npryam:=npryam+((lpr(n)*d));
    n:=n+d;
  end;
  writeln('Площадь фигуры ограниченной прямой, вычисленная с помощью метода левых прямоугольников: ',npryam);
  spr:=True;
  enter;
end;
//сброс
procedure clear;
begin
  writeln('Введите новые значения a и b');
  readln(a,b);
  spr:=False;
  sint:=False;
  enter;
end;
//погрешность
procedure pogr;
begin
  if spr and sint then
    writeln('Погрешность:',nint-npryam)
  else
    writeln('Не все выполнено');
enter;
end;
//case-menu
begin
writeln('Впишите пределы интегрирования:');
  readln(a,b);
  repeat
    ClrScr;
    writeln('Пределы интегрирования [',a,' ; ',b,']');
    writeln('Выберите действие, которое хотите выполнить');
    writeln('0 - Выход из программы');
    writeln('1 – Методом интеграла');
    writeln('2 – Методом левых прямоугольников');
    writeln('3 – Оценка погрешности полученного результата между двумя методами');
    writeln('4 – Назначение других пределов');
    writeln(  );
    readln(f);
    case f of
     0: exit;
     1: ssint;
     2: sspryam;
     3: pogr;
     4: clear;
    end;
  until f = 0;
end.