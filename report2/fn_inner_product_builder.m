function fn=fn_inner_product_builder(a,b,d)
if d==1
fn=@(fn_a) quadgk(fn_a,a,b);
elseif d==2
fn=@(fn_a,fn_b) quadgk(fn_multiply(fn_a,fn_b),a,b);
elseif d==3
fn=@(fn_a,fn_b,fn_c) quadgk(fn_multiply3(fn_a,fn_b,fn_c),a,b);
end
