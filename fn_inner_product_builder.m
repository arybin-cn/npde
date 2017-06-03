function fn=fn_inner_product_builder(a,b)
fn=@(fn_a,fn_b) quad(fn_multiply(fn_a,fn_b),a,b);
