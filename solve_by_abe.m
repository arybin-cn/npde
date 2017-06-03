function U=solve_by_abe(h,T,A,U0,order)
d=length(A);
I=eye(d);U=U0;AB={};
N=length(0:h:T);

AB{1}={I+h*A};
AB{2}={I+(3*h/2)*A (-h/2)*A};
AB{3}={I+(23*h/12)*A (-16*h/12)*A (5*h/12)*A};

if order<1 | order>length(AB)
  fprintf('Error: order should be between 1 and %d\n',length(AB));
  return;
end

offset=length(AB{order});
if order>1
  U=solve_by_abe(h,(offset-1)*h,A,U0,order-1);
end

for i=1:N-offset
  UU=0;
  for j=1:offset
    UU=UU+AB{order}{j}*U(:,end-j+1);
  end
  U(:,end+1)=UU;
end
