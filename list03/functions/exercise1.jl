function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
M=100
u=f(a)
v=f(b)
e=Float64(b-a)
if (sign(u)==sign(v))
    err = 1
    return (-1,-1,-1,err)
end
for k in 1:M
    k+=1;
    e/=2
    c=a+e
    w=f(c)
    if(abs(e)<delta || abs(w)<epsilon)
        return k,c,w
    end
    if (sign(w)!=sign(u))
        b=c
        v=w
    else
        a=c
        u=w
    end
end
end
