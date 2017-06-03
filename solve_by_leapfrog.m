function U=solve_by_leapfrog(h,T,A,U0)
d=length(A);N=length(0:h:T);
I=eye(d);U=U0;M={};
U(:,end+1)=(I+h*A)*U(:,end);
M={2*h*A I};
for i=1:N-2
  UU=0;
  for j=1:length(M)
    UU=UU+M{j}*U(:,end-j+1);
  end
  U(:,end+1)=UU;
end
