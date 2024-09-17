program MainProgram;

uses crt, ManageStaticLis, ManageDynamicLis;

var
  choice, punkt: integer;
  ch: integer;

begin
  repeat
    ClrScr;
    writeln('1. Двусвязный список на статической памяти');
    writeln('2. Двусвязный список на динамической памяти');
    writeln('3. Выход');
    readln(ch);
    case ch of
      1: ManageStaticList;
      2: ManageDynamicList;
      3: Exit
    end;
  until ch = 3;
end.
