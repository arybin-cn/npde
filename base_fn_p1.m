function [U,dU,radius]=base_fn_p1(a,b,h)
U={};dU={};radius=1;
X=a:h:b;
len=length(X);
for i=2:len-1
  U{end+1}=@(x) (x>=X(i-1)&x<=X(i)).*(x-X(i-1))/h+...
              (x>X(i)&x<X(i+1)).*(X(i+1)-x)/h;

  dU{end+1}=@(x) (x>=X(i-1)&x<=X(i))/h+...
               (x>X(i)&x<X(i+1))/(-h);
end
