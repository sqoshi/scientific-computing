include("/home/piotr/Documents/scientific-computing/list03/functions/exercise1.jl")
include("/home/piotr/Documents/scientific-computing/list03/functions/exercise2.jl")
include("/home/piotr/Documents/scientific-computing/list03/functions/exercise3.jl")
function given_function(x)
    return sin(x)-(0.5*x)^2
end

function derivative_given_function(x)
    return cos(x)-(0.25*2*x)
end

println(mbisekcji(given_function,1.5,2.0,0.5*(10.0)^(-5),0.5*(10.0)^(-5)))
println(mstycznych(given_function,derivative_given_function,1.5,0.5*(10.0)^(-5),0.5*(10.0)^(-5),50))
println(msiecznych(given_function,1.0,2.0,0.5*(10.0)^(-5),0.5*(10.0)^(-5),100))
