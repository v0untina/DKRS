const N=10;
var
    arr: array[1..N] of integer;
    i, num, j: byte;
begin
    for i:=1 to N do begin
        write ('Введите массив: ');
        read(arr[i]);
    end;
  writeln;
    num := 1;
    for j:=1 to N do 
        if abs(arr[j]) <= abs(arr[num]) then
            num := j;
    writeln('Минимальный элемент: ', arr[num]);
end.
