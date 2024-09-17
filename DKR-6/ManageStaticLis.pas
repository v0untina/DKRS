unit ManageStaticLis;

interface

uses crt;

procedure ManageStaticList;

implementation


const
  MAX_SIZE = 100;

type
  TNode = record
    Data: Integer;
    Prev, Next: Integer; 
  end;

  TList = record
    Nodes: array[1..MAX_SIZE] of TNode;
    Head, Tail: Integer; 
    Size: Integer; 
    FreePositions: array[1..MAX_SIZE] of Integer; 
    FreeCount: Integer; 
  end;

var
  List: TList;
  punkt, num, pos: integer;
  ch: integer;


procedure InitializeList(var L: TList);
var
  i: Integer;
begin
  L.Head := 0;
  L.Tail := 0;
  L.Size := 0;
  L.FreeCount := MAX_SIZE;
  for i := 1 to MAX_SIZE do
  begin
    L.Nodes[i].Prev := 0;
    L.Nodes[i].Data:= 0;
    L.Nodes[i].Next := 0;
    L.FreePositions[i] := i;
  end;
end;

function GetRandomFreePosition(var L: TList): Integer;
var
  Index: Integer;
begin
  if L.FreeCount = 0 then Exit;
  Index := Random(L.FreeCount) + 1;
  Result := L.FreePositions[Index];
  L.FreePositions[Index] := L.FreePositions[L.FreeCount];
  Dec(L.FreeCount);
end;

procedure ReturnPositionToFreeList(var L: TList; Position: Integer);
begin
  Inc(L.FreeCount);
  L.FreePositions[L.FreeCount] := Position;
end;

procedure InsertAtBeginning(var L: TList; Data: Integer);
var
  Pos: Integer;
begin
  Pos := GetRandomFreePosition(L);
  if Pos = 0 then Exit;
  L.Nodes[Pos].Data := Data;
  L.Nodes[Pos].Next := L.Head;
  L.Nodes[Pos].Prev := 0;
  if L.Head <> 0 then
    L.Nodes[L.Head].Prev := Pos
  else
    L.Tail := Pos;
  L.Head := Pos;
  Inc(L.Size);
end;

procedure InsertAtEnd(var L: TList; Data: Integer);
var
  Pos: Integer;
begin
  Pos := GetRandomFreePosition(L);
  if Pos = 0 then Exit;
  L.Nodes[Pos].Data := Data;
  L.Nodes[Pos].Prev := L.Tail;
  L.Nodes[Pos].Next := 0;
  if L.Tail <> 0 then
    L.Nodes[L.Tail].Next := Pos
  else
    L.Head := Pos;
  L.Tail := Pos;
  Inc(L.Size);
end;
procedure InsertAtPosition(var L: TList; Data, Position: Integer);
var
  PrevPos, NextPos, NewPos, i: Integer;
begin
  if (Position < 1) or (Position > L.Size + 1) then Exit;

  if Position = 1 then
    InsertAtBeginning(L, Data)
  else if Position = L.Size + 1 then
    InsertAtEnd(L, Data)
  else
  begin
    PrevPos := 0;
    NextPos := L.Head;
    i := 1;
    while (NextPos <> 0) and (i < Position) do
    begin
      PrevPos := NextPos;
      NextPos := L.Nodes[NextPos].Next;
      Inc(i);
    end;
    NewPos := GetRandomFreePosition(L);
    if NewPos = 0 then Exit;
    L.Nodes[NewPos].Data := Data;
    L.Nodes[NewPos].Prev := PrevPos;
    L.Nodes[NewPos].Next := NextPos;
    L.Nodes[PrevPos].Next := NewPos;
    L.Nodes[NextPos].Prev := NewPos;
    Inc(L.Size);
  end;
end;

procedure DeleteAtPosition(var L: TList; Position: Integer);
var
  PrevPos, NextPos, CurrentPos, i: Integer;
begin
  if (Position < 1) or (Position > MAX_SIZE) then Exit;
  CurrentPos := L.Head;
  i := 1;
  while (CurrentPos <> 0) and (i < Position) do
  begin
    CurrentPos := L.Nodes[CurrentPos].Next;
    Inc(i);
  end;

  if CurrentPos = 0 then Exit; 
  PrevPos := L.Nodes[CurrentPos].Prev;
  NextPos := L.Nodes[CurrentPos].Next;
  if PrevPos <> 0 then
    L.Nodes[PrevPos].Next := NextPos
  else
    L.Head := NextPos; 

  if NextPos <> 0 then
    L.Nodes[NextPos].Prev := PrevPos
  else
    L.Tail := PrevPos; 
  L.Nodes[CurrentPos].Data := 0;
  L.Nodes[CurrentPos].Prev := 0;
  L.Nodes[CurrentPos].Next := 0;
  ReturnPositionToFreeList(L, CurrentPos);
  Dec(L.Size);
end;



procedure PrintList(const L: TList);
var
  i, Current: Integer;
  PrevData, NextData: string;
begin
  ClrScr;
  if L.Size = 0 then
  begin
    WriteLn('{ Список пуст }');
    Exit;
  end;

  WriteLn('{');
  Current := L.Head;
  for i := 1 to L.Size do
  begin
    if L.Nodes[Current].Prev = 0 then
      PrevData := '*нет*'
    else
      PrevData := IntToStr(L.Nodes[Current].Prev);
      
    if L.Nodes[Current].Next = 0 then
      NextData := '*нет*'
    else
      NextData := IntToStr(L.Nodes[Current].Next);
      
    WriteLn(i, '. [значение:', L.Nodes[Current].Data,
            ', предыдущий элемент:', PrevData,
            ', следующий элемент:', NextData, ']');
    Current := L.Nodes[Current].Next;
  end;
  WriteLn('}');
  readln;
end;


var
  Option, Data, Position: Integer;



procedure ManageStaticList;
begin
  InitializeList(List);
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
          InsertAtBeginning(List, num);
        end;
      2:
        begin
          clrscr;
          Write('Введите данные для добавления в конец: ');
          ReadLn(num);
          InsertAtEnd(List, num);
        end;
      3:
        begin
          clrscr;
          Write('Введите позицию для вставки: ');
          ReadLn(pos);
          Write('Введите данные для добавления: ');
          ReadLn(num);
          InsertAtPosition(List, num, pos);
        end;
      4:
        begin
          clrscr;
          Write('Введите позицию для удаления: ');
          ReadLn(num);
          DeleteAtPosition(List, num);
        end;
      5: PrintList(List);
      6: InitializeList(List);
      7: Exit;
      end;
  until ch = 7; 
end;
end.

