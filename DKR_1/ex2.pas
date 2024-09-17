program ex2;
var x: real;
begin
   x:=-10;
while x<=-1 do 
  begin
  if x<-8 then 
    writeln ('y = ',cos(2*x)*77:1:2) else 
    if x<1 then
       writeln ('y = ', exp(x)/-x:1:2) else
      if x>=1 then 
        writeln ('y = ',power(0,1*x)*tan(x)-cos(2*x):1:2); 
            x:=x+0.2;
      end;
end.