function [C,U]=fem_framework(stf_matrix_builder,...
                             rhs_vector_builder,...
                             base_fn,h)
A=[];F=[];C=[];
[U,dU,r]=base_fn(h);
dimension=length(U);
for i=1:dimension
    for j=1:dimension
      if abs(i-j)>2*r
        A(i,j)=0;
        continue;
      end
      A(i,j)=stf_matrix_builder(i,j,U,dU);
  end
end
for i=1:dimension
  F(i)=rhs_vector_builder(i,U,dU);
end
C=A\F';
