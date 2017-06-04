format long;
h=200;m=10000;
A=[];F=[];C=[];
figure;
[U,V]=base_fn_p1(0,m+h,h);
dimension=length(U);
disp(dimension);

p=fn_inner_product_builder(0,m);
for i=1:dimension
    for j=1:dimension
      A(i,j)=p(fn_multiply(@(x) 10,V{i}),V{j})+...
             p(fn_multiply(@(x) 0.03,U{i}),V{j});
  end
end

for j=1:dimension
  F(j)=-0.03*U{j}(m);
end

C=A\F';

X=0:10:m;
Y_FEM=[];
for i=1:length(X)
  Y_FEM(i)=1;
  for j=1:dimension
    Y_FEM(i)=Y_FEM(i)+U{j}(X(i))*C(j);
  end
end
scatter(X,Y_FEM,'*','r');hold on;
saveas(gcf,'ex26.png');
