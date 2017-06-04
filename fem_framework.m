function [C,U]=fem_framework(stf_matrix_builder,
                                 rhs_vector_builder,
                                 base_fn_builder,
                                 a,b,h)

A=[];F=[];C=[];
[U,dU]=base_fn_builder(a,b,h);
dimension=length(U);

for i=1:dimension
    for j=1:dimension
      A(i,j)=stf_matrix_builder(i,j,U,dU);
  end
end

for i=1:dimension
  F(i)=rhs_vector_builder(i);
end

C=A\F';
