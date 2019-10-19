#piotr Popis
function derivative(func,x,h)
        return ((func(x+h)-func(x))/h)
end

function f(x)
return sin(x)+cos(3.0*x)
end

function f_derivative(x)
    return cos(x) - 3*sin(3*x)
end

function printer(p,x)

        d=f_derivative(x)
        println(p," ",d)
        for i in 0:p
                h=Float64(2.0)^(-i)
                m=derivative(f,x,h)
                println("p:"m)
end
end

printer(54.0,Float64(1.0))
