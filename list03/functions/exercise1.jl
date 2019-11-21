function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
M=100
u=f(a)
v=f(b)
err = 0
e=Float64(b-a)
    if (sign(u)==sign(v))
        err = 1
        return (NaN,NaN,NaN,err)
    end
    for k in 1:M
        e/=2
        c=a+e
        w=f(c)
        if(abs(e)<delta || abs(w)<epsilon)
            return c,w,k,err
        end
        if (sign(w) != sign(u))
            b=c
            v=w
        else
            a=c
            u=w
        end
    end
end
