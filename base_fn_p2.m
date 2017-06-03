function [U,UU]=base_fn_p2(a,b,h)
U={};UU={};
X=a:h/2:b;
len=length(X);

for i=2:2:len-1
  %f(x)=4(x-X(i-1))(1-(x-X(i-1))/h)/h
  U{end+1}=@(x) (x>=X(i-1)&x<=X(i))*4*(x-X(i-1))*(1-(x-X(i-1))/h)/h;
  %f'(x)=(4h-8(x-X(i-1)))/h^2
  UU{end+1}=@(x) (x>=X(i-1)&x<=X(i))*(4*h-8*(x-X(i-1)))/h^2;
end

for i=3:2:len-2
  %f(x)
  U{end+1}=@(x) (x>=X(i-1)&x<=X(i))*(2*(X(i)-x)/h-1)*((X(i)-x)/h-1)+...
                (x>X(i)&x<=X(i+1))*(2*(x-X(i))/h-1)*((x-X(i))/h-1);
  %f'(x)
  UU{end+1}=@(x) (x>=X(i-1)&x<=X(i))*(-4*X(i)+4*x+3*h)/h^2+...
                (x>X(i)&x<=X(i+1))*(4*x-4*X(i)-3*h)/h^2;
end
