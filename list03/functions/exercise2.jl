function mstycznych(f,pf,x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
v=f(x0)
err=0
    # If f' is almost zero err 2
    if abs(pf(x0)) < epsilon
        return NaN, NaN, NaN, 2
    end
    #if value of x0 is almost zero
    if (abs(v)<epsilon)
        err=2
        return x0,v,0,err
    end

    for k in 1:maxit
        x=x0-(v/pf(x0))
        v=f(x)
        if (abs(x-x0)<delta || abs(v)<epsilon)
            return x,v,k,err
        end
    x0=x
    end
    #cant find value in maxit
     return NaN, NaN, NaN, 1
end
