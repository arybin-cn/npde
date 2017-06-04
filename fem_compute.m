function Y=fem_compute(C,U,X)
dimension=length(U);Y=[];
if length(C)!=dimension
  error('Incompatible dimension!')
  return;
end

for i=1:length(X)
  Y(i)=0;
  for j=1:dimension
    Y(i)=Y(i)+U{j}(X(i))*C(j);
  end
end
