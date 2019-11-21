function msiecznych(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64,maxit::Int)
    fa=f(a)
    fb=f(b)
    err=0
    for k in 1:maxit
        if (abs(fa)>abs(fb))
            a,b = b,a
            fa,fb = fb,fa
        end
        s=(b-a)/(fb-fa)
        b=a
        fb=fa
        a=a-(fa*s)
        fa=f(a)
        if (abs(b-a)<delta || abs(fa)<epsilon)
            return a,fa,k,err
        end
    end
       return NaN, NaN, NaN, 1
end
