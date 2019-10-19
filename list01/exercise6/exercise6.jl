#=
Piotr Popis
=#
function f(FTP,x)
return FTP(FTP(sqrt(FTP(FTP(FTP(x)*FTP(x))+FTP(1.0))))-FTP(1.0))
end

function g(FTP,x)
    return FTP(FTP(FTP(x)*FTP(x))/FTP(FTP(sqrt(FTP(FTP(FTP(x)*FTP(x))
    +FTP(1.0))))+FTP(1.0)))
end

function printer(FTP, func,fun)
    k=1.0
    println("-------",func,"--------",FTP,"---------",fun,"---------")
    while (func(FTP,((8.0)^(-k)))!=0.0 || fun(FTP,((8.0)^(-k)))!=0.0)
    println(func(FTP,((8.0)^(-k)))," : ",fun(FTP,((8.0)^(-k))))
            k+=1
    end
end

printer(Float32,f,g)
printer(Float64,f,g)
