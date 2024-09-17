program ex1;
var x,y: real;
begin
  write ('x= ');
  read(x);
  if x<-8 then 
    y:=cos(2*x)*77
  else 
    if x<1 then
      y:=exp(x)/-x
    else
      if x>=1 then
        y:=power(0,1*x)*tan(x)-cos(2*x);
   writeln('y= ', y);
end.