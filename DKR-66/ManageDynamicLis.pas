unit ManageDynamicLis;

interface

uses crt;

procedure ManageDynamicList;

implementation
  
type
  PNode = ^Node;
  Node = record
    num: integer;
    next, prev: PNode;
  end;

var
  Head, Tail: PNode;

procedure InsertAtBeginning(num: integer);
var
  newNode: PNode;
begin
  New(newNode);
  newNode^.num := num;
  newNode^.next := Head;
  newNode^.prev := nil;
  if Head <> nil then
    Head^.prev := newNode;
  Head := newNode;
  if Tail = nil then
    Tail := Head;
end;

procedure InsertAtEnd(num: integer);
var
  newNode: PNode;
begin
  New(newNode);
  newNode^.num := num;
  newNode^.next := nil;
  newNode^.prev := Tail;
  if Tail <> nil then
    Tail^.next := newNode;
  Tail := newNode;
  if Head = nil then
    Head := Tail;
end;

procedure InsertAtPosition(num: integer; position: integer);
var
  newNode, temp: PNode;
  i: integer;
begin
  if position = 1 then
  begin
    InsertAtBeginning(num);
    Exit;
  end;

  New(newNode);
  newNode^.num := num;
  temp := Head;
  for i := 2 to position - 1 do
  begin
    if temp = nil then Exit;
    temp := temp^.next;
  end;

  if temp = nil then
  begin
    InsertAtEnd(num);
    Exit;
  end;

  newNode^.next := temp^.next;
  newNode^.prev := temp;
  if temp^.next <> nil then
    temp^.next^.prev := newNode;
  temp^.next := newNode;
end;

procedure DeleteAtPosition(position: integer);
var
  temp: PNode;
  i: integer;
begin
  if Head = nil then Exit;

  temp := Head;
  for i := 1 to position - 1 do
  begin
    if temp = nil then Exit;
    temp := temp^.next;
  end;

  if temp = nil then Exit;

  if temp^.prev <> nil then
    temp^.prev^.next := temp^.next
  else
    Head := temp^.next;

  if temp^.next <> nil then
    temp^.next^.prev := temp^.prev
  else
    Tail := temp^.prev;

  Dispose(temp);
end;

procedure ClearList;
var
  temp: PNode;
begin
  while Head <> nil do
  begin
    temp := Head;
    Head := Head^.next;
    Dispose(temp);
  end;
  Tail := nil;
end;

procedure PrintList;
var
  temp: PNode;
  i: Integer;
  PrevData, NextData: string;
begin
  ClrScr;
  if Head = nil then
  begin
    WriteLn('{ Список пуст }');
    Exit;
  end;

  WriteLn('{');
  temp := Head;
  i := 1;
  while temp <> nil do
  begin

    WriteLn(i, '. [значение:', temp^.num, ', предыдущий элемент:', temp^.prev, ', следующий элемент:', temp^.next, ']');
    temp := temp^.next;
    Inc(i);
  end;
  WriteLn('}');
  ReadLn; 
end;


var
  choice: integer;
  num: integer;
  position: integer;

  ch: integer;
  

procedure ManageDynamicList;
begin
  repeat
    writeln('1. Добавить элемент в начало');
    writeln('2. Добавить элемент в конец');
    writeln('3. Добавить элемент в середину');
    writeln('4. Удалить элемент');
    writeln('5. Печать списка');
    writeln('6. Очистка списка');
    writeln('7. выход');
    Readln(ch);
    case ch of
      1:
        begin
          clrscr;
          Write('Введите данные для добавления в начало: ');
          ReadLn(num);
          InsertAtBeginning(num);
        end;
      2:
        begin
          clrscr;
          Write('Введите данные для добавления в конец: ');
          ReadLn(num);
          InsertAtEnd(num);
        end;
      3:
        begin
          clrscr;
          Write('Введите позицию для вставки: ');
          ReadLn(position);
          Write('Введите данные для добавления: ');
          ReadLn(num);
          InsertAtPosition(num, position);
        end;
      4:
        begin
          clrscr;
          Write('Введите позицию для удаления: ');
          ReadLn(num);
          DeleteAtPosition(num);
        end;
      5: PrintList;
      6: ClearList;
      7: Exit;
    end;
  until ch = 7;
end;
begin
  
end.
