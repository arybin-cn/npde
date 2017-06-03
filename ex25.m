format long;
h=0.05;
A=[];F=[];C=[];
fn_S36=@(x) ((1-(3/2)*x+(9/8)*x.^2).^3)/6;
fn_SS=@(x) (9/4)*x-3/2;
figure;
[U,V]=base_fn_p1(0,1,h);
dimension=length(U);

p=fn_inner_product_builder(0,1);
for i=1:dimension
    for j=1:dimension
      A(i,j)=p(fn_multiply(fn_S36,V{j}),V{i});
  end
end

for j=1:dimension
  F(j)=-p(fn_SS,U{j});
end

C=A\F';

X=0:0.01:1;
Y_FEM=[];
for i=1:length(X)
  Y_FEM(i)=0;
  for j=1:dimension
    Y_FEM(i)=Y_FEM(i)+U{j}(X(i))*C(j);
  end
end
scatter(X,Y_FEM,'*','r');hold on;
saveas(gcf,'ex25.png');
