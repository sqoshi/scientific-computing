function mstycznych(f,pf,x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
v=f(x0)
err=0
if (abs(v)<epsilon)
    err=2
return 0,x0,v,err
end

for k in 1:maxit
x=x0-(v/pf(x0))
v=f(x)
if (abs(x-x0)<delta || abs(v)<epsilon)
    return k,x,v,err
end
x0=x
end
end
