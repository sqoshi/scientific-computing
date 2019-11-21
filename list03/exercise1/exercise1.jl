function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
u=f(a)
v=f(b)
e=b-a
if (sign(u)==sign(u))
    println("error")
    return;
end
k=1;
while (e>epsilon)
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
function functionLin(x)
    return x - 5
end
 mbisekcji(functionLin,8.0,10.0,(10.0)^(-16), (10.0)^(-16))
