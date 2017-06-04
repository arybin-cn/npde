function U=solve_by_abi(h,T,A,U0,order)
d=length(A);
I=eye(d);U=U0;AB={};
N=length(0:h:T);

%take order 1 as BE formular
AB{1}={inv(I-h*A)};
AB{2}={inv(I-(h/2)*A)*(I+(h/2)*A)};
AB{3}={inv(I-(5*h/12)*A)*(I+(8*h/12)*A)
       inv(I-(5*h/12)*A)*(-h/12)*A};

if order<1 | order>length(AB)
  fprintf('Error: order should be between 1 and %d\n',length(AB));
  return;
end

offset=length(AB{order});
if order>2
  U=solve_by_abe(h,(offset-1)*h,A,U0,order-1);
end

for i=1:N-offset
  UU=0;
  for j=1:offset
    UU=UU+AB{order}{j}*U(:,end-j+1);
  end
  U(:,end+1)=UU;
end
