format long;
a=0;b=1;fn_dS=@(x) (9/4)*x-3/2;
fn_S36=@(x) ((1-(3/2)*x+(9/8)*x.^2).^3)/6;

ip3=fn_inner_product_builder(a,b,3);
ip2=fn_inner_product_builder(a,b,2);

%Assume (-,-) as function inner product, then:
%A(i,j)=(integral Ui'Vj'S^3/6)
stf_matrix_builder=@(i,j,U,dU) ip3(fn_S36,dU{j},dU{i});
%F(i)=-(S',Vi)
rhs_vector_builder=@(i,U,dU) -ip2(fn_dS,U{i});
%Use normal Sobolev 1/2-order polynominal
base_builder_p1=base_fn_builder(a,b,@base_fn_p1);
base_builder_p2=base_fn_builder(a,b,@base_fn_p2);

figure;
for k=1:4
  h=0.2/k;
  [C_p1,U_p1]=fem_framework(stf_matrix_builder,...
  rhs_vector_builder,base_builder_p1,h);
  [C_p2,U_p2]=fem_framework(stf_matrix_builder,...
  rhs_vector_builder,base_builder_p2,h);

  X=a:0.01:b;
  Y_p1=fem_compute(C_p1,U_p1,X);
  Y_p2=fem_compute(C_p2,U_p2,X);
  subplot(4,2,(k-1)*2+1);
  scatter(X,Y_p1,'*','r');
  title(sprintf('P1-FEM with h=%.3f',h));
  subplot(4,2,(k-1)*2+2);
  scatter(X,Y_p2,'p','g');
  title(sprintf('P2-FEM with h=%.3f',h));
end

set(gcf,'PaperUnits','Inches','PaperPosition',[0 0 10 20]);
print('-djpeg','-r100','ex25');
