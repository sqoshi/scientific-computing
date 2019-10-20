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

        println("DERIVATIVE : |DERIVATIVE(x)-DERIVATIVE(fl(X))| : 1+h")
        for i in 0:p
                h=(2.0)^(-i)
                d=derivative(f,x,h)
                println(i," : ",d," : ",abs(d-f_derivative(1.0))," : ",(1.0+h))
end
end

printer(54,Float64(1.0))
