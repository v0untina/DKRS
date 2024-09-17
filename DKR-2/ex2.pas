var
a, b, c: string;
i, j, k, y: integer;
begin
  writeln('Введите строку: ');
  readln(a);
  writeln('Введите подстроку для инверсии: ');
  readln(b);

  i := 1;
while i <= length(a) do
  begin
    j := 1;
    k := i;
  while (j <= length(b)) and (k <= length(a)) and (a[k] = b[j]) do
  begin
    j := j + 1;
    k := k + 1;
  end;
  if j > length(b)then
  begin
    for y :=length(b) downto 1 do
      c := c + b[y];
      i := i + length(b);
  end
  else
    begin
    c := c + a[i];
    i := i + 1;
    end;
  end;
  writeln(c);
end. 