function [U,dU,radius]=base_fn_p2(a,b,h)
U={};dU={};radius=2;
X=a:h/2:b;
len=length(X);

U{1}=@(x) (x>=X(1)&x<X(3)).*(4*(x-X(1))).*(1-(x-X(1))/h)/h;
dU{1}=@(x) (x>=X(1)&x<X(3)).*(4*h-8*(x-X(1)))/h^2;

for i=4:2:len-1
  %f(x)
  U{end+1}=@(x) (x>=X(i-3)&x<=X(i-1)).*(2*(X(i-1)-x)/h-1).*((X(i-1)-x)/h-1)+...
                (x>X(i-1)&x<X(i+1)).*(2*(x-X(i-1))/h-1).*((x-X(i-1))/h-1);
  %f(x)=4(x-X(i-1))(1-(x-X(i-1))/h)/h
  U{end+1}=@(x) (x>=X(i-1)&x<X(i+1)).*(4*(x-X(i-1))).*(1-(x-X(i-1))/h)/h;

  %f'(x)
  dU{end+1}=@(x) (x>=X(i-3)&x<=X(i-1)).*(-4*X(i-1)+4*x+3*h)/h^2+...
                (x>X(i-1)&x<X(i+1)).*(4*x-4*X(i-1)-3*h)/h^2;

  %f'(x)=(4h-8(x-X(i-1)))/h^2
  dU{end+1}=@(x) (x>=X(i-1)&x<X(i+1)).*(4*h-8*(x-X(i-1)))/h^2;

end
