include("/home/piotr/Documents/scientific-computing/list03/functions/exercise1.jl")
function given_function(x)
    return ℯ^x - 3*x
end
println(mbisekcji(given_function,1.0,2.0,10.0^(-4.0),10.0^(-4.0)))
