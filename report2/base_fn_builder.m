function fn=base_fn_builder(a,b,inner_base_fn)
fn=@(h) inner_base_fn(a,b,h);
