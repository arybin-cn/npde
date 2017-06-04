function fn=fn_multiply(fn_a,fn_b,fn_c)
fn=@(arg) fn_a(arg).*fn_b(arg).*fn_c(arg);
