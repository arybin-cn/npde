format long;
a=0;b=1;ep=0.1;beta=5;

ip2=fn_inner_product_builder(a,b,2);
ip1=fn_inner_product_builder(a,b,1);

stf_matrix_builder=@(i,j,U,dU) ep*ip2(dU{i},dU{j})+beta*ip2(U{i},dU{j});
rhs_vector_builder=@(i,U,dU) -beta*ip1(U{i});

base_builder_p1=base_fn_builder(a,b,@base_fn_p1);
base_builder_p2=base_fn_builder(a,b,@base_fn_p2);

for k=1:4
  h=0.14/(2*k-1);
  [C_p1,U_p1]=fem_framework(stf_matrix_builder,...
  rhs_vector_builder,base_builder_p1,h);
  [C_p2,U_p2]=fem_framework(stf_matrix_builder,...
  rhs_vector_builder,base_builder_p2,h);

  X=a:0.005:b;
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
print('-djpeg','-r100','ex24');
