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

function linear_function(x)
return x*x-5x
end

function derrivative(x)
return 2x-5
end
println(mstycznych(linear_function,derrivative,18.0,(10.0)^(-16), (10.0)^(-16),20))
