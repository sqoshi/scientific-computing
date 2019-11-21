function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
M=100
u=f(a)
v=f(b)
e=b-a
if (sign(u)==sign(u))
    println("error")
    return;
end
for k in 1:M
    k+=1;
    e/=2
    c=a+e
    w=f(c)
    if(abs(e)<delta || abs(w)<epsilon)
        println(k," ",c," ",w)
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
function linear_function(x)
    return x-2
end
 mbisekcji(linear_function,8.0,10.0,(10.0)^(-16), (10.0)^(-16))
