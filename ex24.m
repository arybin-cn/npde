format long;
h=0.1;
A=[];F=[];C=[];
ep=0.1;beta=10;
figure;
[U,V]=base_fn_p1(0,1,h);
dimension=length(U);

fn_ep=@(x) ep;
fn_beta=@(x) beta;

p=fn_inner_product_builder(0,1);
for i=1:dimension
    for j=1:dimension
      A(i,j)=p(fn_multiply(fn_ep,V{i}),V{j})+...
      p(fn_multiply(fn_beta,V{j}),U{i});
  end
end

for j=1:dimension
  F(j)=-p(fn_beta,U{j});
end

C=A\F';

fn_exact=@(x) (exp(beta*x/ep)-1)./(exp(beta/ep)-1);
X=0:0.001:1;
Y_EXACT=fn_exact(X);
Y_FEM=[];
for i=1:length(X)
  Y_FEM(i)=X(i);
  for j=1:dimension
    Y_FEM(i)=Y_FEM(i)+U{j}(X(i))*C(j);
  end
end
scatter(X,Y_EXACT,'o','g');hold on;
scatter(X,Y_FEM,'*','r');hold on;
norm(Y_EXACT-Y_FEM,2)

saveas(gcf,'ex24.png');
