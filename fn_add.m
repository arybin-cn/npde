function fn=fn_add(fn_a,fn_b)
fn=@(arg) fn_a(arg)+fn_b(arg);
